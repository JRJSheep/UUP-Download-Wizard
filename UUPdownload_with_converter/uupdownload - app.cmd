@echo off

::-------------------------------------------------------------------------------------------
:: 代理配置
::-------------------------------------------------------------------------------------------
:: 如果你需要配置一个代理服务器，以便能够连接到 Internet，
:: 那么你可以通过配置 all_proxy 环境变量来实现。
:: 默认情况下，此变量为空，即配置 aria2c 不使用任何代理。
::
:: 用法：set "all_proxy=proxy_address"
:: 示例：set "all_proxy=127.0.0.1:8888"
::
:: 有关如何使用的更多信息可以在以下网站找到：
:: https://aria2.github.io/manual/en/html/aria2c.html#cmdoption-all-proxy
:: https://aria2.github.io/manual/en/html/aria2c.html#environment

set "all_proxy="
::-------------------------------------------------------------------------------------------
:: 代理配置结束
::-------------------------------------------------------------------------------------------

cd /d "%~dp0"

color f0

call files\lang.cmd -en


::-------------------------------------------------------------------------------------------
:: 版本指示内容
::-------------------------------------------------------------------------------------------
set "Ver=4.6"
set "DispVersion=v%Ver%"
set "udBuild=850"
set "udRevision=1"
set LVer=1 && call :langver
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: SKU 版本指示
::-------------------------------------------------------------------------------------------
set "PurposeA=%PurposeA%"
set "PurposeB=%PurposeB%"
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 检查路径（不包括卷标）是否含有空格
::-------------------------------------------------------------------------------------------
if NOT "%cd%"=="%cd: =%" (
    echo %PathSpace1%
    echo %PathSpace2%
    echo.
    pause
    goto :EOF
)
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 管理员提权
::-------------------------------------------------------------------------------------------
if NOT "%cd%"=="%cd: =%" (
    echo %PathSpace1%
    echo %PathSpace2%
    echo.
    pause
    goto :EOF
)

if "[%1]" == "[49127c4b-02dc-482e-ac4f-ec4d659b7547]" goto :langselect
REG QUERY HKU\S-1-5-19\Environment >NUL 2>&1 && goto :langselect

set command="""%~f0""" 49127c4b-02dc-482e-ac4f-ec4d659b7547
SETLOCAL ENABLEDELAYEDEXPANSION
set "command=!command:'=''!"

powershell -NoProfile Start-Process -FilePath '%COMSPEC%' ^
-ArgumentList '/c """!command!"""' -Verb RunAs 2>NUL

IF %ERRORLEVEL% GTR 0 (
    echo =====================================================
    echo %Admin%
    echo =====================================================
    echo.
    pause
)

SETLOCAL DISABLEDELAYEDEXPANSION
goto :EOF
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 语言选择
::-------------------------------------------------------------------------------------------
:langselect
title %langchoose% - %PurposeB%

echo %line%
echo %langwelcome%
echo %line%
echo.
echo.
echo.
echo     1 - %lang1%
echo.
echo.
echo     2 - %lang2%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo %WizInfo%
echo %line2%
echo.%WizVer% %Ver% ^(%Build% %udBuild%.%udRevision%^)  %LangVer%%LVerMax%.%LMVerMax%
echo.%EditionApplicableDesA%%PurposeB%%EditionApplicableDesB%
echo.
echo ^(c^) 2016-2023 %CopyRight%
echo %VerDes%
echo %line2%
choice /c 12 /n /m "%dlangtxt%"
if errorlevel 2 (set dlang=2 & call :dlang)
if errorlevel 1 (set dlang=1 & call :dlang)
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 文件变量声明
::-------------------------------------------------------------------------------------------
set "aria2=files\aria2c.exe"
set "aria2Script=files\aria2_script.%random%.txt"
set "a7z=files\7zr.exe"
set "uupConv=files\uup-converter-wimlib_%langconverter%.7z"
set "destDir=UUPs"
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 版本类型控制，不应修改其中的任何内容
::-------------------------------------------------------------------------------------------
set "PurposeA=%PurposeA%"
set "PurposeB=%PurposeB%"
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 步骤明细
::-------------------------------------------------------------------------------------------
set "WizTitle=%Title1%%Title2% %DispVersion%"
set "SelectLang=%SelectLang%"
set "SelectSKU1=%SelectSKU%"
set "SelectSKUGroup=%SelectSKUGroup%"
set "UnsupportedSKU=%UnsupportedSKU%"
set "UnsupportedLang=%UnsupportedLang%"
set "WriteBuildID=%WriteBuildID%"
set "SelectTeamID=%SelectTeamID%"
set "SearchUpdScript=%SearchUpdScript%"
set "DLUUPFiles=%DLUUPFiles%"
set "FoundError=%FoundError%"
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 网络预先设置
::-------------------------------------------------------------------------------------------
title %WizTitle% - %PurposeB%

