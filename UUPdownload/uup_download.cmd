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

:: 语言选择
call files\lang.cmd -en
title %langchoose%

echo %line%
echo %langwelcome%
echo %line%
echo.
echo     1 - %lang%
echo.
echo     2 - %lang2%
echo.
echo.
echo %line2%
set /p dlang=%dlangtxt%
if %dlang% equ 1 (set dlang=1 & call :dlang)
if %dlang% equ 2 (set dlang=2 & call :dlang)

set LVer=1 && call :langver

:: 其他参数
set "aria2=files\aria2c.exe"
set "aria2Script=files\aria2_script.%random%.txt"
set "destDir=UUPs"
set "Network="
set "Lang="
set "SKU="
set "cert=--check-certificate=false "

:: 版本指示内容
set "Ver=2.4"
set "Ver1=v%Ver%"
set "udBuild=400.25"
set "PurposeA=%PurposeA%"
set "PurposeB=%PurposeB%"
set "Purpose=%PurposeA%"

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

title %title% %Ver1% - %Purpose%

:: 网络预先设置
:first
cls
echo %line%
echo %WelcomeTitle%
echo %line%
echo %WelDes%
echo.
echo.
echo.
echo     A - %Def%
echo.
echo.
echo     B - %Alter%
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
echo %LangVer% ^(%LVer1%%LangVer2%%LVer2%^)
echo.
echo ^(c^) 2016-2021 %CopyRight%
echo %VerDes%
echo.
echo %line%
set /p Network=%TxtDes1%
if %Network% equ B (set "cert=--check-certificate=false "&goto :chooselang)
if %Network% equ A (set "cert= "&goto :chooselang)

:: 选择语言
:chooselang
cls
title %title% %Ver1% - %Purpose% - %SelectLang%

echo %line%
echo %LangTitle%
echo %line%
echo %LangDes%
echo.
echo %ListLang%
echo %line2%
echo %LangMenu01%
echo %LangMenu02%
echo %LangMenu03%
echo %LangMenu04%
echo %LangMenu05%
echo %LangMenu06%
echo %LangMenu07%
echo %LangMenu08%
echo %LangMenu09%
echo %LangMenu10%
echo %LangMenu11%
echo %LangMenu12%
echo %LangMenu13%
echo %LangMenu14%
echo %LangMenu15%
echo %LangMenu16%
echo %LangMenu17%
echo %LangMenu18%
echo %LangMenu19%
echo %line%
set /p Lang=%TxtDes1%
if %Lang% geq 39 goto :unsupportlang
if %Lang% equ 38 (set Lang=zh-tw&goto :chooseedition)
if %Lang% equ 37 (set Lang=zh-cn&goto :chooseedition)
if %Lang% equ 36 (set Lang=it-it&goto :chooseedition)
if %Lang% equ 35 (set Lang=en-gb&goto :chooseedition)
if %Lang% equ 34 (set Lang=en-us&goto :chooseedition)
if %Lang% equ 33 (set Lang=hu-hu&goto :chooseedition)
if %Lang% equ 32 (set Lang=he-il&goto :chooseedition)
if %Lang% equ 31 (set Lang=el-gr&goto :chooseedition)
if %Lang% equ 30 (set Lang=es-es&goto :chooseedition)
if %Lang% equ 29 (set Lang=es-mx&goto :chooseedition)
if %Lang% equ 28 (set Lang=uk-ua&goto :chooseedition)
if %Lang% equ 27 (set Lang=tr-tr&goto :chooseedition)
if %Lang% equ 26 (set Lang=th-th&goto :chooseedition)
if %Lang% equ 25 (set Lang=sl-si&goto :chooseedition)
if %Lang% equ 24 (set Lang=sk-sk&goto :chooseedition)
if %Lang% equ 23 (set Lang=sr-latn-rs&goto :chooseedition)
if %Lang% equ 22 (set Lang=sv-se&goto :chooseedition)
if %Lang% equ 21 (set Lang=ja-jp&goto :chooseedition)
if %Lang% equ 20 (set Lang=pt-pt&goto :chooseedition)
if %Lang% equ 19 (set Lang=pt-br&goto :chooseedition)
if %Lang% equ 18 (set Lang=nb-no&goto :chooseedition)
if %Lang% equ 17 (set Lang=ro-ro&goto :chooseedition)
if %Lang% equ 16 (set Lang=lt-lt&goto :chooseedition)
if %Lang% equ 15 (set Lang=lv-lv&goto :chooseedition)
if %Lang% equ 14 (set Lang=hr-hr&goto :chooseedition)
if %Lang% equ 13 (set Lang=cs-cz&goto :chooseedition)
if %Lang% equ 12 (set Lang=nl-nl&goto :chooseedition)
if %Lang% equ 11 (set Lang=fr-ca&goto :chooseedition)
if %Lang% equ 10 (set Lang=fr-fr&goto :chooseedition)
if %Lang% equ 09 (set Lang=fi-fi&goto :chooseedition)
if %Lang% equ 08 (set Lang=ru-ru&goto :chooseedition)
if %Lang% equ 07 (set Lang=de-de&goto :chooseedition)
if %Lang% equ 06 (set Lang=da-dk&goto :chooseedition)
if %Lang% equ 05 (set Lang=ko-kr&goto :chooseedition)
if %Lang% equ 04 (set Lang=pl-pl&goto :chooseedition)
if %Lang% equ 03 (set Lang=bg-bg&goto :chooseedition)
if %Lang% equ 02 (set Lang=et-ee&goto :chooseedition)
if %Lang% equ 01 (set Lang=ar-sa&goto :chooseedition)
if %Lang% lss 01 goto :unsupportlang

