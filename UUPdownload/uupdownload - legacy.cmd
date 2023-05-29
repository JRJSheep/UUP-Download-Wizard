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
:: 语言选择
::-------------------------------------------------------------------------------------------
call files\lang.cmd -en

color f0

title %langchoose% - %PurposeA%
cls
echo.%line%
echo.%langwelcome%
echo.%line%
echo.
echo.
echo.
echo.    1 - %lang1%
echo.
echo.
echo.    2 - %lang2%
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
echo.%WizInfo%
echo.%line2%
echo.%WizVer% %Ver% ^(%Build% %udBuild%.%udRevision%^)  %LangVer%%LVerMax%.%LMVerMax%
echo.%EditionApplicableDesA%%PurposeA%%EditionApplicableDesB%
echo.
echo.^(c^) 2016-2023 %CopyRight%
echo.%VerDes%
echo.%line2%
choice /c 12 /n /m "%dlangtxt%"
if errorlevel 2 (set dlang=2 & call :dlang)
if errorlevel 1 (set dlang=1 & call :dlang)
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 其他参数
::-------------------------------------------------------------------------------------------
set "aria2=files\aria2c.exe"
set "aria2Script=files\aria2_script.%random%.txt"
set "destDir=UUPs"
set "Network="
set "Lang="
set "SKU="
set "cert=--check-certificate=false "
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

title %WizTitle% - %PurposeA%