:first
cls
if exist aria2_download.log del /s /q aria2_download.log
if exist files\aria2_script.*.txt del /s /q files\aria2_script.*.txt
if exist Remove_Failure_MountDir.cmd del /s /q Remove_Failure_MountDir.cmd
if exist ReadMe.html del /s /q \ReadMe.html
if exist multi_arch_iso.cmd del /s /q multi_arch_iso.cmd
if exist create_virtual_editions.cmd del /s /q create_virtual_editions.cmd
if exist convert-UUP.cmd del /s /q convert-UUP.cmd
if exist bin rd /s /q bin

cls
echo %line%
echo %WelcomeTitle%
echo %line%
echo %WelDes%
echo.
echo.
echo.
echo.    A - %Def%
echo.
echo.    B - %Alter%
echo.
echo.    C - %StartSite%
echo.
echo.
echo.
echo.
echo.
echo.
echo.%WizInfo%
echo.%line2%
echo.%WizVer% %Ver% ^(%Build% %udBuild%.%udRevision%^)  %LangVer%%LVerMax%.%LMVerMax%
echo.%EditionApplicableDesA%%PurposeB%%EditionApplicableDesB%
echo.
echo.^(c^) 2016-2023 %CopyRight%
echo.%VerDes%
echo.
echo.%line%
choice /c ABC /n /m "%TxtDes1%"
if errorlevel 3 (start https://uupdump.net/known.php?lang=zh-cn&goto :first)
if errorlevel 2 (set "cert=--check-certificate=false "&goto :second)
if errorlevel 1 (set "cert= "&goto :second)
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 选择平台适用版本
::-------------------------------------------------------------------------------------------
:second
cls
title %WizTitle% - %PurposeB% - %SelectPlat%

echo %line%
echo.%PlatTitle%
echo.%line%
echo.%PlatDescription%
echo.
echo.%line2%
echo.%ClientTypeDescription%
echo.
echo.    A - %ClientType%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.%StepDescription1%
echo.%line%
choice /c ACH /n /m "%TxtDes1%"
if errorlevel 3 goto :first
if errorlevel 2 goto :first
if errorlevel 1 goto :clientlang
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 选择客户端语言
::-------------------------------------------------------------------------------------------
:clientlang
cls
title %WizTitle% - %PurposeB% - %SelectClientLang%

echo.%line%
echo.%LangTitle%
echo.%line%
echo.%LangDes%
echo.
echo.%ListLang%
echo.%line3%
echo. 01 - %LangMenu01% ^| 14 - %LangMenu14% ^| 27 - %LangMenu27%
echo. 02 - %LangMenu02% ^| 15 - %LangMenu15% ^| 28 - %LangMenu28%
echo. 03 - %LangMenu03% ^| 16 - %LangMenu16% ^| 29 - %LangMenu29%
echo. 04 - %LangMenu04% ^| 17 - %LangMenu17% ^| 30 - %LangMenu30%
echo. 05 - %LangMenu05% ^| 18 - %LangMenu18% ^| 31 - %LangMenu31%
echo. 06 - %LangMenu06% ^| 19 - %LangMenu19% ^| 32 - %LangMenu32%
echo. 07 - %LangMenu07% ^| 20 - %LangMenu20% ^| 33 - %LangMenu33%
echo. 08 - %LangMenu08% ^| 21 - %LangMenu21% ^| 34 - %LangMenu34%
echo. 09 - %LangMenu09% ^| 22 - %LangMenu22% ^| 35 - %LangMenu35%
echo. 10 - %LangMenu10% ^| 23 - %LangMenu23% ^| 36 - %LangMenu36%
echo. 11 - %LangMenu11% ^| 24 - %LangMenu24% ^| 37 - %LangMenu37%
echo. 12 - %LangMenu12% ^| 25 - %LangMenu25% ^| 38 - %LangMenu38%
echo. 13 - %LangMenu13% ^| 26 - %LangMenu26% ^|
echo.
echo.
echo.
echo.
echo.
echo.%StepDescription2%
echo.%line%
set /p Lang=%TxtDes1%
if %Lang% geq 45 goto :unsupportlang
if %Lang% equ 38 (set Lang=zh-tw&goto :chooseclientedition)
if %Lang% equ 37 (set Lang=zh-cn&goto :chooseclientedition)
if %Lang% equ 36 (set Lang=it-it&goto :chooseclientedition)
if %Lang% equ 35 (set Lang=en-gb&goto :chooseclientedition)
if %Lang% equ 34 (set Lang=en-us&goto :chooseclientedition)
if %Lang% equ 33 (set Lang=hu-hu&goto :chooseclientedition)
if %Lang% equ 32 (set Lang=he-il&goto :chooseclientedition)
if %Lang% equ 31 (set Lang=el-gr&goto :chooseclientedition)
if %Lang% equ 30 (set Lang=es-es&goto :chooseclientedition)
if %Lang% equ 29 (set Lang=es-mx&goto :chooseclientedition)
if %Lang% equ 28 (set Lang=uk-ua&goto :chooseclientedition)
if %Lang% equ 27 (set Lang=tr-tr&goto :chooseclientedition)
if %Lang% equ 26 (set Lang=th-th&goto :chooseclientedition)
if %Lang% equ 25 (set Lang=sl-si&goto :chooseclientedition)
if %Lang% equ 24 (set Lang=sk-sk&goto :chooseclientedition)
if %Lang% equ 23 (set Lang=sr-latn-rs&goto :chooseclientedition)
if %Lang% equ 22 (set Lang=sv-se&goto :chooseclientedition)
if %Lang% equ 21 (set Lang=ja-jp&goto :chooseclientedition)
if %Lang% equ 20 (set Lang=pt-pt&goto :chooseclientedition)
if %Lang% equ 19 (set Lang=pt-br&goto :chooseclientedition)
if %Lang% equ 18 (set Lang=nb-no&goto :chooseclientedition)
if %Lang% equ 17 (set Lang=ro-ro&goto :chooseclientedition)
if %Lang% equ 16 (set Lang=lt-lt&goto :chooseclientedition)
if %Lang% equ 15 (set Lang=lv-lv&goto :chooseclientedition)
if %Lang% equ 14 (set Lang=hr-hr&goto :chooseclientedition)
if %Lang% equ 13 (set Lang=cs-cz&goto :chooseclientedition)
if %Lang% equ 12 (set Lang=nl-nl&goto :chooseclientedition)
if %Lang% equ 11 (set Lang=fr-ca&goto :chooseclientedition)
if %Lang% equ 10 (set Lang=fr-fr&goto :chooseclientedition)
if %Lang% equ 09 (set Lang=fi-fi&goto :chooseclientedition)
if %Lang% equ 08 (set Lang=ru-ru&goto :chooseclientedition)
if %Lang% equ 07 (set Lang=de-de&goto :chooseclientedition)
if %Lang% equ 06 (set Lang=da-dk&goto :chooseclientedition)
if %Lang% equ 05 (set Lang=ko-kr&goto :chooseclientedition)
if %Lang% equ 04 (set Lang=pl-pl&goto :chooseclientedition)
if %Lang% equ 03 (set Lang=bg-bg&goto :chooseclientedition)
if %Lang% equ 02 (set Lang=et-ee&goto :chooseclientedition)
if %Lang% equ 01 (set Lang=ar-sa&goto :chooseclientedition)
if %Lang% lss 01 goto :unsupportlang
if %SKU% equ h goto :first
if %SKU% equ b goto :second
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 选择服务器语言
::-------------------------------------------------------------------------------------------
:langserver
cls
title %WizTitle% - %PurposeB% - %SelectServerLang%

echo.%line%
echo.%LangTitle%
echo.%line%
echo.%LangServerDes2%
echo.
echo.%ListLang%
echo.%line2%
echo.         01 - %LangMenu04%
echo.         02 - %LangMenu05%
echo.         03 - %LangMenu07%
echo.         04 - %LangMenu08%
echo.         05 - %LangMenu10%
echo.         06 - %LangMenu12%
echo.         07 - %LangMenu13%
echo.         08 - %LangMenu19%
echo.         09 - %LangMenu20%
echo.         10 - %LangMenu21%
echo.         11 - %LangMenu22%
echo.         12 - %LangMenu27%
echo.         13 - %LangMenu30%
echo.         14 - %LangMenu33%
echo.         15 - %LangMenu34%
echo.         16 - %LangMenu36%
echo.         17 - %LangMenu37%
echo.         18 - %LangMenu38%
echo.
echo.
echo.%line%
set /p Lang=%TxtDes1%
if %Lang% geq 19 goto :unsupportserverlang
if %Lang% equ 18 (set Lang=zh-tw&goto :chooseserveredition)
if %Lang% equ 17 (set Lang=zh-cn&goto :chooseserveredition)
if %Lang% equ 16 (set Lang=lt-lt&goto :chooseserveredition)
if %Lang% equ 15 (set Lang=en-us&goto :chooseserveredition)
if %Lang% equ 14 (set Lang=hu-hu&goto :chooseserveredition)
if %Lang% equ 13 (set Lang=es-es&goto :chooseserveredition)
if %Lang% equ 12 (set Lang=tr-tr&goto :chooseserveredition)
if %Lang% equ 11 (set Lang=sv-se&goto :chooseserveredition)
if %Lang% equ 10 (set Lang=ja-jp&goto :chooseserveredition)
if %Lang% equ 09 (set Lang=pt-pt&goto :chooseserveredition)
if %Lang% equ 08 (set Lang=pt-br&goto :chooseserveredition)
if %Lang% equ 07 (set Lang=cs-cz&goto :chooseserveredition)
if %Lang% equ 06 (set Lang=nl-nl&goto :chooseserveredition)
if %Lang% equ 05 (set Lang=fr-fr&goto :chooseserveredition)
if %Lang% equ 04 (set Lang=ru-ru&goto :chooseserveredition)
if %Lang% equ 03 (set Lang=de-de&goto :chooseserveredition)
if %Lang% equ 02 (set Lang=ko-kr&goto :chooseserveredition)
if %Lang% equ 01 (set Lang=pl-pl&goto :chooseserveredition)
if %Lang% lss 01 goto :unsupportlang
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 选择客户端版本
::-------------------------------------------------------------------------------------------
:chooseclientedition
cls
title %WizTitle% - %PurposeB% - %SelectSKU1%

echo.%line%
echo.%BuildTitle%
echo.%line%
echo.%BuildDes%
echo.%line2%
echo.%AnyBuild%
echo.   1 - %COBuild%
echo.   2 - %ProBuild%
echo.
echo.%line2%
echo.%CHBuild%
echo.   4 - %CCSBuild%
echo.
echo.%line2%
echo.%EUBuild%
echo.   5 - %CONBuild%
echo.   6 - %ProNBuild%
echo.
echo.%line3%
echo.%COMBD%
echo.   7 - %CombBuild%
echo.
echo.
echo.
echo.
echo.%StepDescription2%
echo.%line%
choice /c 123456BC /n /m "%TxtDes1%"
if errorlevel 8 goto :first
if errorlevel 7 goto :clientlang
if errorlevel 6 goto :chooseclienteditiongroup
if errorlevel 5 (set SKU=professionaln&goto :setupdateid)
if errorlevel 4 (set SKU=coren&goto :setupdateid)
if errorlevel 3 (set SKU=corecountryspecific&goto :setupdateid)
if errorlevel 2 (set SKU=professional&goto :setupdateid)
if errorlevel 1 (set SKU=core&goto :setupdateid)
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 选择客户端版本组合
::-------------------------------------------------------------------------------------------
:chooseclienteditiongroup
cls
title %WizTitle% - %PurposeB% - %SelectSKUGroup%

echo.%line%
echo.%EditionTitle%
echo.%line%
echo.%EditionDes%
echo.
echo.%line3%
echo.%editiongroup1%
echo.
echo.   1 - %CCCS%
echo.   2 - %CCSP%
echo.   3 - %CCCSP%
echo.
echo.%line3%
echo.%editiongroup2%
echo.
echo.   4 - %CAPR%
echo.   5 - %CPT%
echo.
echo.%line3%
echo.%editiongroup3%
echo.
echo.   6 - %CCNPPN%
echo.   7 - %CCNPPNT%
echo.
echo.
echo.%StepDescription%
echo.%line%
choice /c 1234567BC /n /m "%TxtDes1%"
if errorlevel 9 goto :first
if errorlevel 8 goto :chooseclientedition
if errorlevel 7 (set "SKU=core;coren;professional;professionaln;ppipro"&goto :setupdateid)
if errorlevel 6 (set "SKU=core;coren;professional;professionaln"&goto :setupdateid)
if errorlevel 5 (set "SKU=core;professional;ppipro"&goto :setupdateid)
if errorlevel 4 (set "SKU=core;professional"&goto :setupdateid)
if errorlevel 3 (set "SKU=core;corecountryspecific;professional"&goto :setupdateid)
if errorlevel 2 (set "SKU=corecountryspecific;professional"&goto :setupdateid)
if errorlevel 1 (set "SKU=core;corecountryspecific"&goto :setupdateid)
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 选择服务器版本
::-------------------------------------------------------------------------------------------
:chooseserveredition
cls
title %WizTitle% - %PurposeB% - %SelectSKU1%

echo.%line%
echo.%BuildTitle%
echo.%line%
echo.%ServerDes2%
echo.
echo.
echo.%line2%
echo.
echo.   1 - Azure Stack HCI
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.%StepDescription%
echo.%line%
choice /c 1AB /n /m "%TxtDes1%"
if errorlevel 3 goto :first
if errorlevel 2 goto :chooseserveredition
if errorlevel 1 (set "SKU=serverazurestackhcicor"&goto :setupdateid)
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
::  不支持客户端语言版本警告
::-------------------------------------------------------------------------------------------
:unsupportclientlang
cls
title %WizTitle% - %PurposeB% - %UnsupportedLang%
color f4
echo %line%
echo %WarTitle%
echo %line%
echo.
echo.
echo.
echo.
echo.
echo.
echo  %CodError%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo %line2%
echo.
echo    1 - %BackLangMenu%
echo.
echo    Enter - %Exit%
echo.
echo.
echo %line%
set /p choosemenu=%ContExit%
if %choosemenu% equ 1 (color f0 & goto :clientlang)
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
::  不支持服务器语言版本警告
::-------------------------------------------------------------------------------------------
:unsupportserverlang
cls
title %WizTitle% - %PurposeB% - %UnsupportedLang%
color f4
echo %line%
echo %WarTitle%
echo %line%
echo.
echo.
echo.
echo.
echo.
echo.
echo  %CodError%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo %line2%
echo.
echo    1 - %BackLangMenu%
echo.
echo    Enter - %Exit%
echo.
echo.
echo %line%
set /p choosemenu=%ContExit%
if %choosemenu% equ 1 (color f0 & goto :langserver)
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 填写你的更新 ID
::-------------------------------------------------------------------------------------------
:setupdateid
cls
title %WizTitle% - %PurposeB% - %WriteBuildID%

echo.%line%
echo.%FillIDTitle%
echo.%line%
echo.%FillIDDes%
echo.
echo.%line2%
echo.%IDExample%https://uupdump.net/selectlang.php?id=abcd1234
echo.https://uupdump.net/download.php?id=abcd1234^&pack=lang^&edition=core
echo.%line2%
echo.
echo.
set /p UUPurl=%FillID%
set UUPurl=%UUPurl%=
set UUPLIST=%UUPurl%

set /a uupmum=1
:loop
for /f "tokens=1* delims==" %%a in ("%UUPLIST%") do (
if %uupmum% equ 2 set "id=%%a"&goto :uupdownload
set /a uupmum=uupmum+1
set UUPLIST=%%b
)
if defined UUPLIST goto :loop
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: UUP 文件下载主进程
::-------------------------------------------------------------------------------------------
:uupdownload
cls
title %WizTitle% - %PurposeB% - %SearchUpdScript%

(
echo.%line%
echo %APPDScript%
echo.%line%
"%aria2%" --no-conf --log-level=info --log="aria2_download.log" -o"%aria2Script%" --allow-overwrite=true --auto-file-renaming=false "https://uupdump.net/get.php?id=%id%&pack=neutral&edition=app&aria2=2"
if %ERRORLEVEL% GTR 0 set error=2&call :ERROR & exit /b 1

for /F "tokens=2 delims=:" %%i in ('findstr #UUPDUMP_ERROR: "%aria2Script%"') do set DETECTED_ERROR=%%i
if NOT [%DETECTED_ERROR%] == [] (set error=3&call :ERROR)

echo.%line%
echo %APPDFiles%
echo.%line%
"%aria2%" --no-conf --log-level=info --log="aria2_download.log" -x16 -s16 -j25 -c -R -d"%destDir%" -i"%aria2Script%"
if %ERRORLEVEL% GTR 0 set error=2&call :ERROR & exit /b 1

cls
echo.%line%
echo.%UPDScript%
echo.%line%
"%aria2%" --no-conf %cert%--log-level=info --log="aria2_download.log" -o"%aria2Script%" --allow-overwrite=true --auto-file-renaming=false "https://uupdump.net/get.php?id=%id%&pack=%Lang%&edition=%SKU%&aria2=2"
if %ERRORLEVEL% GTR 0 set error=2&call :ERROR & exit /b 1

for /F "tokens=2 delims=:" %%i in ('findstr #UUPDUMP_ERROR: "%aria2Script%"') do set DETECTED_ERROR=%%i
if NOT [%DETECTED_ERROR%] == [] (set error=3&call :ERROR)

cls
title %WizTitle% - %PurposeB% - %DLUUPFiles%

echo.%line%
echo.%DLFiles%
echo.%line%
"%aria2%" --no-conf --log-level=info --log="aria2_download.log" -x16 -s16 -j5 -c -R -d"%destDir%" -i"%aria2Script%"
if %ERRORLEVEL% GTR 0 set error=2&call :ERROR & exit /b 1
if %ERRORLEVEL% EQU 0 set error=0&call :ERROR & exit /b 1

)
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 下载 aria2 模组（如果 aria2 丢失）
::-------------------------------------------------------------------------------------------
:DOWNLOAD_ARIA2
if NOT EXIST files mkdir files
powershell -NoProfile -ExecutionPolicy Unrestricted .\files\depends_win.ps1 || (pause & exit /b 1)
echo.
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 准备转换工具
::-------------------------------------------------------------------------------------------
cls
:Prepareuup2ISO
cd /d "%~dp0"
if NOT EXIST %aria2% set error=1&goto :ERROR
if NOT EXIST %a7z% set error=4&goto :ERROR
if NOT EXIST %uupConv% set error=4&goto :ERROR
if NOT EXIST ConvertConfig.ini set error=4&goto :ERROR

cls
title %WizTitle% - %PurposeB% - %ConvertCmd%

echo %line%
echo %PrepConverter%
echo %line%
"%a7z%" -x!ConvertConfig.ini -y x "%uupConv%" >NUL
echo.

if EXIST convert-UUP.cmd goto :START_CONVERT
pause
goto :EOF
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 启动转换工具
::-------------------------------------------------------------------------------------------
:START_CONVERT
call convert-UUP.cmd
goto :EOF
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 完成/错误提示页面
::-------------------------------------------------------------------------------------------
:ERROR
cls
if %error% equ 0 title %WizTitle% - %PurposeB% - %DLFinish%
if %error% gtr 0 title %WizTitle% - %PurposeB% - %FoundError%

echo.%line%
if %error% equ 0 (color f0&echo %FinishTitle%)
if %error% gtr 0 (color f4&echo.%ErrorTitle%)
echo.%line%
echo.
echo.
if %error% equ 0 (
	echo.
	echo.
	echo.
	echo.%FLDLD%
	echo.
	echo.
	echo.%AskConvert%
	echo.
	echo.
	echo.
	echo.%ConvertTip%
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	) else if %error% equ 1 (
		echo  %ErrorTxt1% %aria2%%ErrorTxt11%
		echo.
		echo.
		echo.
		echo  %DLAria%
		echo.
		echo  https://aria2.github.io/
		echo.
		echo.
		echo  %ErrorTxt2%
		echo.
		echo  %FileExample%
		start https://aria2.github.io/
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		echo.
		) else if %error% equ 2 (
			echo.
			echo.
			echo.
			echo.
			echo  %ErrorTxt3%
			echo.
			echo.
			echo  %ErrorTxt4%
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.%FileDirectory%
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			echo.
			) else if %error% equ 3 (
				echo.
				echo.
				echo.
				echo.
				echo.%ErrorTxt5%%DETECTED_ERROR%
				echo.
				echo.
				echo.%ErrorTxt61%
				echo.- %ErrorTxt62%
				echo.- %ErrorTxt63%
				echo.- %ErrorTxt64%
				echo.
				echo.%ErrorTxt7%
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				echo.
				) else if %error% equ 4 (
					echo.
					echo.
					echo.
					echo.
					echo  %ErrorTxt8%
					echo.
					echo.
					echo  %ErrorTxt9%
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.
					echo.%FileDirectory%
					echo.
					echo.
)
echo.
echo.
echo.%line%
if %error% equ 0 (
pause
goto :Prepareuup2ISO
) else if %error% gtr 0 (
pause
exit /b
)
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:dlang
if /i %dlang%==1 call files\lang.cmd -en && exit /b
if /i %dlang%==2 call files\lang.cmd -cn && exit /b
exit /b
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:langver
if /i %LVer%==1 call files\lang.cmd -LVer && exit /b
exit /b
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:EOF
exit /b
::-------------------------------------------------------------------------------------------