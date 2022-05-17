@echo off

:: 代理配置
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

:: 代理配置结束

cd /d "%~dp0"

color f0

call files\lang.cmd -en

set LVer=1 && call :langver

:: 其他参数
set "Network="
set "Lang="
set "SKU="
set "cert=--check-certificate=false "
set "bckps="

:: 版本指示内容
set "Ver=3.4"
set "Ver1=v%Ver%"
set "udBuild=625.1"

:: 版本类型控制，不应修改其中的任何内容
set "PurposeA=%PurposeA%"
set "PurposeB=%PurposeB%"
set "Purpose=%PurposeB%"

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

:: 语言选择
:langselect
title %langchoose%

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
echo %WizVer% %Ver% ^(%Build% %udBuild%^)  %EditionApplicableDesA%%Purpose%%EditionApplicableDesB%
echo %LangVer% ^(%LVer%%LangVer2%%LVerMax%^)
echo.
echo ^(c^) 2016-2022 %CopyRight%
echo %VerDes%
echo %line2%
choice /c 12 /n /m "%dlangtxt%"
if errorlevel 2 (set dlang=2 & call :dlang)
if errorlevel 1 (set dlang=1 & call :dlang)

:: 文件变量声明
set "aria2=files\aria2c.exe"
set "aria2Script=files\aria2_script.%random%.txt"
set "a7z=files\7zr.exe"
set "uupConv=files\uup-converter-wimlib_%langconverter%.7z"
set "destDir=UUPs"

:: 版本类型控制，不应修改其中的任何内容
set "PurposeA=%PurposeA%"
set "PurposeB=%PurposeB%"
set "Purpose=%PurposeB%"

:: 步骤明细
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

:: 网络预先设置

title %title% %Ver1% - %Purpose%