::-------------------------------------------------------------------------------------------
:: 网络预先设置
::-------------------------------------------------------------------------------------------
:first
cls
if exist aria2_download.log del /s /q aria2_download.log
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
echo.%EditionApplicableDesA%%PurposeA%%EditionApplicableDesB%
echo.
echo.^(c^) 2016-2023 %CopyRight%
echo.%VerDes%
echo.
echo.%line%
choice /c ABC /n /m "%TxtDes1%"
if errorlevel 3 (start https://uupdump.net/known.php%langsite%&goto :first)
if errorlevel 2 (set "cert=--check-certificate=false "&goto :second)
if errorlevel 1 (set "cert= "&goto :second)
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 选择平台适用版本
::-------------------------------------------------------------------------------------------
:second
cls
title %WizTitle% - %PurposeA% - %SelectPlat%

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
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 选择客户端语言
::-------------------------------------------------------------------------------------------
:clientlang
cls
title %WizTitle% - %PurposeA% - %SelectClientLang%

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

::-------------------------------------------------------------------------------------------
:: 选择服务器语言
::-------------------------------------------------------------------------------------------
:langserver
cls
title %WizTitle% - %PurposeA% - %SelectServerLang%

echo.%line%
echo.%LangTitle%
echo.%line%
echo.%LangServerDes%
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
:: 选择客户端版本
::-------------------------------------------------------------------------------------------
:chooseclientedition
cls
title %WizTitle% - %PurposeA% - %SelectSKU1%

echo.%line%
echo.%BuildTitle%
echo.%line%
echo.%BuildDes%
echo.%line2%
echo.%AnyBuild%
echo.   1 - %COBuild%
echo.   2 - %ProBuild%
echo.   3 - %TeamBuild%
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
echo.   8 - %AppDown%
echo.
echo.
echo.%StepDescription2%
echo.%line%
choice /c 12345678BC /n /m "%TxtDes1%"
if errorlevel 10 goto :first
if errorlevel 9 goto :clientlang
if errorlevel 8 (set SKU=app&goto :setupdateid)
if errorlevel 7 goto :chooseclienteditiongroup
if errorlevel 6 (set SKU=professionaln&goto :setupdateid)
if errorlevel 5 (set SKU=coren&goto :setupdateid)
if errorlevel 4 (set SKU=corecountryspecific&goto :setupdateid)
if errorlevel 3 (set SKU=ppipro&goto :chooseupdateidteam)
if errorlevel 2 (set SKU=professional&goto :setupdateid)
if errorlevel 1 (set SKU=core&goto :setupdateid)
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 选择客户端版本组合
::-------------------------------------------------------------------------------------------
:chooseclienteditiongroup
cls
title %WizTitle% - %PurposeA% - %SelectSKUGroup%

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
title %WizTitle% - %PurposeA% - %SelectSKU1%

echo.%line%
echo.%BuildTitle%
echo.%line%
echo.%ServerDes%
echo.
echo.
echo.%line2%
echo.
echo.   1 - Azure Stack HCI
echo.
echo.   2 - Windows Server Standard%core%
echo.
echo.   3 - Windows Server Datacenter%core%
echo.
echo.   4 - Windows Server Standard
echo.
echo.   5 - Windows Server Datacenter
echo.
echo.   6 - %CombBuild%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.%StepDescription%
echo.%line%
choice /c 123456AB /n /m "%TxtDes1%"
if errorlevel 8 goto :first
if errorlevel 7 goto :chooseserveredition
if errorlevel 6 goto :chooseservereditiongroup
if errorlevel 5 (set "SKU=serverdatacenter"&goto :setupdateid)
if errorlevel 4 (set "SKU=serverstandard"&goto :setupdateid)
if errorlevel 3 (set "SKU=serverdatacentercore"&goto :setupdateid)
if errorlevel 2 (set "SKU=serverstandardcore"&goto :setupdateid)
if errorlevel 1 (set "SKU=serverazurestackhcicor"&goto :setupdateid)
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 选择服务器版本组合
::-------------------------------------------------------------------------------------------
:chooseservereditiongroup
cls
title %WizTitle% - %PurposeA% - %SelectSKUGroup%

echo.%line%
echo.%EditionTitle%
echo.%line%
echo.%ServerEditionDes%
echo.%line3%
echo.%editiongroup4%
echo.
echo.   1 - %ServerSCDC%
echo.
echo.%line2%
echo.%editiongroup5%
echo.
echo.   2 - %ServerSD%
echo.
echo.%line2%
echo.%editiongroup6%
echo.
echo.   3 - %ServerSCS%
echo.   4 - %ServerDCD%
echo.
echo.%line2%
echo.%editiongroup7%
echo.
echo.   5 - %ServerSCSDCD%
echo.
echo.%StepDescription%
echo.%line%
choice /c 12345AB /n /m "%TxtDes1%"
if errorlevel 7 goto :first
if errorlevel 6 goto :chooseserveredition
if errorlevel 5 (set "SKU=serverstandardcore;serverstandard;serverdatacentercore;serverdatacenter"&goto :setupdateid)
if errorlevel 4 (set "SKU=serverdatacentercore;serverdatacenter"&goto :setupdateid)
if errorlevel 3 (set "SKU=serverstandardcore;serverstandard"&goto :setupdateid)
if errorlevel 2 (set "SKU=serverstandard;serverdatacenter"&goto :setupdateid)
if errorlevel 1 (set "SKU=serverstandardcore;serverdatacentercore"&goto :setupdateid)
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 不支持客户端语言版本警告
::-------------------------------------------------------------------------------------------
:unsupportclientlang
cls
title %WizTitle% - %PurposeA% - %UnsupportedLang%
color f4
echo.%line%
echo.%WarTitle%
echo.%line%
echo.
echo.
echo.
echo.
echo.
echo.
echo. %CodError%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.%line2%
echo.
echo.   1 - %BackLangMenu%
echo.
echo.   E - %Exit%
echo.
echo.
echo.%line%
choice /c 1E /n /m "%ContExit%"
if errorlevel 2 goto :EOF
if errorlevel 1 goto :clientlang
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 不支持服务器语言版本警告
::-------------------------------------------------------------------------------------------
:unsupportserverlang
cls
title %WizTitle% - %PurposeA% - %UnsupportedLang%
color f4
echo.%line%
echo.%WarTitle%
echo.%line%
echo.
echo.
echo.
echo.
echo.
echo.
echo. %CodError%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.%line2%
echo.
echo.   1 - %BackLangMenu%
echo.
echo.   E - %Exit%
echo.
echo.
echo.%line%
choice /c 1E /n /m "%ContExit%"
if errorlevel 2 goto :EOF
if errorlevel 1 (color f0 & goto :langserver)
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 填写你的更新 ID
::-------------------------------------------------------------------------------------------
:setupdateid
cls
title %WizTitle% - %PurposeA% - %WriteBuildID%

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
:: 选择协同版更新 ID
::-------------------------------------------------------------------------------------------
:chooseupdateidteam
cls
title %WizTitle% - %PurposeA% - %SelectTeamID%

echo.%line%
echo.%TeamTitle0%
echo.%line%
echo.%TeamMenuMain%
echo.
echo.Windows 10 Build 15063 %withitbuild%
echo.
echo. A - Windows 10 %WizVer% 1703 ^(%TeamBuild% rs2_release %TeamBranch%^)
echo.
echo.Windows 10 Build 1904x %withitbuild%
echo.
echo. B - Windows 10 %WizVer% 2004 ^(%TeamBuild% vb_release %TeamBranch%^)
echo.
echo. C - Windows 10 %WizVer% 20H2 ^(%TeamBuild% 20H2_release %TeamBranch%^)
echo.
echo. D - Windows 10 %WizVer% 22H2 ^(%TeamBuild% 22H2_release %TeamBranch%^)
echo.
echo.Windows 10 Build 1910x %withitbuild%
echo.%TeamDevChannelDes%
echo.
echo. E - %TeamDev1%
echo.
echo.%TeamDevOthDes%
echo.
echo. F - %TeamDev2%
echo.
echo.%StepDescription2%
echo.%line%
choice /c ABCDEFGH /n /m "%TxtDes1%"
if errorlevel 8 goto :first
if errorlevel 7 goto :chooseclientedition
if errorlevel 6 goto :setupdateid
if errorlevel 5 goto :chooseupdateidteamDev
if errorlevel 4 goto :chooseupdateidteam22H2
if errorlevel 3 goto :chooseupdateidteam20H2
if errorlevel 2 goto :chooseupdateidteamvb
if errorlevel 1 goto :chooseupdateidteamrs2
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 选择协同版更新 ID —— Windows 10 版本 1703 x64
::-------------------------------------------------------------------------------------------
:chooseupdateidteamrs2
cls
title %WizTitle% - %PurposeA% - %SelectTeamID%

echo.%line%
echo.%TeamTitle1%
echo.%line%
echo.%rs2teamdes1%
echo.%listx64%
echo.
echo.
echo. 01 - 15063.25  ^| 02 - 15063.104 ^| 03 - 15063.111 ^| 04 - 15063.113 ^| 05 - 15063.131
echo.
echo. 06 - 15063.146 ^| 07 - 15063.166 ^| 08 - 15063.173 ^| 09 - 15063.278 ^| 10 - 15063.280
echo.
echo. 11 - 15063.285 ^| 12 - 15063.299 ^| 13 - 15063.313 ^| 14 - 15063.327 ^| 15 - 15063.358
echo.
echo. 16 - 15063.361 ^| 17 - 15063.369 ^| 18 - 15063.373 ^| 19 - 15063.379 ^| 20 - 15063.382
echo.
echo. 21 - 15063.383 ^| 22 - 15063.394 ^| 23 - 15063.414 ^| 24 - 15063.415 ^| 25 - 15063.438
echo.
echo. 26 - 15063.442 ^| 27 - 15063.534 ^| 28 - 15063.542 ^| 29 - 15063.543 ^| 30 - 15063.546
echo.
echo.
echo.
echo. A - 32 %bitedi% ^| D - arm64 %bitedi%
echo.
echo.
echo.
echo.
echo.%StepDescription2%
echo.%line%
set /p Team=%TxtDes1%
if %Team% equ 30 (set id=003e295c-f35f-40ba-8205-8deaa33f79d7&goto :uupdownload)
if %Team% equ 29 (set id=b304b230-c3d2-44da-bb85-b8bd4c16d1e6&goto :uupdownload)
if %Team% equ 28 (set id=88a062af-306a-4cd7-9b8e-f3c168dd8b14&goto :uupdownload)
if %Team% equ 27 (set id=11adf0ad-6ead-4b7e-b270-6d028f11ea6d&goto :uupdownload)
if %Team% equ 26 (set id=ca3a9899-1092-40f4-b1c9-3dae67d42c3c&goto :uupdownload)
if %Team% equ 25 (set id=cf7f56a6-4e99-403c-83ba-08a90bee0af6&goto :uupdownload)
if %Team% equ 24 (set id=f204b2bb-6652-4920-90ff-2d373934480e&goto :uupdownload)
if %Team% equ 23 (set id=f58387e8-1e82-45ae-baab-113dd4539f04&goto :uupdownload)
if %Team% equ 22 (set id=5535e16a-f4b0-4a36-bbd5-17d1979dfa73&goto :uupdownload)
if %Team% equ 21 (set id=3fd94581-31eb-4781-855d-58f906678319&goto :uupdownload)
if %Team% equ 20 (set id=129c395c-e07f-4c5b-9747-1f896b67aa20&goto :uupdownload)
if %Team% equ 19 (set id=971b5ea9-bf72-4cf7-9c13-5378d2cbe637&goto :uupdownload)
if %Team% equ 18 (set id=b1e6e741-21cd-45a6-8006-cec085a2ec51&goto :uupdownload)
if %Team% equ 17 (set id=c4c70019-7248-4c76-9be0-b0a59d14389d&goto :uupdownload)
if %Team% equ 16 (set id=ae7d148a-aa42-46d5-8f7a-cde066a8ee05&goto :uupdownload)
if %Team% equ 15 (set id=0038d1a5-17d8-4e1e-a0c7-85c0b1793222&goto :uupdownload)
if %Team% equ 14 (set id=642a21ba-02c6-4968-b072-332cebc0de71&goto :uupdownload)
if %Team% equ 13 (set id=5bcefd9e-3a03-4a82-b264-dec176920052&goto :uupdownload)
if %Team% equ 12 (set id=b600f8af-976b-4216-b1d3-8768c33027d5&goto :uupdownload)
if %Team% equ 11 (set id=8f2e464d-2844-4712-96a2-87aed9bf3d4f&goto :uupdownload)
if %Team% equ 10 (set id=83bc9dc5-9a1e-4f7c-9e34-664cda880a0d&goto :uupdownload)
if %Team% equ 09 (set id=53a3b790-9b7f-47d5-a628-6fdf6b902add&goto :uupdownload)
if %Team% equ 08 (set id=5707c74f-903a-4d78-8ec8-53a9f9e4d723&goto :uupdownload)
if %Team% equ 07 (set id=5f6d9785-4689-4284-8a5f-ef40412fbf54&goto :uupdownload)
if %Team% equ 06 (set id=abf571ca-4739-44f2-a67d-342f3fc4b4d5&goto :uupdownload)
if %Team% equ 05 (set id=6feb2984-a8bf-4a7b-a69b-d069150ff7ec&goto :uupdownload)
if %Team% equ 04 (set id=a722f6a6-5c9c-42d4-9daa-28091facbaaa&goto :uupdownload)
if %Team% equ 03 (set id=286d71dd-97cb-4495-bfdb-7cec6b034360&goto :uupdownload)
if %Team% equ 02 (set id=b6b9ce32-38b7-43a7-9d7c-fb64037bb971&goto :uupdownload)
if %Team% equ 01 (set id=ea620b55-7846-466e-b867-b3178df7e5bf&goto :uupdownload)
if %Team% equ d goto :chooseupdateidteamrs2arm64
if %Team% equ c goto :first
if %Team% equ b goto :chooseupdateidteam
if %Team% equ a goto :chooseupdateidteamrs2x86
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 选择协同版更新 ID —— Windows 10 版本 1703 x86
::-------------------------------------------------------------------------------------------
:chooseupdateidteamrs2x86
cls
title %WizTitle% - %PurposeA% - %SelectTeamID%

echo.%line%
echo.%TeamTitle1%
echo.%line%
echo.%rs2teamdes1%
echo.%listx86%
echo.
echo. 01 - 15063.25  ^| 02 - 15063.104 ^| 03 - 15063.111 ^| 04 - 15063.113 ^| 05 - 15063.166
echo.
echo. 06 - 15063.173 ^| 07 - 15063.278 ^| 08 - 15063.280 ^| 09 - 15063.285 ^| 10 - 15063.299
echo.
echo. 11 - 15063.313 ^| 12 - 15063.327 ^| 13 - 15063.358 ^| 14 - 15063.361 ^| 15 - 15063.369
echo.
echo. 16 - 15063.373 ^| 17 - 15063.379 ^| 18 - 15063.382 ^| 19 - 15063.383 ^| 20 - 15063.394
echo.
echo. 21 - 15063.414 ^| 22 - 15063.415 ^| 23 - 15063.438 ^| 24 - 15063.442 ^| 25 - 15063.534
echo.
echo. 26 - 15063.542 ^| 27 - 15063.543 ^| 28 - 15063.546
echo.
echo.
echo.
echo. A - 64 %bitedi% ^| D - arm64 %bitedi%
echo.
echo.
echo.
echo.
echo.
echo.%StepDescription2%
echo.%line%
set /p Team=%TxtDes1%
if %Team% equ 28 (set id=cf72bd0c-e1f4-46d1-9d84-4658e9ec3cc4&goto :uupdownload)
if %Team% equ 27 (set id=51b39ee0-f4b1-4b9f-9eea-29f5ec887c56&goto :uupdownload)
if %Team% equ 26 (set id=33ee1eab-bef1-44a0-b7fe-d9955f2fa07b&goto :uupdownload)
if %Team% equ 25 (set id=h7172c7c7-5d4b-43c5-8177-9f0cb64f409a&goto :uupdownload)
if %Team% equ 24 (set id=5c3e4ebd-5dd0-4da1-9a4c-96607224c8a4&goto :uupdownload)
if %Team% equ 23 (set id=34ed4f64-c17a-43fc-9e97-aa42789b9d53&goto :uupdownload)
if %Team% equ 22 (set id=8505d678-b9d5-4913-9699-1bad9daae961&goto :uupdownload)
if %Team% equ 21 (set id=e0b701d7-e4dc-48b1-a761-b1d8256e4165&goto :uupdownload)
if %Team% equ 20 (set id=158e4a49-88e5-4d03-b83a-937e008fc4eb&goto :uupdownload)
if %Team% equ 19 (set id=245d85f9-8f09-483b-ab10-9ced5429367d&goto :uupdownload)
if %Team% equ 18 (set id=b7b6ae2e-a070-4ee9-8d1d-340f0ad8995a&goto :uupdownload)
if %Team% equ 17 (set id=7ed54664-08e5-4fe8-9911-43945113e883&goto :uupdownload)
if %Team% equ 16 (set id=cf9c28d5-ea7e-471e-9df0-c3573e042e27&goto :uupdownload)
if %Team% equ 15 (set id=01372139-3ec5-469b-874b-d2e23969d742&goto :uupdownload)
if %Team% equ 14 (set id=dfed58f8-6808-4c21-a9d5-1808e51c9bad&goto :uupdownload)
if %Team% equ 13 (set id=a2e6c785-aedd-404a-b789-c6cb1e131036&goto :uupdownload)
if %Team% equ 12 (set id=7a092b64-a46c-4391-ba70-dc2c04f0e313&goto :uupdownload)
if %Team% equ 11 (set id=aa021f8f-5db8-445a-a9df-433e58087eff&goto :uupdownload)
if %Team% equ 10 (set id=efd3bef7-c16b-4609-bd04-a3cd3b0f59ef&goto :uupdownload)
if %Team% equ 09 (set id=9363780a-3324-4f64-9da4-e913c43a53dd&goto :uupdownload)
if %Team% equ 08 (set id=9a12f506-954d-4875-adc1-b28da2647706&goto :uupdownload)
if %Team% equ 07 (set id=a0a9a074-cc3f-4cf1-8192-4eb506754572&goto :uupdownload)
if %Team% equ 06 (set id=2e92096d-e42a-40c7-8d9e-cf3a7a465ca0&goto :uupdownload)
if %Team% equ 05 (set id=0fa8de44-0783-475f-b927-54aaa54ec052&goto :uupdownload)
if %Team% equ 04 (set id=b6600c01-9ea0-4153-8957-4df2a14912d3&goto :uupdownload)
if %Team% equ 03 (set id=8b654929-1684-4775-a687-0509e4dec671&goto :uupdownload)
if %Team% equ 02 (set id=47a8e046-162e-467c-8553-254cc0213b5c&goto :uupdownload)
if %Team% equ 01 (set id=bbcd21d0-0deb-4bb2-b9ab-26b6dd711e84&goto :uupdownload)
if %Team% equ d goto :chooseupdateidteamrs2arm64
if %Team% equ c goto :first
if %Team% equ b goto :chooseupdateidteam
if %Team% equ a goto :chooseupdateidteamrs2
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 选择协同版更新 ID —— Windows 10 版本 1703 arm64
::-------------------------------------------------------------------------------------------
:chooseupdateidteamrs2arm64
cls
title %WizTitle% - %PurposeA% - %SelectTeamID%

echo.%line%
echo.%TeamTitle1%
echo.%line%
echo.%rs2teamdes1%
echo.%listarm64%
echo.
echo. 01 - 15063.25  ^| 02 - 15063.104 ^| 03 - 15063.111 ^| 04 - 15063.113 ^| 05 - 15063.166
echo.
echo. 06 - 15063.173 ^| 07 - 15063.278 ^| 08 - 15063.280 ^| 09 - 15063.285 ^| 10 - 15063.299
echo.
echo. 11 - 15063.313 
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
echo. A - 32 %bitedi% ^| D - x64 %bitedi%
echo.
echo.
echo.
echo.
echo.%StepDescription2%
echo.%line%
set /p Team=%TxtDes1%
if %Team% equ 11 (set id=be89586f-808b-484f-8d56-5a5646809c82&goto :uupdownload)
if %Team% equ 10 (set id=78c6fcde-2db1-4d96-9c60-abe10aedd8f0&goto :uupdownload)
if %Team% equ 09 (set id=61cf2706-4b44-40e8-9508-30db14861e69&goto :uupdownload)
if %Team% equ 08 (set id=79ec2c9d-c416-4187-8e9d-80316d064478&goto :uupdownload)
if %Team% equ 07 (set id=daa58c4f-7ecf-43bd-9053-921a70f224d5&goto :uupdownload)
if %Team% equ 06 (set id=84c083a9-01fe-4b71-b0ff-5c29305a9b18&goto :uupdownload)
if %Team% equ 05 (set id=308b6b0e-6f4f-4977-9842-ca08af8b0324&goto :uupdownload)
if %Team% equ 04 (set id=8c0fa76b-fef7-4457-b73b-3ae787b218a0&goto :uupdownload)
if %Team% equ 03 (set id=1a6b4654-7248-4619-a916-2f26545c342f&goto :uupdownload)
if %Team% equ 02 (set id=2f394099-5740-46cd-a0e4-a49542de85f2&goto :uupdownload)
if %Team% equ 01 (set id=f9f78dd2-12a8-4ac1-bae4-1cd0ed29ff31&goto :uupdownload)
if %Team% equ d goto :chooseupdateidteamrs2
if %Team% equ c goto :first
if %Team% equ b goto :chooseupdateidteam
if %Team% equ a goto :chooseupdateidteamrs2x86
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 选择协同版更新 ID
::-------------------------------------------------------------------------------------------
:chooseupdateidteamvb
cls
title %WizTitle% - %PurposeA% - %SelectTeamID%

echo.%line%
echo.%TeamTitle2%
echo.%line%
echo.%vbteamdes1%
echo.
echo. 1 - 19041.460
echo.
echo. 2 - 19041.396
echo.
echo. 3 - 19041.350
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
echo.%StepDescription2%
echo.%line%
set /p Team=%TxtDes1%
choice /c 123BC /n /m "%TxtDes1%"
if errorlevel 5 goto :first
if errorlevel 4 goto :chooseupdateidteam
if errorlevel 3 (set id=5d2cc5fc-1fbf-40f6-8f60-692faf474e17&goto :uupdownload)
if errorlevel 2 (set id=022ecdb0-4b73-4e43-9d1a-47d65aeeed95&goto :uupdownload)
if errorlevel 1 (set id=300ae013-034b-4cf7-9ed5-d64da6099127&goto :uupdownload)
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 选择协同版更新 ID
::-------------------------------------------------------------------------------------------
:chooseupdateidteam20H2
cls
title %WizTitle% - %PurposeA% - %SelectTeamID%

echo.%line%
echo.%TeamTitle3%
echo.%line%
echo.%vbteamdes2%
echo.
echo. 1 - 19042.538 ^(20H2_release %TeamBranch%^)
echo.
echo. 2 - 19042.545 ^(20H2_release %TeamBranch%^)
echo.
echo. 3 - 19042.572 ^(20H2_release %TeamBranch%^)
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
echo.%StepDescription2%
echo.%line%
choice /c 123BC /n /m "%TxtDes1%"
if errorlevel 5 goto :first
if errorlevel 4 goto :chooseupdateidteam
if errorlevel 3 (set id=65d035a2-9d8e-42a2-87cb-bb89f0b9eaed&goto :uupdownload)
if errorlevel 2 (set id=8b2d3ddf-f617-4df4-a1da-15dcbf0e757c&goto :uupdownload)
if errorlevel 1 (set id=bbcdbf02-fd0f-497f-9d01-956bec5f9c13&goto :uupdownload)
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 选择协同版更新 ID
::-------------------------------------------------------------------------------------------
:chooseupdateidteam22H2
cls
title %WizTitle% - %PurposeA% - %SelectTeamID%

echo.%line%
echo.%TeamTitle4%
echo.%line%
echo.%vbteamdes3%
echo.
echo. 1 - 19045.1865 ^(22H2_release %TeamBranch%^)
echo.
echo. 2 - 19045.1889 ^(22H2_release %TeamBranch%^)
echo.
echo. 3 - 19045.1949 ^(22H2_release %TeamBranch%^)
echo.
echo. 4 - 19045.2006 ^(22H2_release %TeamBranch%^)
echo.
echo. 5 - 19045.2075 ^(22H2_release %TeamBranch%^)
echo.
echo. 6 - 19045.2130 ^(22H2_release %TeamBranch%^)
echo.
echo. 7 - 19045.2193 ^(22H2_release %TeamBranch%^)
echo.
echo. 8 - 19045.2194 ^(22H2_release %TeamBranch%^)
echo.
echo.
echo.
echo.
echo.
echo.
echo.%StepDescription2%
echo.%line%
choice /c 12345678BC /n /m "%TxtDes1%"
if errorlevel 10 goto :first
if errorlevel 9 goto :chooseupdateidteam
if errorlevel 8 (set id=1617284e-dc6c-487e-a88b-6a548380c2f0&goto :uupdownload)
if errorlevel 7 (set id=bfbeb0e2-1f9f-44ca-9337-eeb16c6862fd&goto :uupdownload)
if errorlevel 6 (set id=8905edce-8eb6-44ac-ba28-9230ccfe5dd4&goto :uupdownload)
if errorlevel 5 (set id=94193002-577e-467a-ac19-9c30eaba1523&goto :uupdownload)
if errorlevel 4 (set id=d46a4fc9-2fd9-4a12-b8fd-0c9e22a5456c&goto :uupdownload)
if errorlevel 3 (set id=d5ea3411-5467-4284-9ad2-71a2e1a5d21a&goto :uupdownload)
if errorlevel 2 (set id=786c3fdf-ddf7-45b6-9e6d-ecf8adfa2a06&goto :uupdownload)
if errorlevel 1 (set id=2bbf5b05-bddf-4121-bb3d-01c9dff6986e&goto :uupdownload)
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 选择协同版更新 ID —— Dev 渠道版本
::-------------------------------------------------------------------------------------------
:chooseupdateidteamDev
cls
title %WizTitle% - %PurposeA% - %SelectTeamID%

echo.%line%
echo.%TeamTitle5%
echo.%line%
echo.%TeamDevDes%
echo. 01 - 19100.1008 ^| 02 - 19100.1009 ^| 03 - 19100.1019 ^| 04 - 19100.1021 ^| 05 - 19100.1023
echo. 06 - 19100.1025 ^| 07 - 19100.1026 ^| 08 - 19100.1031 ^| 09 - 19100.1035 ^| 10 - 19100.1039
echo. 11 - 19100.1041 ^| 12 - 19100.1045 ^| 13 - 19100.1047 ^| 14 - 19100.1050 ^| 15 - 19100.1051
echo. 16 - 19100.1055 ^| 17 - 19100.1057 ^| 18 - 19100.1060 ^| 19 - 19100.1062 ^| 20 - 19100.1064
echo. 21 - 19100.1065 ^| 22 - 19100.1066 ^| 23 - 19100.1067 ^| 24 - 19100.1070 ^| 25 - 19100.1079
echo. 26 - 19100.1085 ^| 27 - 19100.1086 ^| 28 - 19100.1089 ^| 29 - 19100.1090 ^| 30 - 19101.1109
echo. 31 - 19101.1112 ^| 32 - 19101.1116 ^| 33 - 19100.1117 ^| 34 - 19100.1120 ^| 35 - 19100.1121
echo. 36 - 19101.1122 ^| 37 - 19101.1123 ^| 38 - 19100.1125 ^| 39 - 19100.1127
echo.%line3%
echo.%TeamSVC%
echo.
echo. E1 - 19100.1045 ^| E2 - 19101.1125
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
echo.%StepDescription2%
echo.%line%
set /p Team=%TxtDes1%
if %Team% equ E2 (set id=b85bdd30-54f8-4166-91bd-2007c75ed3e3&goto :uupdownload)
if %Team% equ E1 (set id=24fd32a8-3585-46f8-b356-7fdc6d016a93&goto :uupdownload)
if %Team% equ 39 (set id=c2023395-8c48-47c0-bcc0-ee799bd084c9&goto :uupdownload)
if %Team% equ 38 (set id=ad0a4637-7a81-4f95-8617-3b65fa53df60&goto :uupdownload)
if %Team% equ 37 (set id=ca2723ff-1574-4277-a377-85912f60590e&goto :uupdownload)
if %Team% equ 36 (set id=590b8181-8c19-44c7-b260-e05aba18c682&goto :uupdownload)
if %Team% equ 35 (set id=b16a4423-3920-4a7e-a9ff-70ac1f8819ce&goto :uupdownload)
if %Team% equ 34 (set id=bb92e6b8-83ae-4ca7-832a-350e45fd6d41&goto :uupdownload)
if %Team% equ 33 (set id=794402a4-95ef-436a-9697-308547ccd8ce&goto :uupdownload)
if %Team% equ 32 (set id=7b1233a6-3b75-4248-ae7c-a70a288e19aa&goto :uupdownload)
if %Team% equ 31 (set id=3c9f01e3-501c-40fd-bcd2-751b9e6332ee&goto :uupdownload)
if %Team% equ 30 (set id=373a32fd-5a69-47d1-a5bb-e80f19b93820&goto :uupdownload)
if %Team% equ 29 (set id=53794d88-eed7-4baf-a2eb-a427a15cc5d7&goto :uupdownload)
if %Team% equ 28 (set id=4ff82994-69ba-4bec-ab26-3383a1d0fc90&goto :uupdownload)
if %Team% equ 27 (set id=e28e1d05-667f-434c-9702-89c9e34ed38b&goto :uupdownload)
if %Team% equ 26 (set id=91f38675-4298-43d9-a258-3130369a6829&goto :uupdownload)
if %Team% equ 25 (set id=59e58c68-0c40-4cee-880f-500bf04bbcfa&goto :uupdownload)
if %Team% equ 24 (set id=b8c1be9f-b120-486f-b9db-32308905439e&goto :uupdownload)
if %Team% equ 23 (set id=2bf7a0c9-a2b0-4333-a3e8-7eed56f0e897&goto :uupdownload)
if %Team% equ 22 (set id=61ab3641-436e-4f6a-9999-0be13c098849&goto :uupdownload)
if %Team% equ 21 (set id=ab2ce6b7-8edf-4e47-9131-d71aa5600cba&goto :uupdownload)
if %Team% equ 20 (set id=f54ffb54-4fd0-4c49-b150-613755a69f3c&goto :uupdownload)
if %Team% equ 19 (set id=8a1d71c1-6cb9-4cbf-9f9b-ab9b885282e7&goto :uupdownload)
if %Team% equ 18 (set id=763a6025-9e33-4b10-abed-1c41a89d3984&goto :uupdownload)
if %Team% equ 17 (set id=6d51e694-7463-4b0d-afa8-06a88f52c9c7&goto :uupdownload)
if %Team% equ 16 (set id=e84a6181-f9c1-41c1-be71-aea13769a001&goto :uupdownload)
if %Team% equ 15 (set id=93d95e92-96f9-42cf-9d80-e827b8de3cbc&goto :uupdownload)
if %Team% equ 14 (set id=abb92723-44a1-44f5-a343-9ca1c339457f&goto :uupdownload)
if %Team% equ 13 (set id=bad2c98a-c8ac-4dd7-a1fb-ea6b2a94f538&goto :uupdownload)
if %Team% equ 12 (set id=a29357bc-cc1b-4d65-8a5b-19a59f81b602&goto :uupdownload)
if %Team% equ 11 (set id=131f4140-7928-4178-8e9b-1f770896dc30&goto :uupdownload)
if %Team% equ 10 (set id=217267dd-e9f5-4c49-85f6-0d221b2535ed&goto :uupdownload)
if %Team% equ 09 (set id=d48c82d9-9b41-4153-b1f6-7217231f145a&goto :uupdownload)
if %Team% equ 08 (set id=ce6e37a3-0942-4012-ba22-8dd38877a1c7&goto :uupdownload)
if %Team% equ 07 (set id=6f9e5521-5cb0-4b9c-9e65-c385781a005e&goto :uupdownload)
if %Team% equ 06 (set id=39d733eb-bb06-440c-8cfb-b1bc4492293a&goto :uupdownload)
if %Team% equ 05 (set id=cb9a18fe-485d-4b57-92b6-85a398725c3e&goto :uupdownload)
if %Team% equ 04 (set id=c9d0ea4a-6874-45f7-bb63-929e48742785&goto :uupdownload)
if %Team% equ 03 (set id=40a6c352-b0f4-49a6-a0c3-3dc1537e1d3f&goto :uupdownload)
if %Team% equ 02 (set id=87364f44-95b4-4bf0-917e-5b28f266610d&goto :uupdownload)
if %Team% equ 01 (set id=1503c1dc-82c3-4ebd-8299-afd449411884&goto :uupdownload)
if %Team% equ c goto :first
if %Team% equ b goto :chooseupdateidteam
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: UUP 文件下载主进程
::-------------------------------------------------------------------------------------------
:uupdownload
cls
title %WizTitle% - %PurposeA% - %SearchUpdScript%

cd /d "%~dp0"
if NOT EXIST %aria2% set error=1&goto :ERROR

echo.%line%
echo.%UPDScript%
echo.%line%
%aria2% %cert%-x16 -s16 -d"%cd%" -o"%aria2Script%" "https://uupdump.net/get.php?id=%id%&pack=%Lang%&edition=%SKU%&aria2=2"
if %ERRORLEVEL% GTR 0 set error=2&call :ERROR & exit /b 1

for /F "tokens=2 delims=:" %%i in ('findstr #UUPDUMP_ERROR: "%aria2Script%"') do set DETECTED_ERROR=%%i
if NOT [%DETECTED_ERROR%] == [] (set error=3&call :ERROR)

cls
title %WizTitle% - %PurposeA% - %DLUUPFiles%

echo.%line%
echo.%DLFiles%
echo.%line%
"%aria2%" --no-conf --log-level=info --log="aria2_download.log" -x16 -s16 -j5 -c -R -d"%destDir%" -i"%aria2Script%"
if %ERRORLEVEL% EQU 0 set error=0&call :ERROR&exit /b 1
if %ERRORLEVEL% GTR 0 set error=2&call :ERROR&exit /b 1

pause
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 下载 aria2 模组（如果 aria2 丢失）
::-------------------------------------------------------------------------------------------
:DOWNLOAD_ARIA2
if NOT EXIST files mkdir files
powershell -NoProfile Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/JRJSheep/UUP-Download-Wizard/main/UUPdownload_with_converter/files/aria2c.exe" -OutFile %aria2%
exit /b
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: 完成/错误提示页面
::-------------------------------------------------------------------------------------------
:ERROR
cls
if %error% equ 0 title %WizTitle% - %PurposeA% - %DLFinish%
if %error% gtr 0 title %WizTitle% - %PurposeA% - %FoundError%

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
	echo.
	echo.%FLDLD%
	echo.
	echo.
	echo.
	echo.%FileDirectory%%~dp0UUPs\%FileDirectory2%
	echo.
	echo.
	echo.
	echo.
	echo.%FileTips%
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	) else if %error% equ 1 (
		echo.%ErrorTxt1% %aria2%%ErrorTxt11%
		echo.
		echo.
		echo.
		echo.%DLAria%
		echo.
		echo.https://aria2.github.io/
		echo.
		echo.
		echo.%ErrorTxt2%
		echo.
		echo.%FileExample%
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
		echo.%ErrorTxt3%
		echo.
		echo.
		echo.%ErrorTxt4%
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
)
echo.
echo.
echo.%line%
pause
exit
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:dlang
if /i %dlang%==1 call files\lang.cmd -en & exit /b
if /i %dlang%==2 call files\lang.cmd -cn & exit /b
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