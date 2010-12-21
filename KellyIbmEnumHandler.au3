#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <SQLite.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <GuiStatusBar.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#cs
  Development property, Patrick Riendeau 1997-2010, under old and new BSD License.

#ce

AutoItSetOption ( "ExpandVarStrings", 1 )
AutoItSetOption ( "GUICloseOnESC"   , 1 )
AutoItSetOption ( "GUIResizeMode"   , 1024 )
AutoItSetOption ( "MouseCoordMode"  , 0 )
AutoItSetOption ( "MustDeclareVars" , 1 )
AutoItSetOption ( "PixelCoordMode"  , 0 )
AutoItSetOption ( "WinWaitDelay"    , 1250 )
AutoItSetOption ( "GUIOnEventMode"  , 1 )



Global Enum _
  $EAppsVPNPowerCA        = 0 , _
  $EAppsLotusIBM          = 1 , _
  $EAppsLotusSametime     = 2 , _
  $EAppsLotusBNC          = 3 , _
  $EAppsDameWareVpnClient = 4 , _
  $EAppsTreeLinePass      = 5 , _
  $EAppsNone              = 6 , _
  $EAppsEnumSize          = 7 , _
  $EAppsDefault           = 0

Global $ArrayFuncTitleList[$EAppsEnumSize] = _
[ _
  "LotusHandlerIBM" , _
  "LotusHandlerBNC" , _
  "LotusHandlerSametime" , _
  "VpnPowerCAHandler" , _
  "TreeLinePassword" ]

Global Enum _
  $EContentDataPwd          = 0 , _
  $EContentDataEnumSize     = 5 , _
  $EContentDataDefault      = 0

Global Enum _
  $EAppsSeqLogin            = 0 , _
  $EAppsSeqDetect           = 1 , _
  $EAppsSeqPath             = 2 , _
  $EAppsSeqQuit             = 3 , _
  $EAppsSeqEnumSize         = 10 , _
  $EAppsSeqDefault          = 1

Global Enum _
  $Etitle                   = 0 , _
  $EText                    = 1 , _
  $EClassNN                 = 2 , _
  $ESizeEnum                = 10 , _
  $EDefault                 = 0

Global Enum _
  $EReturnOK                = 0 , _
  $EReturnFail              = 1 , _
  $EReturnEnumSize          = 10 , _
  $EReturnDefault           = 3

Global Enum _
  $EIfaceHwnd               = 0 , _
  $EIfaceEvent              = 1 , _
  $EIfaceExternalLink       = 2 , _
  $EIfaceTextInfo           = 3 , _
  $EIfaceEventFuncName      = 4 , _
  $EIfaceEnumSize           = 5

Global Enum _
  $EGuiRootNode             = 0, _
  $EGuiParentNode           = 1, _
  $EGuiChildNode            = 2, _
  $EGuiForm1                = 3, _
  $EGuiGroup1               = 4, _
  $EGuiGrpHandlerSrv        = 5, _
  $EGuiLabelLabelDeclServ   = 6, _
  $EGuiHandlerServNameCBBox = 7, _
  $EGuiButtonSend           = 8, _
  $EGuiButtonQuit           = 9, _
  $EGuiButtonHelp           = 10, _
  $EGuiCompanyPic           = 11, _
  $EGuinMsg                 = 12, _
  $EGuiStatusBar1           = 13, _
  $EGuiComboReadChoice      = 14, _
  $EGuiEnumSize             = 15


Global $ProcessListApps[$EAppsEnumSize][$EAppsSeqEnumSize] = _
[ _
  [ False, True,  False, False  ] , _
  [ False, True,  False, False  ] , _
  [ False, True,  False, False  ] , _
  [ False, True,  False, False  ] , _
  [ False, True,  False, False  ] , _
  [ False, False, False, False  ] _
]


Global $ArrayDataHeader[$EAppsEnumSize][$EAppsSeqEnumSize][$EContentDataEnumSize] = _
[ _
    [ _
      [ "yAXuQUbAcReJU27u" ] , _;<--- login Password to be inserted here , Associated to $EAppsVPNPowerCA        = 0 , _
      [ "" ] _
    ] , _
    [ _
      [ "HSYKUS000" ] , _;<--- login Password to be inserted here , Associated to $EAppsLotusIBM            = 1 , _
      [ "" ] _
    ] , _
    [ _
      [ "yAXuQUbAcReJU27u" ] , _ ;<--- login Password to be inserted here , Associated to $EAppsLotusSametime     = 2 , _
      [ ""  ] _
    ]  , _
    [ _
      [ "S15PQ9FCDPSR" ] , _ ;<--- login Password to be inserted here , Associated to $EAppsLotusBNC          = 3 , _
      [ ""  ] _
    ]  , _
    [ _
      [ "CnTM!r0)o32*" ] , _ ;<--- login Password to be inserted here , Associated to $EAppsDameWareVpnClient = 4 , _
      [ ""  ] _
    ]  , _
    [ _
      [ "" ] , _ ;<--- login Password to be inserted here , Associated to $EAppsDameWareVpnClient = 4 , _
      [ ""  ] _
    ]  _
  ]


Global $ArrayInfo[$EAppsEnumSize][$EAppsSeqEnumSize][$ESizeEnum]= _
[ _
    [ _
      [ "Check Point VPN-1 SecureClient Connection", "U&se Dial-up:" , "Edit2" ] , _
      [ "", "", "" ] _
    ] , _
    [ _
      [  "Lotus Notes", "&User name:" , "IRIS.password1" ] , _
      [ "", "", ""  ] _
    ]  , _
    [ _
      [  "Log In to Sametime", "&Host server:" , "Edit3" ] , _
      [ "", "", ""  ] _
    ]  , _
    [ _
      [  "Lotus Notes - \\Remote", "" , "Transparent Windows Client" ] , _
      [ "", "", ""  ] _
    ]  , _
    [ _
      [  "Encrypted File Password", "" , "QWidget" ] , _
      [ "", "", ""  ] _
    ]  _
  ]



Global $ArraySeqApps[2]=[ "MainGui" , "GuiEventSequence" ]



Global $ArrayGuiInterface[$EIfaceEnumSize][ $EGuiEnumSize ]

$ArrayGuiInterface[$EGuiButtonSend][$EIfaceEventFuncName] = "GuiButtonSend"
$ArrayGuiInterface[$EGuiButtonQuit][$EIfaceEventFuncName] = "GuiButtonQuit"
$ArrayGuiInterface[$EGuiButtonHelp][$EIfaceEventFuncName] = "GuiButtonHelp"

$ArrayGuiInterface[$EGuiCompanyPic][$EIfaceEventFuncName] = "GuiPicOpenIEPage"
$ArrayGuiInterface[$EGuiCompanyPic][$EIfaceExternalLink] = "http://www.mykelly.ca/eprise/main/web/ca/mykelly/fr/index.html?division=kit"