:: 选择版本
:chooseedition
cls
title %title% %Ver1% - %Purpose% -%SelectSKU1%

echo %line%
echo %BuildTitle%
echo %line%
echo %BuildDes%
echo.
echo %line2%
echo %AnyBuild%
echo    1 - %COBuild%
echo    2 - %ProBuild%
echo    3 - %TeamBuild%
echo    4 - %TeamDev%
echo.
echo %line2%
echo %CHBuild%
echo    5 - %CCSBuild%
echo.
echo %line2%
echo %EUBuild%
echo    6 - %CONBuild%
echo    7 - %ProNBuild%
echo.
echo %line2%
echo %COMBD%
echo    8 - %CombBuild%
echo.
echo %StepDescription%
echo %line%
set /p SKU=%TxtDes1%
if %SKU% geq C goto :unsupportedition
if %SKU% equ 8 goto :chooseeditiongroup
if %SKU% equ 7 (set SKU=professionaln&goto :setupdateid)
if %SKU% equ 6 (set SKU=coren&goto :setupdateid)
if %SKU% equ 5 (set SKU=corecountryspecific&goto :setupdateid)
if %SKU% equ 4 (set SKU=ppipro&goto :setupdateid)
if %SKU% equ 3 (set SKU=ppipro&goto :chooseupdateidteam)
if %SKU% equ 2 (set SKU=professional&goto :setupdateid)
if %SKU% equ 1 (set SKU=core&goto :setupdateid)
if %SKU% lss 0 goto :unsupportedition
if %SKU% equ b goto :first
if %SKU% equ B goto :first
if %SKU% equ a goto :chooselang
if %SKU% equ A goto :chooselang

:: 选择版本组合
:chooseeditiongroup
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
if %SKU% geq 8 goto :unsupportedition
if %SKU% equ 7 (set "SKU=core;coren;professional;professionaln;ppipro"&goto :setupdateid)
if %SKU% equ 6 (set "SKU=core;coren;professional;professionaln"&goto :setupdateid)
if %SKU% equ 5 (set "SKU=core;professional;ppipro"&goto :setupdateid)
if %SKU% equ 4 (set "SKU=core;professional"&goto :setupdateid)
if %SKU% equ 3 (set "SKU=core;corecountryspecific;professional"&goto :setupdateid)
if %SKU% equ 2 (set "SKU=corecountryspecific;professional"&goto :setupdateid)
if %SKU% equ 1 (set "SKU=core;corecountryspecific"&goto :setupdateid)
if %SKU% lss 1 goto :unsupportedition
if %SKU% equ b goto :first
if %SKU% equ B goto :first
if %SKU% equ a goto :chooseedition
if %SKU% equ A goto :chooseedition

