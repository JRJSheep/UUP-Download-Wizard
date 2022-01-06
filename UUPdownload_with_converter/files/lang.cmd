@echo off

if "%1"=="-en" goto :english
if "%1"=="-cn" goto :chinesesimplified
if "%1"=="-LVer" goto :langver
color 0c
echo 出现错误：此文件为羊牌 UUP 下载向导的专用语言文件。
pause>nul
exit /b

:langver
set "LVer1=2.5"
set "LVer2=Build 440"
exit /b

:english
set "langconverter=EN-US"
set "langchoose=Choose Wizard Language"
set "langwelcome=Welcome, Choose your language"
set "lang1=English"
set "lang2=Chinese Simplified"
set "dlangtxt=Choose your language and Press Enter to Continue: "
set "LangVer2= ^,"

set "line===================================================================================================================="
set "line2=-------------------------------------------------------------------------------------------------------------------"
set "title=JRJSheep UUP Download Wizard"
set "PurposeA=Download Only"
set "PurposeB=Download and convert to ISO"
set "SelectPlat=Choose OS Platform Type"
set "SelectClientLang=Select Client Language"
set "SelectServerLang=Select Server Language"
set "SelectSKU=Select the SKU Edition"
set "SelectSKUGroup=Select the SKU Editions Group"
set "UnsupportedSKU=Unsupported SKU Edition"
set "UnsupportedLang=Unsupported Language"
set "WriteBuildID=Fill in the update ID of the downloaded version"
set "SelectTeamID=Choose the Team Edition update ID"
set "SearchUpdScript=Retrieving updated script"
set "DLUUPFiles=Download the UUP files"
set "FoundError=ERROR"
set "ConvertCmd=Preparing Convert Tools"
set "PathSpace1=Current directory contains spaces in its path."
set "PathSpace2=Please move or rename the directory to one not containing spaces."
set "Admin=This script needs to be executed as an administrator."
set "EditionApplicableDesA=This edition is "
set "EditionApplicableDesB=, only downloading, not create ISO files."
set "EditionApplicableDesC=, when after downloading, it will be created ISO file^(s^) automatically."

set "WelcomeTitle=               Welcome to download UUP files, please choose network preset for UUP download first"
set "WelDes=The settings on this page are used to control whether to enable revocation server detection. Selecting Default & echo Setting will enable revocation server detection; Select Alternate Setting will disable revocation server detection."
set "Def=Default Setting"
set "Alter=Alternate Setting"
set "WizInfo=About The Wizard tool: "
set "WizVer=Version"
set "Build=Build"
set "LangVer=Wizard Language File Version: "

set "CopyRight=JRJSheep Script Localization. All Rights Reserved."
set "VerDes=The development of this tool is inseparable from the support of uupdump ^(whatever127^) and aboddi1406 scripts."

set "TxtDes1=Enter your option number and press "Enter": "
set "StepDescription=                             B - Back to Last Page ^| H - Back to Homepage"

set "PlatTitle=                             Select the edition type you want to download"
set "PlatDescription=This page requires you to select the type of edition you want to download. If you want to download an edition such&echo as Home, Professional, etc., please select "Client Editions"; if you want to download a server edition such as &echo Azure Stack HCI, please select "Server Editions"."
set "ClientType=Client Editions"
set "ServerType=Server Editions"

set "LangServerTitle=                           Select the language used by UUP OS Build"
set "LangServerDes=This page selects the language editions of the Server operating system you are using. Valid range: Azure Stack HCI,&echo Datacenter and Core, Standard and Core. Only supports version 21H2, Build 20348 and above."
set "LangServerMenu01=         01 - Polish        [Poland]"
set "LangServerMenu02=         02 - Korean         [Korea]"
set "LangServerMenu03=         03 - German       [Germany]"
set "LangServerMenu04=         04 - Russian       [Russia]"
set "LangServerMenu05=         05 - French        [France]"
set "LangServerMenu06=         06 - Dutch    [Netherlands]"
set "LangServerMenu07=         07 - Czech [Czech Republic]"
set "LangServerMenu08=         08 - Portuguese    [Brazil]"
set "LangServerMenu09=         09 - Portuguese  [Portugal]"
set "LangServerMenu10=         10 - Japanese       [Japan]"
set "LangServerMenu11=         11 - Swedish       [Sweden]"
set "LangServerMenu12=         12 - Turkish       [Turkey]"
set "LangServerMenu13=         13 - Spanish        [Spain]"
set "LangServerMenu14=         14 - Hungarian   [Hungaria]"
set "LangServerMenu15=         15 - Italian        [Italy]"
set "LangServerMenu16=         16 - English[United States]"
set "LangServerMenu17=         17 - Chinese   [Simplified]"
set "LangServerMenu18=         18 - Chinese  [Traditional]"

