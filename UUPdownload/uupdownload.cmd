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

color f0


call files\lang.cmd -en

:: 版本指示内容
set "Ver=4.0"
set "DispVersion=v%Ver%"
set "udBuild=650.8"
set LVer=1 && call :langver

:: SKU 版本指示
set "PurposeA=%PurposeA%"
set "PurposeB=%PurposeB%"
set "Purpose=%PurposeA%"

:: 语言选择
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
echo.%WizVer% %Ver% ^(%Build% %udBuild%^)  %LangVer% ^(%LVer%%LangVer2%%LVerMax%^)
echo.%EditionApplicableDesA%%Purpose%%EditionApplicableDesB%
echo.
echo.^(c^) 2016-2022 %CopyRight%
echo.%VerDes%
echo.%line2%
choice /c 12 /n /m "%dlangtxt%"
if errorlevel 2 (set dlang=2 & call :dlang)
if errorlevel 1 (set dlang=1 & call :dlang)

:: SKU 版本指示
set "PurposeA=%PurposeA%"
set "PurposeB=%PurposeB%"
set "Purpose=%PurposeA%"

:: 其他参数
set "aria2=files\aria2c.exe"
set "aria2Script=files\aria2_script.%random%.txt"
set "destDir=UUPs"
set "Network="
set "Lang="
set "SKU="
set "cert=--check-certificate=false "

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

title %title1%%title2% %DispVersion% - %Purpose%

:: 网络预先设置
:first
cls
if exist \aria2_download.log del /s /q \aria2_download.log
if exist files\aria2_script.*.txt del /s /q files\aria2_script.*.txt

cls
echo.%line%
echo.%WelcomeTitle%
echo.%line%
echo.%WelDes%
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
echo.%WizVer% %Ver% ^(%Build% %udBuild%^)  %LangVer% ^(%LVer%%LangVer2%%LVerMax%^)
echo.%EditionApplicableDesA%%Purpose%%EditionApplicableDesB%
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
title %title1%%title2% %DispVersion% - %Purpose% - %SelectPlat%

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
title %title1%%title2% %DispVersion% - %Purpose% - %SelectClientLang%

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
title %title1%%title2% %DispVersion% - %Purpose% - %SelectServerLang%

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

:: 选择客户端版本
:chooseclientedition
cls
title %title1%%title2% %DispVersion% - %Purpose% - %SelectSKU1%

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


:: 选择客户端版本组合
:chooseclienteditiongroup
cls
title %title1%%title2% %DispVersion% - %Purpose% - %SelectSKUGroup%

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


:: 选择服务器版本
:chooseserveredition
cls
title %title1%%title2% %DispVersion% - %Purpose% - %SelectSKU1%

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

:: 选择服务器版本组合
:chooseservereditiongroup
cls
title %title1%%title2% %DispVersion% - %Purpose% - %SelectSKUGroup%

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


:: 不支持客户端语言版本警告
:unsupportclientlang
cls
title %title1%%title2% %DispVersion% - %Purpose% - %UnsupportedLang%
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

:: 不支持服务器语言版本警告
:unsupportserverlang
cls
title %title1%%title2% %DispVersion% - %Purpose% - %UnsupportedLang%
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

:: 填写你的更新 ID
:setupdateid
cls
title %title1%%title2% %DispVersion% - %Purpose% - %WriteBuildID%

echo.%line%
echo.%FillIDTitle%
echo.%line%
echo.%FillIDDes%
echo.
echo.
echo.%line2%
echo.%IDExample%a1b2c3d4-123b-1a2b-a3b4-1a2b3c4d5e6f
echo.%line2%
echo.
echo.
set /p id=%FillID%
set "id=%id%"&goto :uupdownload

:: 选择协同版更新 ID
:chooseupdateidteam
cls
title %title1%%title2% %DispVersion% - %Purpose% - %SelectTeamID%