:: 不支持版本警告
:unsupportedition
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
if %choosemenu% equ 2 goto :chooseeditiongroup
if %choosemenu% equ 1 goto :chooseedition

::  不支持语言版本警告
:unsupportlang
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
if %choosemenu% equ 1 (color f0 & goto :chooselang)

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
echo.
echo  1 - 19042.538 ^(20H2_release %TeamBranch%^)
echo.
echo  2 - 19042.545 ^(20H2_release %TeamBranch%^)
echo.
echo  3 - 19042.572 ^(20H2_release %TeamBranch%^)
echo.
echo %TeamDevDes%
echo.
echo  4 - 19100.1008 ^(vb_release_svc_team_flight^)
echo.
echo  5 - 19100.1019 ^(vb_release_svc_team_flight^)
echo.
echo %TeamSVC%
echo.
echo  E - 19100.1009 ^(vb_release_svc_team_flight^)
echo.
echo.
echo.
echo.
echo.
echo %StepDescription%
echo %line%
set /p Team=%TxtDes1%
if %Team% equ E (set id=87364f44-95b4-4bf0-917e-5b28f266610d&goto :uupdownload)
if %Team% equ 5 (set id=40a6c352-b0f4-49a6-a0c3-3dc1537e1d3f&goto :uupdownload)
if %Team% equ 4 (set id=1503c1dc-82c3-4ebd-8299-afd449411884&goto :uupdownload)
if %Team% equ 3 (set id=ac417a02-f061-4f49-884d-9f427e1edfed&goto :uupdownload)
if %Team% equ 2 (set id=8b2d3ddf-f617-4df4-a1da-15dcbf0e757c&goto :uupdownload)
if %Team% equ 1 (set id=bbcdbf02-fd0f-497f-9d01-956bec5f9c13&goto :uupdownload)
if %Team% equ b goto :first
if %Team% equ B goto :first
if %Team% equ a goto :chooseedition
if %Team% equ A goto :chooseedition

:uupdownload
cls
title %title% %Ver1% - %Purpose% - %SearchUpdScript%

cd /d "%~dp0"
if NOT EXIST %aria2% set error=1&goto :ERROR

echo %line%
echo %UPDScript%
echo %line%
"%aria2%" --no-conf %cert%--log-level=info --log="aria2_download.log" -o"%aria2Script%" --allow-overwrite=true --auto-file-renaming=false "https://uupdump.net/get.php?id=%id%&pack=%Lang%&edition=%SKU%&aria2=2"
if %ERRORLEVEL% GTR 0 set error=2&call :ERROR & exit /b 1

for /F "tokens=2 delims=:" %%i in ('findstr #UUPDUMP_ERROR: "%aria2Script%"') do set DETECTED_ERROR=%%i
if NOT [%DETECTED_ERROR%] == [] (set error=3&call :ERROR)

cls
title %title% %Ver1% - %Purpose% - %DLUUPFiles%

echo %line%
echo %DLFiles%
echo %line%
"%aria2%" --no-conf --log-level=info --log="aria2_download.log" -x16 -s16 -j5 -c -R -d"%destDir%" -i"%aria2Script%"
if %ERRORLEVEL% GTR 0 set error=2&call :ERROR & exit /b 1

pause


:ERROR
cls
title %title% %Ver1% - %Purpose% - %FoundError%
color f4
echo %line%
echo %ErrorTitle%
echo %line%
echo.
echo.
if %error% equ 1 call :aria_error
if %error% equ 2 call :download_error
if %error% equ 3 call :uup_error
echo.
echo.
echo %line%
pause



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
echo  %FileExample%files
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
echo  %ErrorTxt6%
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
exit