#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <SQLite.au3>

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



Global Enum _
  $EAppsVPNPowerCA    = 0 , _
  $EAppsLotus         = 1 , _
  $EAppsTreeLinePass  = 2 , _
  $EAppsNone          = 3 , _
  $EAppsEnumSize      = 4 , _
  $EAppsDefault       = 0

Global Enum _
  $EContentDataPwd        = 0 , _
  $EContentDataEnumSize   = 1 , _
  $EContentDataDefault    = 0

Global Enum _
  $EAppsSeqLogin      = 0 , _
  $EAppsSeqDetect     = 1 , _
  $EAppsSeqPath       = 2 , _
  $EAppsSeqQuit       = 3 , _
  $EAppsSeqEnumSize   = 4 , _
  $EAppsSeqDefault    = 1

Global Enum _
  $Etitle             = 0 , _
  $EText              = 1 , _
  $EClassNN           = 2 , _
  $ESizeEnum          = 3 , _
  $EDefault           = 0

Global Enum _
  $EReturnOK          = 0 , _
  $EReturnFail        = 1 , _
  $EReturnEnumSize    = 2 , _
  $EReturnDefault     = 3


Global $ProcessListApps[$EAppsEnumSize][$EAppsSeqEnumSize] = _
[ _
  [ False, True,  False, False  ] , _
  [ False, True,  False, False  ] , _
  [ False, False, False, False  ] _
]


Global $ArrayDataHeader[$EAppsEnumSize][$EAppsSeqEnumSize][$EContentDataEnumSize] = _
[ _
    [ _
      [ "" ] , _;<--- login Password to be inserted here , Associated to $EAppsVPNPowerCA
      [ "" ] _
    ] , _
    [ _
      [ "" ] , _ ;<--- login Password to be inserted here , Associated to $EAppsLotus
      [ ""  ] _
    ]  , _
    [ _
      [ "" ] , _ ;<--- login Password to be inserted here , Associated to $EAppsTreeLinePass
      [ ""  ] _
    ]  _
  ]


Global $ArrayInfo[$EAppsEnumSize][$EAppsSeqEnumSize][$ESizeEnum]= _
[ _
    [ _
      [ "Check Point VPN-1 SecureClient Connection", "U&se Dial-up:" , "Edit2" ] , _
      [ "Mail - Inbox - IBM Lotus Notes", "Search All Mail", "" ] _
    ] , _
    [ _
      [  "Lotus Notes", "&User name:" , "IRIS.password1" ] , _
      [ "Check Point VPN-1 SecureClient Connection", "U&se Dial-up:", ""  ] _
    ]  , _
    [ _
      [  "Encrypted File Password", "" , "QWidget" ] , _
      [ "- TreeLine", "", "QWidget"  ] _
    ]  _
  ]



Global $ArraySeqApps[2]=[ "MainGui" , "GuiEventSequence" ]

Global Enum $EGuiRootNode             = 0, _
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

Global $ArrayGuiInterface[ $EGuiEnumSize ]