set "LangTitle=                                 Select the language used by UUP OS Build"
set "LangDes=Choose the language version of your operating system on this page. Valid range: Core, CoreN, CoreCountrySpecific, &echo Professional, Team. This program only supports Team Edition, version 2004 and above.  &echo."
set "ListLang=Available Languages List: "
set "LangMenu01=               01 - Arabic [Saudi Arabia]             ^|             20 - Portuguese    [Portugal]"
set "LangMenu02=               02 - Estonian    [Estonia]             ^|             21 - Japanese         [Japan]"
set "LangMenu03=               03 - Bulgarian  [Bulgaria]             ^|             22 - Swedish         [Sweden]"
set "LangMenu04=               04 - Polish       [Poland]             ^|             23 - Serbian-Latin   [Serbia]"
set "LangMenu05=               05 - Korean        [Korea]             ^|             24 - Slovak          [Slovak]"
set "LangMenu06=               06 - Danish      [Denmark]             ^|             25 - Slovenian     [Slovenia]"
set "LangMenu07=               07 - German      [Germany]             ^|             26 - Thai          [Thailand]"
set "LangMenu08=               08 - Russian      [Russia]             ^|             27 - Turkish         [Turkey]"
set "LangMenu09=               09 - Finnish     [Finland]             ^|             28 - Ukrainian       [Ukrain]"
set "LangMenu10=               10 - French       [France]             ^|             29 - Spanish         [Mexico]"
set "LangMenu11=               11 - French       [Canada]             ^|             30 - Spanish          [Spain]"
set "LangMenu12=               12 - Dutch   [Netherlands]             ^|             31 - Greek           [Greece]"
set "LangMenu13=               13 - Czech[Czech Republic]             ^|             32 - Hebrew          [Israel]"
set "LangMenu14=               14 - Croatian    [Croatia]             ^|             33 - Hungarian     [Hungaria]"
set "LangMenu15=               15 - Latvian      [Latvia]             ^|             34 - English  [United States]"
set "LangMenu16=               16 - Lithuanian[Lithuania]             ^|             35 - English [United Kingdom]"
set "LangMenu17=               17 - Romanian    [Romania]             ^|             36 - Italian          [Italy]"
set "LangMenu18=               18 - Norwegian    [Bokmal]             ^|             37 - Chinese     [Simplified]"
set "LangMenu19=               19 - Portuguese   [Brazil]             ^|             38 - Chinese    [Traditional]"

set "BuildTitle=                             Select the Build which you want to download via UUP"
set "BuildDes=This page selects a certain SKU version downloaded via UUP. For Team Edition (Build 19041.350 and above), it will & echo automatically go to the corresponding menu to select the version after selection; if you want to download the & echo combined editions of the UUP files, please select Download combined editions. & echo Note: Professional Edition is the basic version of other editions such as Professional Workstation Edition, & echo Enterprise Edition, etc. The same applies to N Edition."
set "AnyBuild=The following editions can be used in any country and region: "
set "CHBuild=The following editions can be used in China: "
set "EUBuild=The following editions can be used in Europe: "
set "COMBD=If you want to download multiple editions, you can use this option: "
set "COBuild=Core"
set "CCSBuild=Core Country Specific"
set "CONBuild=Core N"
set "ProBuild=Pro"
set "ProNBuild=Pro N"
set "TeamBuild=Team ^(Build 19041.350 and later, Build 19100 and below^)"
set "TeamDev=Team ^(Dev Channel, Build 19100 and later^)"
set "CombBuild=Download combined editions"
set "ServerDes=This page selects a certain Server SKU edition downloaded through UUP. If you want to download the combined edition & echo of the Server UUP file, please select "Download combined editions". The minimum version available on this page is& echo Build 20348 and its updates."

