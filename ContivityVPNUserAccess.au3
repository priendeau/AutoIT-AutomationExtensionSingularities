#Region ### START Koda GUI section ### Form=e:\document\api\autoit\usercontivityinputinformation.kxf
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
#Include <Array.au3>


AutoItSetOption ( "ExpandVarStrings", 1 )
AutoItSetOption ( "GUICloseOnESC"   , 1 )
AutoItSetOption ( "GUIResizeMode"   , 1024 )
AutoItSetOption ( "MouseCoordMode"  , 0 )
AutoItSetOption ( "MustDeclareVars" , 1 )
AutoItSetOption ( "PixelCoordMode"  , 0 )
AutoItSetOption ( "WinWaitDelay"    , 1250 )
AutoItSetOption ( "GUIOnEventMode"  , 1 )

Global Enum _
    $VPNContivityInput = 0, _
    $GuiListUserModel = 1, _
    $Label1 = 2, _
    $Group1 = 3, _
    $GuiVpnAccessVerif = 4, _
    $Input1 = 5, _
    $StatusBar1 = 6, _
    $EFormClose = 7 , _
    $EFormMinimize =  8, _
    $EFormMaximize = 9 , _
    $EFormRestore = 10 , _
    $ENotHandled = 11 , _
    $EnumVpnFormWxnameEnumSize = 12

Global $ArrayEVpnInputForm[ $EnumVpnFormWxnameEnumSize ]

Global $ArrayEVpnInputSig[$EnumVpnFormWxnameEnumSize]

Global $ArrayUserTypeVpnUserAccess[2]=[ "PC_Name\r00t", "PC_Name\S00001" ]

Global Enum _
  $ESetEventGuiSet      = 0 , _
  $ESetEventCtrlGui     = 1 , _
  $ESetEventDefault     = 0 , _
  $ESetEventEnumSize    = 2


Global Enum _
  $ETypeSetOnEventName      = 0 , _
  $ETypeSetOnEventCtrlType  = 1 , _
  $ETypeSetOnEventGuiEnum   = 2 , _
  $ETypeSetOnEventFuncname  = 3 , _
  $ETypeSetOnEventReqArray  = 4 , _
  $ETypeSetOnEventEnumSize  = 5

Global $ArraySigSetOnEv[$EnumVpnFormWxnameEnumSize][$ETypeSetOnEventEnumSize]=[ _
  [ $ENotHandled        , $ESetEventCtrlGui , $VPNContivityInput,   "" , False ] , _
  [ $GuiListUserModel   , $ESetEventCtrlGui , $GuiListUserModel,    "GuiListUserModelClick" ,True ] , _
  [ $Label1             , $ESetEventCtrlGui , $Label1,              "Label1Click" ,True ] , _
  [ $ENotHandled        , $ESetEventCtrlGui , $Group1,              "" ,False ] , _
  [ $GuiVpnAccessVerif  , $ESetEventCtrlGui , $GuiVpnAccessVerif,   "GuiVpnAccessVerifClick" ,True ] , _
  [ $Input1             , $ESetEventCtrlGui , $Input1,              "" , True ] , _
  [ $ENotHandled        , $ESetEventCtrlGui , $StatusBar1 ,         "" , False ] , _
  [ $EFormClose         , $ESetEventGuiSet  , $GUI_EVENT_CLOSE,     "VPNContivityInputClose" , False  ] , _
  [ $EFormMinimize      , $ESetEventGuiSet  , $GUI_EVENT_MINIMIZE,  "VPNContivityInputMinimize" , False ] , _
  [ $EFormMaximize      , $ESetEventGuiSet  , $GUI_EVENT_MAXIMIZE,  "VPNContivityInputMaximize" , False ] , _
  [ $EFormRestore       , $ESetEventGuiSet  , $GUI_EVENT_RESTORE,   "VPNContivityInputRestore" , False  ] ]


#cs
  All Information in the function CreateAssociationEventFuncName, will depend
  from Array $ArraySigSetOnEv, has long configuration within this Array will not implies
  uses of first parameter has Array, most of the times, $DefaultArrayHandler