echo.%line%
echo.%TeamTitle%
echo.%line%
echo.%TeamDes%
echo. 01 - 19042.538 ^(20H2_release %TeamBranch%^)
echo. 02 - 19042.545 ^(20H2_release %TeamBranch%^)
echo. 03 - 19042.572 ^(20H2_release %TeamBranch%^)
echo.
echo.%TeamDevDes%
echo. 04 - 19100.1008 ^| 05 - 19100.1009 ^| 06 - 19100.1019 ^| 07 - 19100.1021 ^| 08 - 19100.1023
echo. 09 - 19100.1025 ^| 10 - 19100.1026 ^| 11 - 19100.1031 ^| 12 - 19100.1035 ^| 13 - 19100.1039
echo. 14 - 19100.1041 ^| 15 - 19100.1045 ^| 16 - 19100.1047 ^| 17 - 19100.1050 ^| 18 - 19100.1051
echo. 19 - 19100.1055 ^| 20 - 19100.1057 ^| 21 - 19100.1060 ^| 22 - 19100.1062 ^| 23 - 19100.1064
echo. 24 - 19100.1065 ^| 25 - 19100.1066 ^| 26 - 19100.1067 ^| 27 - 19100.1070 ^| 28 - 19100.1079
echo. 29 - 19100.1085 ^| 30 - 19100.1086 ^|
echo.%line3%
echo.%TeamSVC%
echo.
echo. E1 - 19100.1045
echo.
echo.%line3%
echo.%TeamDevOth%
echo.
echo. E2 - %TeamDev%
echo.
echo.%StepDescription2%
echo.%line%
set /p Team=%TxtDes1%
if %Team% equ E2 goto :setupdateid
if %Team% equ E1 (set id=24fd32a8-3585-46f8-b356-7fdc6d016a93&goto :uupdownload)
if %Team% equ 30 (set id=e28e1d05-667f-434c-9702-89c9e34ed38b&goto :uupdownload)
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
if %Team% equ c goto :first
if %Team% equ b goto :chooseedition

:uupdownload
cls
title %title1%%title2% %DispVersion% - %Purpose% - %SearchUpdScript%

cd /d "%~dp0"
if NOT EXIST %aria2% set error=1&goto :ERROR

echo.%line%
echo.%UPDScript%
echo.%line%
"%aria2%" --no-conf %cert%--log-level=info --log="aria2_download.log" -o"%aria2Script%" --allow-overwrite=true --auto-file-renaming=false "https://uupdump.net/get.php?id=%id%&pack=%Lang%&edition=%SKU%&aria2=2"
if %ERRORLEVEL% GTR 0 set error=2&call :ERROR & exit /b 1

for /F "tokens=2 delims=:" %%i in ('findstr #UUPDUMP_ERROR: "%aria2Script%"') do set DETECTED_ERROR=%%i
if NOT [%DETECTED_ERROR%] == [] (set error=3&call :ERROR)

cls
title %title1%%title2% %DispVersion% - %Purpose% - %DLUUPFiles%

echo.%line%
echo.%DLFiles%
echo.%line%
"%aria2%" --no-conf --log-level=info --log="aria2_download.log" -x16 -s16 -j5 -c -R -d"%destDir%" -i"%aria2Script%"
if %ERRORLEVEL% EQU 0 set error=0&call :ERROR&exit /b 1
if %ERRORLEVEL% GTR 0 set error=2&call :ERROR&exit /b 1

pause


:ERROR
cls
if %error% equ 0 title %title1%%title2% %DispVersion% - %Purpose% - %DLFinish%
if %error% gtr 0 title %title1%%title2% %DispVersion% - %Purpose% - %FoundError%
color f4
echo.%line%
if %error% equ 0 (color f0&echo %FinishTitle%)
if %error% gtr 0 (color f4&echo.%ErrorTitle%)
echo.%line%
echo.
echo.
if %error% equ 0 call :finish
if %error% equ 1 call :aria_error
if %error% equ 2 call :download_error
if %error% equ 3 call :uup_error
echo.
echo.
echo.%line%
pause
exit /b

:finish
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
)

:aria_error
if %error% equ 1 (
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
)

:download_error
if %error% equ 2 (
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
)

:uup_error
if %error% equ 3 (
echo.
echo.
echo.
echo.
echo.%ErrorTxt5%%DETECTED_ERROR%
echo.
echo.
echo.%ErrorTxt6%
echo.
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
echo.
echo.
)

:dlang
if /i %dlang%==1 call files\lang.cmd -en & exit /b
if /i %dlang%==2 call files\lang.cmd -cn & exit /b
exit /b

:langver
if /i %LVer%==1 call files\lang.cmd -LVer && exit /b
exit /b

:EOF
exit /b