set "EditionTitle=                           Select a combination SKU which you want to download via UUP"
set "EditionDes=The content of this page is to select the combined SKU version downloaded through UUP. After you select one of the & echo After you select and press "Enter" to confirm, the download will start immediately. combined UUP versions and press "Enter" to confirm, the download will start immediately.& echo Note: The following combination UUP version options are not suitable for all languages."
set "ServerEditionDes=The content of this page is to select the combined Server SKU Editions to be downloaded through UUP. After you & echo select one of the combined UUP editions and press "Enter" to confirm, the download will start immediately. The & echo minimum Build required for this page is Build 20348 and above."
set "editiongroup1=The following combined editions are available in the region use Chinese: "
set "editiongroup2=The following combined editions are available in the region use anyone language: "
set "editiongroup3=The following combined editions have N editions, which are only available in European languages and English, other languages are invalid: "
set "editiongroup4=The following combined editions have no desktop experience:"
set "editiongroup5=The following combined editions are the full version:"
set "editiongroup6=The following combined editions are mixed editions:"
set "editiongroup7=The following combined editions are all collections, but excluding Azure Stack HCI:"
set "CCCS=Core and Core Country Specific"
set "CCSP=Core Country Specific and Pro"
set "CCCSP=Core, Core Country Specific and Pro"
set "CAPR=Core and Pro"
set "CPT=Core, Pro and Team"
set "CCNPPN=Core, Core N, Pro, Pro N"
set "CCNPPNT=Core, Core N, Pro, Pro N and Team"
set "core=, Core"
set "ServerSCDC=Windows Server Standard Core and Datacenter Core"
set "ServerSD=Windows Server Standard and Datacenter"
set "ServerSCS=Windows Server Standard Core and Standard"
set "ServerDCD=Windows Server Datacenter Core and Datacenter"
set "ServerSCSDCD=Windows Server Standard Core, Standard, Datacenter Core and Datacenter"

set "WarTitle=                                               W A R N I N G"
set "Wartxt=The single Edition or Combined Edition number you entered is invalid. It does not refer to any single Edition or & echo combined Edition provided, please select again."
set "SingleEdt=Return to Select Single Edition Menu"
set "CombEdt=Return to Select combined Edition Menu"
set "Exit=Exit the Wizard Script"
set "ContExit=Please enter your option and press "Enter" to return, or just press "Enter" to exit: "
set "CodError=The language code you entered is invalid. It does not refer to any language version provided in the menu, & echo  re-select in the language menu."

set "BackLangMenu=Return to Select language Version Menu"

set "FillIDTitle=                        Fill in the update ID of the Build you want to download"
set "FillIDDes=Fill in the update ID of the Build to be downloaded on this page. Paste input is supported.& echo Note: The update ID corresponding to each Build and each architecture edition is different. Therefore, you neither & echo need to specifically set which architecture edition to download, nor paste the corresponding update name."
set "IDExample=Update ID Example: "
set "FillID=Fill in the Update ID: "

set "TeamTitle=               Team Edition, Version 2004 and above - Update ID^(s^) Selection"
set "TeamDes=This page can select UUP files of Team. Team not a General Edition, You don't need fill an Update &echo ID, just select a Build from the menu to start downloading. Some Builds on this page may be &echo deleted or added in future Updates at anytime."
set "TeamDevDes=The following Builds are Team, Version Dev, All Builds Branch are both vb_release_svc_team_flight. &echo Some Builds may not provide Chinese versions, Please see Readme:"
set "TeamBranch=and related branches"
set "TeamSVC=The following Update ID(s) are standby update ID(s) of Some Builds:"

set "UPDScript=Retrieving updated aria2 script..."
set "DLFiles=Attempting to download files..."

set "ErrorTitle=                                                 E R R O R"
set "ErrorTxt1=We could not find"
set "ErrorTxt11= in the current directory. Therefore, the download cannot continue."
set "DLAria=You can download aria2 from ^(It will be start in your browser^): "
set "ErrorTxt2=After downloading, Extract the files in the aria2 compressed package to the following path to download normally:"
set "FileExample=Current folder：%~dp0"
set "ErrorTxt3=Sorry, an error occurred while downloading the file."
set "ErrorTxt4=If you want to continue to fill in the files that have not been downloaded, please run this script again after exiting."
set "ErrorTxt5=Unable to retrieve data from Windows Update servers. Reason: "
set "ErrorTxt6=If this problem persists, most likely the set you are attempting to download was removed from Windows Update servers."
set "ErrorTxt7=It is recommended that you change to a valid update ID."
set "ErrorTxt8=We couldn't find one of needed files for this script."
set "ErrorTxt9=If you want to add missing files, you can do it again after adding files."
exit /b

:chinesesimplified
set "langconverter=ZH-CN"
set "langchoose=请选择向导语言"
set "langwelcome=欢迎使用，请选择你的语言"
set "lang=英    语"
set "lang2=简体中文"
set "dlangtxt=请选择你语言，并按 Enter 键继续："
set "LangVer2=，"