#ce
Func CreateAssociationEventFuncName( $DefaultArrayHandler = $ArrayEVpnInputForm, _
                                     $ChoiceLower=$ESetEventCtrlGui, _
                                     $ChoiceHigher=$ESetEventGuiSet )
  Local $TEName, $TECtrlType, $TEKeyName, $StrFuncName, $BoolDependArray
  #cs
    Extracting All Item sequentially aligned by $ETypeSetOnEventEnumSize inside $ArraySigSetOnEv.
  #ce
  For $IntXByWxItem = 0 To $EnumVpnFormWxnameEnumSize-1
    #cs
      Query First Item from $ArraySigSetOnEv
    #ce
    $TEName           = $ArraySigSetOnEv[ $IntXByWxItem ][ $ETypeSetOnEventName ]
    $TECtrlType       = $ArraySigSetOnEv[ $IntXByWxItem ][ $ETypeSetOnEventCtrlType ]
    $StrFuncName      = $ArraySigSetOnEv[ $IntXByWxItem ][ $ETypeSetOnEventFuncname ]
    $BoolDependArray  = $ArraySigSetOnEv[ $IntXByWxItem ][ $ETypeSetOnEventReqArray ]

    ; $StrFuncName depend of Array Dependant conf from $BoolDependArray, which can query diretly information from
    ; ArrayDefault ->
    If $TEName <> $ENotHandled Then
      If $BoolDependArray == True Then
        $TEKeyName=$ArraySigSetOnEv[ $EName ]
      Else
        $TEKeyName = $DefaultArrayHandler[ $IntXByWxItem ][ $ETypeSetOnEventGuiEnum ]
      EndIf

      If $TECtrlType == $ChoiceLower Then
        GUICtrlSetOnEvent( $TEKeyName , $StrFuncName )
      EndIf
      If $TECtrlType == $ChoiceHigher Then
        GUISetOnEvent( $TEKeyName, $StrFuncName )
      EndIf
    EndIf
  Next

EndFunc

Func VpnInputForm()

  Local $StreamUserInfo = _ArrayToString( $ArrayUserTypeVpnUserAccess, "|" )
  Local $AInformationValidation[2] = [ "", False ]
  $ArrayEVpnInputForm[$VPNContivityInput] = GUICreate( "VPN Contivity Client SendStream", 321, 170, 696, 276)
  $ArrayEVpnInputForm[$GuiListUserModel] = GUICtrlCreateList( "", 18, 52, 121, 70)
  $ArrayEVpnInputForm[$Label1] = GUICtrlCreateLabel( "Client User Pattern", 22, 28, 114, 20)
  GUICtrlSetData( $ArrayEVpnInputForm[$GuiListUserModel], $StreamUserInfo )
  $ArrayEVpnInputForm[$Group1] = GUICtrlCreateGroup( "Connection Sequence", 11, 6, 249, 129)
  $ArrayEVpnInputForm[$GuiVpnAccessVerif] = GUICtrlCreateButton( "&Ok", 152, 92, 75, 25, $WS_GROUP)
  CreateAssociationEventFuncName( )
  #cs
    Form fEED Comment, Cut-Here...
    |||
    ||| GUISetOnEvent( $GUI_EVENT_CLOSE,    "VPNContivityInputClose" )
    ||| GUISetOnEvent( $GUI_EVENT_MINIMIZE, "VPNContivityInputMinimize" )
||  ||| G||SetOnEvent( $GUI_EVENT_MAXIMIZE, "VPNContivityInputMaximize" )
 || ||| ||iSetOnEvent( $GUI_EVENT_RESTORE,  "VPNContivityInputRestore" )
   |||| GUICtrlSetOnEvent( $ArrayEVpnInputForm[$GuiListUserModel], "GuiListUserModelClick" )
        GUICtrlSetOnEvent( $ArrayEVpnInputForm[$Label1], "Label1Click" )
    ||| GUICtrlSetOnEvent( $ArrayEVpnInputForm[$GuiVpnAccessVerif], "GuiVpnAccessVerifClick" )
    ||| GUICtrlSetOnEvent( $ArrayEVpnInputForm[$Input1], "Input1Change" )
    |||
||  |||  ||
 || ||| ||  Will Increase by the Time with numerous Amount of GUICtrlSetOnEvent and GUISetOnEvent
   |||||    So I made field Identified Array with Enum-Name Property to be labelled between
            GUICtrlSetOnEvent and GUISetOnEvent

    |||
    |||
  #ce
  GUICtrlCreateGroup("", -99, -99, 1, 1 )
  $ArrayEVpnInputForm[$Input1] = GUICtrlCreateInput("PCSerialNum", 16, 23, 112, 24 )
  $ArrayEVpnInputForm[$StatusBar1] = _GUICtrlStatusBar_Create( $ArrayEVpnInputForm[$VPNContivityInput] )
  GUISetState(@SW_SHOW)
  #EndRegion ### END Koda GUI section ###

  While $AInformationValidation[1] <> False
    If $AInformationValidation[0] <> "" Then
      $AInformationValidation[1]=True
    EndIf
    Sleep(100)

  WEnd

Func GuiListUserModelClick()

EndFunc

Func GuiVpnAccessVerifClick()

EndFunc

Func Input1Change()

EndFunc

Func Label1Click()

EndFunc

Func VPNContivityInputClose()

EndFunc

Func VPNContivityInputMaximize()

EndFunc

Func VPNContivityInputMinimize()

EndFunc

Func VPNContivityInputRestore()

EndFunc