:: 网络预先设置
:first
if exist \aria2_download.log del /s /q \aria2_download.log
if exist files\aria2_script.*.txt del /s /q files\aria2_script.*.txt
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
echo.
echo.    B - %Alter%
echo.
echo.
echo.    C - %StartSite%
echo.
echo.
echo.
echo.
echo.%WizInfo%
echo.%line2%
echo.%WizVer% %Ver% ^(%Build% %udBuild%^)  %EditionApplicableDesA%%Purpose%%EditionApplicableDesB%
echo.%LangVer% ^(%LVer%%LangVer2%%LVerMax%^)
echo.
echo.^(c^) 2016-2022 %CopyRight%
echo.%VerDes%
echo.
echo.%line%
choice /c ABC /n /m "%TxtDes1%"
if errorlevel 3 (start https://uupdump.net/known.php?lang=zh-cn&goto :first)
if errorlevel 2 (set "cert=--check-certificate=false "&goto :second)
if errorlevel 1 (set "cert= "&goto :second)

:: 选择平台适用版本
:second
cls
title %title% %Ver1% - %Purpose% - %SelectPlat%

echo.%line%
echo.%PlatTitle%
echo.%line%
echo.%PlatDescription%
echo.
echo.%line2%
echo.%ClientTypeDescription%
echo.
echo.    A - %ClientType%
echo.
echo.%line2%
echo.%ServerTypeDescription%
echo.
echo.    B - %ServerType%
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
choice /c ABCH /n /m "%TxtDes1%"
if errorlevel 4 goto :first
if errorlevel 3 goto :first
if errorlevel 2 goto :langserver
if errorlevel 1 goto :clientlang

:: 选择客户端语言
:clientlang
cls
title %title% %Ver1% - %Purpose% - %SelectClientLang%

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
echo.%Win11lang%
echo.%line2%
echo. 39 - %LangMenu39%
echo.
echo.%StepDescription2%
echo.%line%
set /p Lang=%TxtDes1%
if %Lang% geq 45 goto :unsupportlang
if %Lang% equ 39 (set Lang=neutral&goto :chooseclientedition)
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

:: 选择服务器语言
:langserver
cls
title %title% %Ver1% - %Purpose% - %SelectServerLang%

echo %line%
echo %LangServerTitle%
echo %line%
echo %LangServerDes%
echo.
echo %ListLang%
echo %line2%
echo          01 - %LangMenu04%
echo          02 - %LangMenu05%
echo          03 - %LangMenu07%
echo          04 - %LangMenu08%
echo          05 - %LangMenu10%
echo          06 - %LangMenu12%
echo          07 - %LangMenu13%
echo          08 - %LangMenu19%
echo          09 - %LangMenu20%
echo          10 - %LangMenu21%
echo          11 - %LangMenu22%
echo          12 - %LangMenu27%
echo          13 - %LangMenu30%
echo          14 - %LangMenu33%
echo          15 - %LangMenu34%
echo          16 - %LangMenu36%
echo          17 - %LangMenu37%
echo          18 - %LangMenu38%
echo.
echo.
echo %line%
set /p Lang=%TxtDes1%
if %Lang% geq 19 goto :unsupportlang
if %Lang% equ 18 (set Lang=zh-tw&goto :chooseserveredition)
if %Lang% equ 17 (set Lang=zh-cn&goto :chooseserveredition)
if %Lang% equ 16 (set Lang=en-us&goto :chooseserveredition)
if %Lang% equ 15 (set Lang=lt-lt&goto :chooseserveredition)
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

:: 选择客户端版本
:chooseclientedition
cls
title %title% %Ver1% - %Purpose% - %SelectSKU1%

echo.%line%
echo.%BuildTitle%
echo.%line%
echo.%BuildDes%
echo.%line2%
echo.%AnyBuild%
echo.   1 - %COBuild%
echo.   2 - %ProBuild%
echo.   3 - %TeamBuild%
echo.   4 - %TeamDev%
echo.   5 - %AppDown%
echo.
echo.%line2%
echo.%CHBuild%
echo.   6 - %CCSBuild%
echo.
echo.%line2%
echo.%EUBuild%
echo.   7 - %CONBuild%
echo.   8 - %ProNBuild%
echo.
echo.%line3%
echo.%COMBD%
echo.   9 - %CombBuild%
echo.
echo.%StepDescription2%
echo.%line%
set /p SKU=%TxtDes1%
if %SKU% geq d goto :unsupportclientedition
if %SKU% equ 9 goto :chooseclienteditiongroup
if %SKU% equ 8 (set SKU=professionaln&goto :setupdateid)
if %SKU% equ 7 (set SKU=coren&goto :setupdateid)
if %SKU% equ 6 (set SKU=corecountryspecific&goto :setupdateid)
if %SKU% equ 5 (set SKU=app&goto :setupdateid)
if %SKU% equ 4 (set SKU=ppipro&goto :setupdateid)
if %SKU% equ 3 (set SKU=ppipro&goto :chooseupdateidteam)
if %SKU% equ 2 (set SKU=professional&goto :setupdateid)
if %SKU% equ 1 (set SKU=core&goto :setupdateid)
if %SKU% lss 0 goto :unsupportedition
if %SKU% equ h goto :first
if %SKU% equ b goto :clientlang

:: 选择客户端版本组合
:chooseclienteditiongroup
cls
title %title% %Ver1% - %Purpose% - %SelectSKUGroup%

echo %line%
echo %EditionTitle%
echo %line%
echo %EditionDes%
echo.
echo %line2%
echo %editiongroup1%
echo.
echo    1 - %CCCS%
echo    2 - %CCSP%
echo    3 - %CCCSP%
echo.
echo %line2%
echo %editiongroup2%
echo.
echo    4 - %CAPR%
echo    5 - %CPT%
echo.
echo %line2%
echo %editiongroup3%
echo.
echo    6 - %CCNPPN%
echo    7 - %CCNPPNT%
echo.
echo.
echo %StepDescription%
echo %line%
set /p SKU=%TxtDes1%
if %SKU% geq 8 goto :unsupportclientedition
if %SKU% equ 7 (set "SKU=core;coren;professional;professionaln;ppipro"&goto :setupdateid)
if %SKU% equ 6 (set "SKU=core;coren;professional;professionaln"&goto :setupdateid)
if %SKU% equ 5 (set "SKU=core;professional;ppipro"&goto :setupdateid)
if %SKU% equ 4 (set "SKU=core;professional"&goto :setupdateid)
if %SKU% equ 3 (set "SKU=core;corecountryspecific;professional"&goto :setupdateid)
if %SKU% equ 2 (set "SKU=corecountryspecific;professional"&goto :setupdateid)
if %SKU% equ 1 (set "SKU=core;corecountryspecific"&goto :setupdateid)
if %SKU% lss 1 goto :unsupportclientedition
if %SKU% equ b goto :first
if %SKU% equ B goto :first
if %SKU% equ a goto :chooseclientedition
if %SKU% equ A goto :chooseclientedition

:: 选择服务器版本
:chooseserveredition
cls
title %title% %Ver1% - %Purpose% - %SelectSKU1%

echo %line%
echo %BuildTitle%
echo %line%
echo %ServerDes%
echo.
echo.
echo %line2%
echo.
echo    1 - Azure Stack HCI
echo.
echo    2 - Windows Server Standard%core%
echo.
echo    3 - Windows Server Datacenter%core%
echo.
echo    4 - Windows Server Standard
echo.
echo    5 - Windows Server Datacenter
echo.
echo    6 - %CombBuild%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo %StepDescription%
echo %line%
set /p SKU=%TxtDes1%
if %SKU% geq C goto :unsupportserveredition
if %SKU% equ 6 goto :chooseservereditiongroup
if %SKU% equ 5 (set "SKU=serverdatacenter"&goto :setupdateid)
if %SKU% equ 4 (set "SKU=serverstandard"&goto :setupdateid)
if %SKU% equ 3 (set "SKU=serverdatacentercore"&goto :setupdateid)
if %SKU% equ 2 (set "SKU=serverstandardcore"&goto :setupdateid)
if %SKU% equ 1 (set "SKU=serverazurestackhcicor"&goto :setupdateid)
if %SKU% lss 1 goto :unsupportserveredition
if %SKU% equ b goto :first
if %SKU% equ B goto :first
if %SKU% equ a goto :langserver
if %SKU% equ A goto :langserver

:: 选择服务器版本组合
:chooseservereditiongroup
cls
title %title% %Ver1% - %Purpose% - %SelectSKUGroup%

echo %line%
echo %EditionTitle%
echo %line%
echo %ServerEditionDes%
echo %line2%
echo %editiongroup4%
echo.
echo    1 - %ServerSCDC%
echo.
echo %line2%
echo %editiongroup5%
echo.
echo    2 - %ServerSD%
echo.
echo %line2%
echo %editiongroup6%
echo.
echo    3 - %ServerSCS%
echo    4 - %ServerDCD%
echo.
echo %line2%
echo %editiongroup7%
echo.
echo    5 - %ServerSCSDCD%
echo.
echo %StepDescription%
echo %line%
set /p SKU=%TxtDes1%
if %SKU% geq C goto :unsupportserveredition
if %SKU% equ 5 (set "SKU=serverstandardcore;serverstandard;serverdatacentercore;serverdatacenter"&goto :setupdateid)
if %SKU% equ 4 (set "SKU=serverdatacentercore;serverdatacenter"&goto :setupdateid)
if %SKU% equ 3 (set "SKU=serverstandardcore;serverstandard"&goto :setupdateid)
if %SKU% equ 2 (set "SKU=serverstandard;serverdatacenter"&goto :setupdateid)
if %SKU% equ 1 (set "SKU=serverstandardcore;serverdatacentercore"&goto :setupdateid)
if %SKU% lss 1 goto :unsupportserveredition
if %SKU% equ b goto :first
if %SKU% equ B goto :first
if %SKU% equ a goto :chooseserveredition
if %SKU% equ A goto :chooseserveredition

:: 不支持客户端版本警告
:unsupportclientedition
cls
title %title% %Ver1% - %Purpose% - %UnsupportedSKU%

echo %line%
echo %WarTitle%
echo %line%
echo.
echo.
echo.
echo.
echo.
echo.
echo  %Wartxt%
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
echo    1 - %SingleEdt%
echo    2 - %CombEdt%
echo    Enter - %Exit%
echo.
echo.
echo %line%
set /p choosemenu=%ContExit%
if %choosemenu% equ 2 (color f0 & goto :chooseclienteditiongroup)
if %choosemenu% equ 1 (color f0 & goto :chooseclientedition)

:: 不支持服务器版本警告
:unsupportserveredition
cls
title %title% %Ver1% - %Purpose% - %UnsupportedSKU%

echo %line%
echo %WarTitle%
echo %line%
echo.
echo.
echo.
echo.
echo.
echo.
echo  %Wartxt%
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
echo    1 - %SingleEdt%
echo    2 - %CombEdt%
echo    Enter - %Exit%
echo.
echo.
echo %line%
set /p choosemenu=%ContExit%
if %choosemenu% equ 2 (color f0 & goto :chooseservereditiongroup)
if %choosemenu% equ 1 (color f0 & goto :chooseserveredition)

::  不支持客户端语言版本警告
:unsupportclientlang
cls
title %title% %Ver1% - %Purpose% - %UnsupportedLang%
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

::  不支持服务器语言版本警告
:unsupportserverlang
cls
title %title% %Ver1% - %Purpose% - %UnsupportedLang%
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

:: 填写你的更新 ID
:setupdateid
cls
title %title% %Ver1% - %Purpose% - %WriteBuildID%

echo %line%
echo %FillIDTitle%
echo %line%
echo %FillIDDes%
echo.
echo.
echo %line2%
echo %IDExample%abcd1234-b123-c123-d123-abcdef123456
echo %line2%
echo.
echo.
set /p id=%FillID%
set "id=%id%"&goto :uupdownload

:: 选择协同版更新 ID
:chooseupdateidteam
cls
title %title% %Ver1% - %Purpose% - %SelectTeamID%

echo %line%
echo %TeamTitle%
echo %line%
echo %TeamDes%
echo.
echo  01 - 19042.538 ^(20H2_release %TeamBranch%^)
echo  02 - 19042.545 ^(20H2_release %TeamBranch%^)
echo  03 - 19042.572 ^(20H2_release %TeamBranch%^)
echo.
echo.%TeamDevDes%
echo.
echo. 04 - 19100.1008 ^| 05 - 19100.1009 ^| 06 - 19100.1019 ^| 07 - 19100.1021 ^| 08 - 19100.1023
echo. 09 - 19100.1025 ^| 10 - 19100.1026 ^| 11 - 19100.1031 ^| 12 - 19100.1035 ^| 13 - 19100.1039
echo. 14 - 19100.1041 ^| 15 - 19100.1045 ^| 16 - 19100.1047 ^| 17 - 19100.1050 ^| 18 - 19100.1051
echo. 19 - 19100.1055 ^| 20 - 19100.1057 ^| 21 - 19100.1060 ^| 22 - 19100.1062 ^| 23 - 19100.1064
echo. 24 - 19100.1065 ^| 25 - 19100.1066 ^| 26 - 19100.1067 ^| 27 - 19100.1070 ^| 28 - 19100.1079
echo. 29 - 19100.1085 ^|
echo.
echo.%line3%
echo.
echo.%TeamSVC%
echo.
echo. E1 - 19100.1045
echo.
echo.
echo.%StepDescription2%
echo.%line%
set /p Team=%TxtDes1%
if %Team% equ E1 (set id=24fd32a8-3585-46f8-b356-7fdc6d016a93&goto :uupdownload)
if %Team% equ 29 (set id=91f38675-4298-43d9-a258-3130369a6829&goto :uupdownload)
if %Team% equ 28 (set id=59e58c68-0c40-4cee-880f-500bf04bbcfa&goto :uupdownload)
if %Team% equ 27 (set id=b8c1be9f-b120-486f-b9db-32308905439e&goto :uupdownload)
if %Team% equ 26 (set id=2bf7a0c9-a2b0-4333-a3e8-7eed56f0e897&goto :uupdownload)
if %Team% equ 25 (set id=61ab3641-436e-4f6a-9999-0be13c098849&goto :uupdownload)
if %Team% equ 24 (set id=ab2ce6b7-8edf-4e47-9131-d71aa5600cba&goto :uupdownload)
if %Team% equ 23 (set id=f54ffb54-4fd0-4c49-b150-613755a69f3c&goto :uupdownload)
if %Team% equ 22 (set id=8a1d71c1-6cb9-4cbf-9f9b-ab9b885282e7&goto :uupdownload)
if %Team% equ 21 (set id=763a6025-9e33-4b10-abed-1c41a89d3984&goto :uupdownload)
if %Team% equ 20 (set id=6d51e694-7463-4b0d-afa8-06a88f52c9c7&goto :uupdownload)
if %Team% equ 19 (set id=e84a6181-f9c1-41c1-be71-aea13769a001&goto :uupdownload)
if %Team% equ 18 (set id=93d95e92-96f9-42cf-9d80-e827b8de3cbc&goto :uupdownload)
if %Team% equ 17 (set id=abb92723-44a1-44f5-a343-9ca1c339457f&goto :uupdownload)
if %Team% equ 16 (set id=bad2c98a-c8ac-4dd7-a1fb-ea6b2a94f538&goto :uupdownload)
if %Team% equ 15 (set id=a29357bc-cc1b-4d65-8a5b-19a59f81b602&goto :uupdownload)
if %Team% equ 14 (set id=131f4140-7928-4178-8e9b-1f770896dc30&goto :uupdownload)
if %Team% equ 13 (set id=217267dd-e9f5-4c49-85f6-0d221b2535ed&goto :uupdownload)
if %Team% equ 12 (set id=d48c82d9-9b41-4153-b1f6-7217231f145a&goto :uupdownload)
if %Team% equ 11 (set id=ce6e37a3-0942-4012-ba22-8dd38877a1c7&goto :uupdownload)
if %Team% equ 10 (set id=6f9e5521-5cb0-4b9c-9e65-c385781a005e&goto :uupdownload)
if %Team% equ 09 (set id=39d733eb-bb06-440c-8cfb-b1bc4492293a&goto :uupdownload)
if %Team% equ 08 (set id=cb9a18fe-485d-4b57-92b6-85a398725c3e&goto :uupdownload)
if %Team% equ 07 (set id=c9d0ea4a-6874-45f7-bb63-929e48742785&goto :uupdownload)
if %Team% equ 06 (set id=40a6c352-b0f4-49a6-a0c3-3dc1537e1d3f&goto :uupdownload)
if %Team% equ 05 (set id=87364f44-95b4-4bf0-917e-5b28f266610d&goto :uupdownload)
if %Team% equ 04 (set id=1503c1dc-82c3-4ebd-8299-afd449411884&goto :uupdownload)
if %Team% equ 03 (set id=ac417a02-f061-4f49-884d-9f427e1edfed&goto :uupdownload)
if %Team% equ 02 (set id=8b2d3ddf-f617-4df4-a1da-15dcbf0e757c&goto :uupdownload)
if %Team% equ 01 (set id=bbcdbf02-fd0f-497f-9d01-956bec5f9c13&goto :uupdownload)
if %Team% equ b goto :first
if %Team% equ B goto :first
if %Team% equ a goto :chooseedition
if %Team% equ A goto :chooseedition

:uupdownload
cls
title %title% %Ver1% - %Purpose% - %SearchUpdScript%

(
echo %line%
echo %UPDScript%
echo %line%
"%aria2%" --no-conf %cert%--log-level=info --log="aria2_download.log" -o"%aria2Script%" --allow-overwrite=true --auto-file-renaming=false "https://uupdump.net/get.php?id=%id%&pack=%Lang%&edition=%SKU%&aria2=2"
if %ERRORLEVEL% GTR 0 set error=2&call :ERROR & exit /b 1

for /F "tokens=2 delims=:" %%i in ('findstr #UUPDUMP_ERROR: "%aria2Script%"') do set DETECTED_ERROR=%%i
if NOT [%DETECTED_ERROR%] == [] (set error=3&goto :ERROR)

cls
title %title% %Ver1% - %Purpose% - %DLUUPFiles%

echo %line%
echo %DLFiles%
echo %line%
"%aria2%" --no-conf --log-level=info --log="aria2_download.log" -x16 -s16 -j5 -c -R -d"%destDir%" -i"%aria2Script%"
if %ERRORLEVEL% GTR 0 set error=2&call :ERROR & exit /b 1

goto :StartPrepareuup2ISO
)

:StartPrepareuup2ISO
cls
title %title% %Ver1% - %Purpose% - %ConvertCmd%

echo %line%
echo %FinishTitle%
echo %line%
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
echo %line%
pause
goto :Prepareuup2ISO

cls
:Prepareuup2ISO
cd /d "%~dp0"
if NOT EXIST %aria2% set error=1&goto :ERROR
if NOT EXIST %a7z% set error=4&goto :ERROR
if NOT EXIST %uupConv% set error=4&goto :ERROR
if NOT EXIST ConvertConfig.ini set error=4&goto :ERROR

cls
title %title% %Ver1% - %Purpose% - %ConvertCmd%

echo %line%
echo %PrepConverter%
echo %line%
"%a7z%" -x!ConvertConfig.ini -y x "%uupConv%" >NUL
echo.

if EXIST convert-UUP.cmd goto :START_CONVERT
pause
goto :EOF

:START_CONVERT
call convert-UUP.cmd
goto :EOF

:ERROR
cls
title %title% %Ver1% - %Purpose% - %FoundError%
color f4
echo %line%
echo %ErrorTitle%
echo %line%
echo.
if %error% equ 1 call :aria_error
if %error% equ 2 call :download_error
if %error% equ 3 call :uup_error
if %error% equ 4 call :no_file_error
echo.
echo.
echo.
echo.
echo.
echo.
echo %line%
pause
exit /b

:aria_error
if %error% equ 1 (
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
)

:download_error
if %error% equ 2 (
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
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
)

:uup_error
if %error% equ 3 (
echo.
echo.
echo.
echo.
echo  %ErrorTxt5%%DETECTED_ERROR%
echo.
echo.
echo  %ErrorTxt6%
echo.
echo.
echo  %ErrorTxt7%
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
)

:no_file_error
if %error% equ 4 (
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
echo.
echo.
echo.
)

:dlang
if /i %dlang%==1 call files\lang.cmd -en && exit /b
if /i %dlang%==2 call files\lang.cmd -cn && exit /b
exit /b

:langver
if /i %LVer%==1 call files\lang.cmd -LVer && exit /b
exit /b

:EOF
exit /b