set "line============================================================================================"
set "line2=-------------------------------------------------------------------------------------------"
set "title=羊牌 UUP 下载向导"
set "PurposeA=单一下载"
set "PurposeB=下载并转制为 ISO"
set "SelectPlat=选择操作系统平台类型"
set "SelectClientLang=选择客户端语言"
set "SelectServerLang=选择服务器端语言"
set "SelectSKU=选择 SKU 版本"
set "SelectSKUGroup=选择 SKU 版本组合"
set "UnsupportedSKU=不支持的 SKU 版本"
set "UnsupportedLang=不支持的语言"
set "WriteBuildID=填写下载版本的更新 ID"
set "SelectTeamID=选择协同版更新 ID"
set "SearchUpdScript=检索更新脚本"
set "DLUUPFiles=下载 UUP 文件"
set "FoundError=出现错误"
set "ConvertCmd=准备转换工具"
set "PathSpace1=当前目录的路径中含有空格。"
set "PathSpace2=请将此目录移动到或重命名为不含空格的目录。"
set "Admin=此脚本需要以管理器权限执行。"
set "EditionApplicableDesA=此版本为"
set "EditionApplicableDesB=版本，仅用于下载，不可创建 ISO 文件。"
set "EditionApplicableDesC=版本，在下载后，将会自动创建 ISO 文件。"

set "WelcomeTitle=                     欢迎下载 UUP 文件，请选择 UUP 下载网络预先设置"
set "WelDes=此页设置用于控制是否启用吊销服务器检测。选择默认设置将会启用吊销服务器检测；选择备用设置 & echo 将会禁用吊销服务器检测。如果你在下载 UUP 文件时遇到吊销服务器检测问题，则可使用选项 B，你 & echo 也可以将选项 B 作为保险选项使用。"
set "Def=默认设置"
set "Alter=备用设置"
set "WizInfo=关于此向导工具："
set "WizVer=版本"
set "Build=内部版本"
set "LangVer=向导语言文件版本："
set "CopyRight=正义羊脚本汉化。保留所有权利。"
set "VerDes=此工具的开发离不开 uupdump ^(whatever127^) 和 aboddi1406 脚本的支持。"

set "TxtDes1=请输入你的选项代码并按“Enter”键："
set "StepDescription=                           A - 返回到上一页 ^| B - 返回到首页"

set "PlatTitle=                                请选择你要下载的版本类型"
set "PlatDescription=此页要求你选择你要下载版本的类型。如果你要下载的是如家庭版、专业版等的版本，请选择“客户&echo 端”；如果你要下载的是如 Azure Stack HCI 这样的服务器版本，请选择“服务器端”。"
set "ClientType=客户端"
set "ServerType=服务器端"

set "LangServerTitle=                                请选择 UUP 版本使用的语言"
set "LangServerDes=此页选择你使用的 Server 操作系统语言版本。有效范围：Azure Stack HCI、Datacenter 及其 Core、&echo Standard 及其 Core。仅支持版本 21H2，Build 20348 及以上版本。"
set "LangServerMenu01=         01 - 波兰语         [波兰]"
set "LangServerMenu02=         02 - 朝鲜语         [韩国]"
set "LangServerMenu03=         03 - 德语           [德国]"
set "LangServerMenu04=         04 - 俄语         [俄罗斯]"
set "LangServerMenu05=         05 - 法语           [法国]"
set "LangServerMenu06=         06 - 荷兰语         [荷兰]"
set "LangServerMenu07=         07 - 捷克语   [捷克共和国]"
set "LangServerMenu08=         08 - 葡萄牙语       [巴西]"
set "LangServerMenu09=         09 - 葡萄牙语     [葡萄牙]"
set "LangServerMenu10=         10 - 日语           [日本]"
set "LangServerMenu11=         11 - 瑞典语         [瑞典]"
set "LangServerMenu12=         12 - 土耳其语     [土耳其]"
set "LangServerMenu13=         13 - 西班牙语     [西班牙]"
set "LangServerMenu14=         14 - 匈牙利语     [匈牙利]"
set "LangServerMenu15=         15 - 意大利语     [意大利]"
set "LangServerMenu16=         16 - 英语           [美国]"
set "LangServerMenu17=         17 - 中文           [简体]"
set "LangServerMenu18=         18 - 中文           [繁体]"

set "LangTitle=                                请选择 UUP 版本使用的语言"
set "LangDes=此页选择你使用的操作系统语言版本。有效范围：家庭版及其 N 版、专业版及其 N 版、家庭中文版、&echo 协同版。仅支持版本 2004 及以上版本的协同版。&echo."
set "ListLang=可用的语言列表："
set "LangMenu01=         01 - 阿拉伯语 [沙特阿拉伯]          ^|     20 - 葡萄牙语        [葡萄牙]"
set "LangMenu02=         02 - 爱沙尼亚语 [爱沙尼亚]          ^|     21 - 日语              [日本]"
set "LangMenu03=         03 - 保加利亚语 [保加利亚]          ^|     22 - 瑞典语            [瑞典]"
set "LangMenu04=         04 - 波兰语         [波兰]          ^|     23 - 塞尔维亚语    [塞尔维亚]"
set "LangMenu05=         05 - 朝鲜语         [韩国]          ^|     24 - 斯洛伐克语    [斯洛伐克]"
set "LangMenu06=         06 - 丹麦语         [丹麦]          ^|     25 - 斯洛文尼亚语[斯洛文尼亚]"
set "LangMenu07=         07 - 德语           [德国]          ^|     26 - 泰语              [泰国]"
set "LangMenu08=         08 - 俄语         [俄罗斯]          ^|     27 - 土耳其语        [土耳其]"
set "LangMenu09=         09 - 芬兰语         [芬兰]          ^|     28 - 乌克兰语        [乌克兰]"
set "LangMenu10=         10 - 法语           [法国]          ^|     29 - 西班牙语        [墨西哥]"
set "LangMenu11=         11 - 法语         [加拿大]          ^|     30 - 西班牙语        [西班牙]"
set "LangMenu12=         12 - 荷兰语         [荷兰]          ^|     31 - 希腊语            [希腊]"
set "LangMenu13=         13 - 捷克语   [捷克共和国]          ^|     32 - 希伯来语        [以色列]"
set "LangMenu14=         14 - 克罗地亚语 [克罗地亚]          ^|     33 - 匈牙利语        [匈牙利]"
set "LangMenu15=         15 - 拉脱维亚语 [拉脱维亚]          ^|     34 - 英语              [美国]"
set "LangMenu16=         16 - 立陶宛语     [立陶宛]          ^|     35 - 英语              [英国]"
set "LangMenu17=         17 - 罗马尼亚语 [罗马尼亚]          ^|     36 - 意大利语        [意大利]"
set "LangMenu18=         18 - 挪威语         [挪威]          ^|     37 - 中文              [简体]"
set "LangMenu19=         19 - 葡萄牙语       [巴西]          ^|     38 - 中文              [繁体]"

set "BuildTitle=                            请选择你要通过 UUP 下载的内部版本"
set "BuildDes=此页选择通过 UUP 下载的某一 SKU 版本。对于协同版（Build 19041.350 及以上），将会在选择后自动& echo 转到对应菜单进行版本的选择；如果你要下载组合版本的 UUP 文件，请选择“下载组合版本”。& echo 注：“专业版”是专业工作站版、企业版等其他版本的基础版本，N 版同理。"
set "AnyBuild=以下版本可在任何国家和地区使用："
set "CHBuild=以下版本仅在中国地区使用："
set "EUBuild=以下版本可在欧洲地区使用："
set "COMBD=如果你希望下载多个版本，可使用此选项："
set "COBuild=家庭版"
set "CCSBuild=家庭中文版"
set "CONBuild=家庭版 N"
set "ProBuild=专业版"
set "ProNBuild=专业版 N"
set "TeamBuild=协同版 ^(Build 19041.350 及以上，Build 19100 及以下^)"
set "TeamDev=协同版 ^(Dev 渠道，Build 19100 以上版本^)"
set "CombBuild=下载组合版本"
set "ServerDes=此页选择通过 UUP 下载的某一 Server SKU 版本。如果你要下载组合版本的 Server UUP 文件，请选择&echo “下载组合版本”。此页获取的最低版本为 Build 20348 及其更新。"

set "EditionTitle=                                请选择组合 SKU 版本下载"
set "EditionDes=此页内容是选择通过 UUP 下载的组合 SKU 版本。在你选择其中的一种组合 UUP 版本并按“Enter”键& echo 确认后，将会立即开始下载。& echo 注：以下组合 UUP 版本选项并非所有语言都适合。"
set "ServerEditionDes=此页内容是选择要通过 UUP 下载的 Server 组合 SKU 版本。在你选择其中的一种组合 UUP 版本并按“&echo Enter”键确认后，将会立即开始下载。此页所需最低版本为 Build 20348 及以上版本。& echo."
set "editiongroup1=以下组合版本在中文地区可用："
set "editiongroup2=以下组合版本可在任何语言地区可用："
set "editiongroup3=以下组合带有 N 版，仅限欧洲地区的各语言和英语可用，其他语言无效："
set "editiongroup4=以下组合版本无桌面体验："
set "editiongroup5=以下组合版本为完整版本："
set "editiongroup6=以下组合版本为混合版本："
set "editiongroup7=以下组合版本为全部合集，不包括 Azure Stack HCI："
set "CCCS=家庭版和家庭中文版"
set "CCSP=家庭中文版和专业版"
set "CCCSP=家庭版、家庭中文版和专业版"
set "CAPR=家庭版和专业版"
set "CPT=家庭版、专业版和协同版"
set "CCNPPN=家庭版、家庭版 N、专业版、专业版 N"
set "CCNPPNT=家庭版、家庭版 N、专业版、专业版 N 和协同版"
set "core=，Core"
set "ServerSCDC=Windows Server Standard Core 和 Datacenter Core"
set "ServerSD=Windows Server Standard 和 Datacenter"
set "ServerSCS=Windows Server Standard Core 和 Standard"
set "ServerDCD=Windows Server Datacenter Core 和 Datacenter"
set "ServerSCSDCD=Windows Server Standard Core、Standard、Datacenter Core 和 Datacenter"

set "WarTitle=                                         警      告"
set "Wartxt=你所输入的单一版本或组合版本的编号是无效的。其不指代提供的任何单一版本或组合版 & echo  本，请重新进行选择。"
set "SingleEdt=返回到选择单一版本菜单"
set "CombEdt=返回到选择组合版本菜单"
set "Exit=退出向导脚本"
set "ContExit=请输入你的选项代码，并按“Enter”键返回，或直接按“Enter”键退出："
set "CodError=你所输入的语言代码是无效的。其不指代菜单中所提供的任何一个语言版本，请重新在语 & echo  言菜单中进行选择。"

set "BackLangMenu=返回到选择语言版本菜单"

set "FillIDTitle=                             填写你要下载的版本使用的更新 ID"
set "FillIDDes=此页填写要下载版本的更新 ID，支持粘贴输入。& echo 注：每一个内部版本及各体系结构版本对应的更新 ID 是不同的。因此你既不需要专门设置下载何种体& echo 系结构的版本，也不需要粘贴对应的更新名称。"
set "IDExample=更新 ID 示例："
set "FillID=请填写更新 ID："

set "TeamTitle=                         协同版，版本 2004 及以上——更新 ID 选择"
set "TeamDes=此页选择协同版的 UUP 文件下载。协同版非常规版本，你不需要填写更新 ID，仅需从菜单中选择版本 &echo 即可开始下载。此页中的部分版本随时都有可能在后续更新中删除或新增。"
set "TeamDevDes=以下是协同版，版本 Dev，编译分支均为 vb_release_svc_team_flight。某些版本可能未提供中文 &echo 版本，请参阅自述文件："
set "TeamBranch=和相关分支"
set "TeamSVC=以下为部分版本的备用更新 ID："

set "UPDScript=正在检索更新的 aria2 脚本……"
set "DLFiles=正在尝试下载文件……"
set "PrepConverter=正在解压 UUP 转换程序……"

set "ErrorTitle=                                       出 现 错 误"
set "ErrorTxt1=我们无法在当前的目录中找到"
set "ErrorTxt11=。因此下载无法继续。"
set "DLAria=你可以在此处下载 aria2（将自动在浏览器中打开）："
set "ErrorTxt2=下载后，将 aria2 压缩包中的文件解压到以下路径，即可正常进行下载："
set "FileExample=当前文件夹：%~dp0"
set "ErrorTxt3=很抱歉，在下载文件时出现错误。"
set "ErrorTxt4=如果你希望继续补齐未能下载完成的文件，请在退出后再次运行此脚本。"
set "ErrorTxt5=无法从 Windows 更新服务器检索数据。原因："
set "ErrorTxt6=如果此问题仍持续存在，很有可能是你所尝试下载的 UUP 集已从 Windows 更新服务器中删除。"
set "ErrorTxt7=建议你更换一个有效更新 ID。"
set "ErrorTxt8=我们无法找到此脚本所需的文件。"
set "ErrorTxt9=如果你希望补充缺失的文件，可以在补充文件后再次执行。"
exit /b