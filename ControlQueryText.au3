#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_outfile=C:\Documents and Settings\Administrator\Desktop\ControlQueryText.exe
#AutoIt3Wrapper_Res_Comment=version 0.1.0.0-rewomeci
#AutoIt3Wrapper_Res_Description=Automation Stream to Query Information and Send Text to any type of Interface. Including Citrix Appliance designed conf.
#AutoIt3Wrapper_Res_Fileversion=0.1.0.0
#AutoIt3Wrapper_Res_Language=3084
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <ButtonConstants.au3>
#include <SQLite.au3>
#include <GUIListBox.au3>
#Include <Array.au3>

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


#Region ### START Koda GUI section ### Form=E:\document\API\AutoIT\Form1.kxf

Global Enum _
  $EHwnd              = 0 , _
  $EQueryGet          = 1 , _
  $EQuerySet          = 2 , _
  $EQueryStorage      = 3 , _
  $EQueryStorageIndex = 4 , _
  $EEnumSize          = 5

Global Enum _
  $EnumCheckBoxFocusForced  = 1 , _
  $EnumCheckBoxFocusFree    = 4 , _
  $EnumCheckBoxNoAutoItLink = 4 , _
  $EnumCheckBoxAutoItLink   = 1

Global Enum _
  $EHITitleName             = 0 , _
  $EHITextContent           = 1 , _
  $EHICtrlID                = 2 , _
  $EHISendInformation       = 3 , _
  $EHICtrlCommand           = 4 , _
  $EHICtrlCmdAct            = 5 , _
  $EHICheckBoxReturn        = 6 , _
  $EHICheckBoxAutoITReport  = 7 , _
  $EHIEnumSize              = 8

Global Enum _
  $Form1                      = 0  , _
  $GroupBox1                  = 1  , _
  $Group1                     = 2  , _
  $Label1                     = 3  , _
  $Label2                     = 4  , _
  $Label3                     = 5  , _
  $Label4                     = 6  , _
  $Label5                     = 7  , _
  $GuiCtrlListTitle           = 8  , _
  $GuiCtrlListText            = 9  , _
  $GuiCtrlEditText            = 10 , _
  $GuiCtrlListCtrlID          = 11 , _
  $ButtonOK                   = 12 , _
  $ButtonQuit                 = 13 , _
  $ButtonHelp                 = 14 , _
  $ButtonQuery                = 15 , _
  $ButtonSend                 = 16 , _
  $StatusBar1                 = 17 , _
  $GuiCtrlCursor              = 18 , _
  $GuiCtrlAutoITWindows       = 19 , _
  $GuiCtrlCBoxOpt1            = 20 , _
  $GuiCtrlCBoxOpt2            = 21 , _
  $GuiCtrlCBoxOpt3            = 22 , _
  $GuiCtrlIcon01              = 23 , _
  $GuiCtrlAutoITWindowsInfo2  = 24 , _
  $ButtonCOM                  = 25 , _
  $GuiCtrlCBoxOpt4            = 26 , _
  $GuiGroupAutoITIcon         = 27 , _
  $EFormEnumSize              = 28

Global $ArrayFrameInfo[$EHIEnumSize]

Global $ArrayFormQuery[$EFormEnumSize][$EEnumSize]

Global $NameStorage = DllStructCreate( "typedef char NameList[128] TName;" )

Global Enum _
  $ESCCIsVisible            = 0 , _
  $ESCCIsEnabled            = 1 , _
  $ESCCShowDropDown         = 2 , _
  $ESCCHideDropDown         = 3 , _
  $ESCCAddString            = 4 , _
  $ESCCDelString            = 5 , _
  $ESCCFindString           = 6 , _
  $ESCCSetCurrentSelection  = 7 , _
  $ESCCSelectString         = 8 , _
  $ESCCIsChecked            = 9 , _
  $ESCCCheck                = 10 , _
  $ESCCUnCheck              = 11 , _
  $ESCCGetCurrentLine       = 12 , _
  $ESCCGetCurrentCol        = 13 , _
  $ESCCGetCurrentSelection  = 14 , _
  $ESCCGetLineCount         = 15 , _
  $ESCCGetLine              = 16 , _
  $ESCCGetSelected          = 17 , _
  $ESCCEditPaste            = 18 , _
  $ESCCCurrentTab           = 19 , _
  $ESCCTabRight             = 20 , _
  $ESCCTabLeft              = 21 , _
  $ESCCSendCommandID        = 22 , _
  $ESCCEnumSize             = 23 , _
  $ESCCDefault              = 10

Global $CtrlCmdOption[$ESCCEnumSize] = [ _
  "IsVisible", "IsEnabled","ShowDropDown","HideDropDown" , _
  "AddString","DelString","FindString","SetCurrentSelection" , _
  "SelectString","IsChecked","Check","UnCheck","GetCurrentLine" , _
  "GetCurrentCol","GetCurrentSelection","GetLineCount","GetLine", _
  "GetSelected","EditPaste","CurrentTab","TabRight","TabLeft", "SendCommandID" _
  ]

Global Enum _
  $ECtrlIsControlCommand    = 0 , _
  $ECtrlIsEnumSize          = 1 , _
  $ECtrlIsDefault           = 0

Global $CtrlCmdName[$ECtrlIsEnumSize] = [ "CtrCmd" ]

$ArrayFrameInfo[$EHICheckBoxReturn] = $EnumCheckBoxFocusFree
$ArrayFrameInfo[$EHICheckBoxAutoITReport] = $EnumCheckBoxNoAutoItLink

$ArrayFormQuery[$GuiCtrlListTitle][$EQueryStorage] = DllStructCreate( "TName[ 128 ];" )
$ArrayFormQuery[$GuiCtrlListTitle][$EQueryStorageIndex] = 0

Func ControlQuery()
  Local $StrFuncName = "ControlQuery"
  ConsoleWrite("@CRLF@From Func $StrFuncName$:@CRLF@" )
  $ArrayFormQuery[$Form1][$EHwnd] = GUICreate( "Automation Stream",  497, 409, 933, 193 )

  GUISetIcon( "D:\002.ico" )
  GUISetFont( 9, 400, 0, "MS Sans Serif" )
  GUISetOnEvent($GUI_EVENT_CLOSE,     "Form1Close"    )
  GUISetOnEvent($GUI_EVENT_MINIMIZE,  "Form1Minimize" )
  GUISetOnEvent($GUI_EVENT_MAXIMIZE,  "Form1Maximize" )
  GUISetOnEvent($GUI_EVENT_RESTORE,   "Form1Restore"  )
  #cs
    Text Send Form
  #ce
    #cs
      Reserved to query Title/Text/Ctrl
    #ce
  $ArrayFormQuery[$GroupBox1][$EHwnd]                 = GUICtrlCreateGroup( "Text Send Form", 10, 1, 446, 311 )
  $ArrayFormQuery[$Group1][$EHwnd]                    = GUICtrlCreateGroup( "Windows Information", 21, 18, 425, 141)
  $ArrayFormQuery[$Label1][$EHwnd]                    = GUICtrlCreateLabel( "Title: ", 31, 38, 36, 20 )
  $ArrayFormQuery[$Label2][$EHwnd]                    = GUICtrlCreateLabel( "Text:",  31, 63, 33, 20 )
  $ArrayFormQuery[$Label3][$EHwnd]                    = GUICtrlCreateLabel( "CtrlID: ", 31, 89, 42, 20 )
  $ArrayFormQuery[$GuiCtrlListTitle][$EHwnd]          = GUICtrlCreateCombo( "", 71, 35, 186, 25 )
  $ArrayFormQuery[$GuiCtrlListText][$EHwnd]           = GUICtrlCreateCombo( "", 71, 61, 186, 25 )
  $ArrayFormQuery[$GuiCtrlListCtrlID][$EHwnd]         = GUICtrlCreateCombo( "", 71, 87, 186, 25 )

    #cs
      Reserved  for Cursor Property/Windows Information link/Other CheckBox.
    #ce
  $ArrayFormQuery[$GuiCtrlCursor][$EHwnd]             = GUICtrlCreateCheckbox( "Cursor Dependent", 264, 35, 129, 17 )
  $ArrayFormQuery[$GuiCtrlAutoITWindows][$EHwnd]      = GUICtrlCreateCheckbox( "Windows Info", 264, 54, 97, 17 )
  $ArrayFormQuery[$GuiCtrlAutoITWindowsInfo2][$EHwnd] = GUICtrlCreateCheckbox( "Windows Info2", 264, 78, 105, 17 )


    #cs
      Reserved for Icon and Loader
    #ce
  $ArrayFormQuery[$GuiCtrlIcon01][$EHwnd]             = GUICtrlCreateIcon( "C:\Program Files\AutoIt3\Au3Info.exe", -1, 386, 107, 39, 38, BitOR( $SS_NOTIFY,$WS_GROUP ) )
  $ArrayFormQuery[$GuiGroupAutoITIcon][$EHwnd]        = GUICtrlCreateGroup("AutoIT", 376, 90, 65, 65)

  #cs
    Text Inside Control
  #ce
  $ArrayFormQuery[$Label4][$EHwnd]              = GUICtrlCreateLabel( "Text Inside Control", 24, 162, 114, 20 )

    #cs
      Reserved for Edit Field
    #ce
    $ArrayFormQuery[$GuiCtrlEditText][$EHwnd]           = GUICtrlCreateEdit( "", 24, 188, 425, 88)
    GUICtrlSetData( $ArrayFormQuery[$GuiCtrlEditText][$EHwnd], "" )

    #cs
      Reserved for ComboBox Section
    #ce
    $ArrayFormQuery[$GuiCtrlCBoxOpt1][$EHwnd]           = GUICtrlCreateCombo( "" , 150, 281, 139, 25 )
    $ArrayFormQuery[$GuiCtrlCBoxOpt4][$EHwnd]           = GUICtrlCreateCombo( "" , 24, 281, 120, 25 )
    ;$ArrayFormQuery[$GuiCtrlCBoxOpt2][$EHwnd]           = GUICtrlCreateCombo( "" , 121, 281, 139, 25 )
    GUICtrlSetData($ArrayFormQuery[$GuiCtrlCBoxOpt4][$EHwnd], _ArrayToString($CtrlCmdName, "|" ), $CtrlCmdName[$ECtrlIsDefault ] )
    GUICtrlSetData($ArrayFormQuery[$GuiCtrlCBoxOpt1][$EHwnd], _ArrayToString($CtrlCmdOption, "|" ), $CtrlCmdOption[$ESCCDefault] )

    #cs
      Reserved for CheckBox Section
    #ce
    $ArrayFormQuery[$GuiCtrlCBoxOpt2][$EHwnd]           = GUICtrlCreateRadio( "Getter ", 298, 281, 74, 17 )
    $ArrayFormQuery[$GuiCtrlCBoxOpt3][$EHwnd]           = GUICtrlCreateRadio("Setter ", 380, 281, 126, 17 )

  #cs
    Button List in Bottom of the page.
  #ce

  $ArrayFormQuery[$ButtonQuery][$EHwnd]               = GUICtrlCreateButton( "Qu&ery", 14, 322, 51, 25, $WS_GROUP )
  $ArrayFormQuery[$ButtonSend][$EHwnd]                = GUICtrlCreateButton( "&Send",  14, 346, 51, 25, $WS_GROUP )


  GUICtrlCreateGroup("", -99, -99, 1, 1)




  $ArrayFormQuery[$ButtonOK][$EHwnd]            = GUICtrlCreateButton( "&OK", 184, 322, 90, 25, $WS_GROUP )

  $ArrayFormQuery[$ButtonQuit][$EHwnd]          = GUICtrlCreateButton( "&Quit",  275, 323, 90, 25, $WS_GROUP )

  $ArrayFormQuery[$ButtonHelp][$EHwnd]          = GUICtrlCreateButton( "&Help", 365, 323, 90, 25, $WS_GROUP )

  $ArrayFormQuery[$ButtonCOM][$EHwnd]           = GUICtrlCreateButton("&Com", 93, 323, 90, 25, $WS_GROUP)

  GUICtrlSetOnEvent( $ArrayFormQuery[$Label1][$EHwnd],                "Label1Click" )
  GUICtrlSetOnEvent( $ArrayFormQuery[$Label2][$EHwnd],                "Label2Click" )
  GUICtrlSetOnEvent( $ArrayFormQuery[$Label3][$EHwnd],                "Label3Click" )
  GUICtrlSetOnEvent( $ArrayFormQuery[$GuiCtrlListTitle][$EHwnd],      "GuiCtrlListTitleChange" )
  GUICtrlSetOnEvent( $ArrayFormQuery[$GuiCtrlListText][$EHwnd],       "GuiCtrlListTextChange" )
  GUICtrlSetOnEvent( $ArrayFormQuery[$GuiCtrlListCtrlID][$EHwnd],     "GuiCtrlListCtrlIDChange" )
  GUICtrlSetOnEvent( $ArrayFormQuery[$GuiCtrlCursor][$EHwnd],         "CursorWaitPos")
  GUICtrlSetOnEvent( $ArrayFormQuery[$ButtonQuery][$EHwnd],           "ButtonQuery" )
  GUICtrlSetOnEvent( $ArrayFormQuery[$ButtonSend][$EHwnd],            "ButtonSend" )
  GUICtrlSetOnEvent( $ArrayFormQuery[$GuiCtrlEditText][$EHwnd],       "GuiCtrlEditTextChange" )
  GUICtrlSetOnEvent( $ArrayFormQuery[$Label4][$EHwnd],                "Label4Click" )
  GUICtrlSetOnEvent( $ArrayFormQuery[$ButtonOK][$EHwnd],              "ButtonOK" )
  GUICtrlSetOnEvent( $ArrayFormQuery[$ButtonQuit][$EHwnd],            "ButtonQuit" )
  GUICtrlSetOnEvent( $ArrayFormQuery[$ButtonHelp][$EHwnd],            "ButtonHelp" )
  GUICtrlSetOnEvent( $ArrayFormQuery[$ButtonCOM][$EHwnd],             "ButtonCOM" )

  GUICtrlSetOnEvent( $ArrayFormQuery[$GuiCtrlAutoITWindows][$EHwnd],  "AutoItWindowsInfoReport" )
  GUICtrlSetOnEvent( $ArrayFormQuery[$GuiCtrlCBoxOpt1][$EHwnd],       "GuiCheckBoxOpt1" )
  GUICtrlSetOnEvent( $ArrayFormQuery[$GuiCtrlCBoxOpt2][$EHwnd],       "GuiCheckBoxOpt2" )
  GUICtrlSetOnEvent( $ArrayFormQuery[$GuiCtrlCBoxOpt3][$EHwnd],       "GuiCheckBoxOpt3" )

  GUICtrlSetOnEvent( $ArrayFormQuery[$GuiCtrlIcon01][$EHwnd],         "AutoITLoader" )


  $ArrayFormQuery[$StatusBar1][$EHwnd]          = _GUICtrlStatusBar_Create( $ArrayFormQuery[$Form1][$EHwnd] )
  GUISetState( @SW_SHOW )
  #EndRegion ### END Koda GUI section ###

  While 1
    Sleep( 100 )
  WEnd
EndFunc

Func AutoItFormTransfertInfo( $ArrayNameInfo , $EAVarHolder=0, $EAVarReference=1 )
  Local $IntArrayCASS     = UBound( $ArrayNameInfo, 1 ) - 1
  Local $IntLimBaseArray  = UBound( $ArrayNameInfo, 0 )
  Local $IntLimDimArray   = UBound( $ArrayNameInfo, 1 )

  ConsoleWrite( "Array[" & $IntLimBaseArray &"][" & $IntLimDimArray & "]@CRLF@" )

  For $IntCxItemTest = 0 To $IntArrayCASS
    If $ArrayNameInfo[$IntCxItemTest][$EAVarHolder] <> "" Then
      Local $StrInfoGetter=$ArrayNameInfo[$IntCxItemTest][$EAVarHolder]
      Local $TAddrHwndUpdate=$ArrayNameInfo[$IntCxItemTest][$EAVarReference]
      ConsoleWrite( "@CRLF@Captured Information, AutoIT@CRLF@@TAB@HWND:$TAddrHwndUpdate$, Content: $StrInfoGetter$@CRLF@" )
      GUICtrlSetData( $TAddrHwndUpdate, $StrInfoGetter, $StrInfoGetter )
    EndIf
  Next
EndFunc

Func GetAutoItWindowsInfo()
  Local $StrFuncName = "GetAutoItWindowsInfo"
  ConsoleWrite("@CRLF@From Func $StrFuncName$:@CRLF@" )
  Local $StrAuTitle, $StrAuText, $StrAuCtrlID
  $ArrayFrameInfo[$EHITitleName]        = ControlGetText( "(Frozen) AutoIt v3 Window Info", "Basic Window Info", "Edit1" )
  $ArrayFrameInfo[$EHITextContent]      = ControlCommand( "(Frozen) AutoIt v3 Window Info", "Basic Window Info", "Edit5" , "GetLine", 0 )
  $ArrayFrameInfo[$EHICtrlID]           = ControlListView( "(Frozen) AutoIt v3 Window Info", "Basic Window Info", "SysTabControl321", "GetText", 0  )

  $StrAuTitle   = $ArrayFrameInfo[$EHITitleName]
  $StrAuText    = $ArrayFrameInfo[$EHITextContent]
  $StrAuCtrlID  = $ArrayFrameInfo[$EHICtrlID]

  Local Enum _
    $EVarGetter     = 0 , _
    $EVarReference  = 1 , _
    $EVarEnumSize   = 2

  Local $ArrayCaseAss[3][$EVarEnumSize] = _
  [ _
    [ $StrAuTitle,  $ArrayFormQuery[$GuiCtrlListTitle][$EHwnd]   ], _
    [ $StrAuText,   $ArrayFormQuery[$GuiCtrlListText][$EHwnd]    ], _
    [ $StrAuCtrlID, $ArrayFormQuery[$GuiCtrlListCtrlID][$EHwnd]  ]  _
  ]
  AutoItFormTransfertInfo( $ArrayCaseAss , $EVarGetter, $EVarReference )

EndFunc

Func AutoItWindowsInfoReport()
  $ArrayFrameInfo[$EHICheckBoxAutoITReport]        = GUICtrlRead( @GUI_CtrlId, "Checkbox" )
  Local $StrFuncName = "AutoItWindowsInfoReport"
  ConsoleWrite("@CRLF@From Func $StrFuncName$:@CRLF@" )
  ; $ArrayFrameInfo[$EHICheckBoxAutoITReport] = $EnumCheckBoxNoAutoItLink
  If $ArrayFrameInfo[$EHICheckBoxAutoITReport] == $EnumCheckBoxAutoItLink Then
      ConsoleWrite("@TAB@Linkking Auto0IT Windows Information.@CRLF@" )
      GetAutoItWindowsInfo()
  EndIf
EndFunc

Func GuiCheckBoxOpt1()

EndFunc
Func GuiCheckBoxOpt2()

EndFunc

Func GuiCheckBoxOpt3()

EndFunc

#cs
  Ff O)O RRR  O(O RRR  O(O  MMMM 2010-12-07
  F  O ) RR   O ( RR   O ( M M M
#ce  O)O R RR O(O R RR O(O M  M
Func ButtonQuery()
  Local $StrFuncName = "ButtonQuery"
  ConsoleWrite("@CRLF@From Func $StrFuncName$:@CRLF@" )
  $ArrayFrameInfo[$EHITitleName]        = GUICtrlRead( $ArrayFormQuery[$GuiCtrlListTitle][$EHwnd] )
  $ArrayFrameInfo[$EHITextContent]      = GUICtrlRead( $ArrayFormQuery[$GuiCtrlListText][$EHwnd] )
  $ArrayFrameInfo[$EHICtrlID]           = GUICtrlRead( $ArrayFormQuery[$GuiCtrlListCtrlID][$EHwnd] )
  $ArrayFrameInfo[$EHISendInformation]  = GUICtrlRead( $ArrayFormQuery[$GuiCtrlEditText][$EHwnd] )
  Local $HwndCapture = ""
  Local $StrCaptureInfo = ""
  If $ArrayFrameInfo[$EHISendInformation] == "" Then
      $HwndCapture = ControlGetHandle( $ArrayFrameInfo[$EHITitleName], $ArrayFrameInfo[$EHITextContent], $ArrayFrameInfo[$EHICtrlID] )
      ;$StrCaptureInfo=GUICtrlRead( $HwndCapture , 1 )
      $StrCaptureInfo=ControlGetText ( $ArrayFrameInfo[$EHITitleName], $ArrayFrameInfo[$EHITextContent], $ArrayFrameInfo[$EHICtrlID] )
      GUICtrlSetData( $ArrayFormQuery[$GuiCtrlEditText][$EHwnd], $StrCaptureInfo )
  EndIf

  ConsoleWrite( " $EHITitleName:" & $ArrayFrameInfo[$EHITitleName] & _
                " $EHITextContent:" & $ArrayFrameInfo[$EHITextContent] & _
                " $EHICtrlID:" & $ArrayFrameInfo[$EHICtrlID] & _
                " Capture Information: " & $StrCaptureInfo & _
                " @CRLF@@TAB@Edit Field:" & $ArrayFrameInfo[$EHISendInformation] & "@CRLF@" )

EndFunc

Func WindowsWaitState()
  Local $StrFuncName = "WindowsWaitState"
  ConsoleWrite("@CRLF@From Func $StrFuncName$@CRLF@" )
  $ArrayFrameInfo[$EHITitleName]        = GUICtrlRead( $ArrayFormQuery[$GuiCtrlListTitle][$EHwnd] )
  $ArrayFrameInfo[$EHITextContent]      = GUICtrlRead( $ArrayFormQuery[$GuiCtrlListText][$EHwnd] )

    Local $EWinWaitState=WinWaitActive( $ArrayFrameInfo[$EHITitleName] , $ArrayFrameInfo[$EHITextContent], 5 )
    If $EWinWaitState == 0 Then
      MsgBox( 4096 , "Windows Allocation Failed" , "Can not allocate windows for activation and automation." , 0 )
    EndIf
    WinActivate( $ArrayFrameInfo[$EHITitleName] , $ArrayFrameInfo[$EHITextContent] )
EndFunc

Func ButtonSend()

  Local $StrFuncName = "ButtonSend"
  ConsoleWrite("@CRLF@From Func $StrFuncName$@CRLF@" )

  If $ArrayFrameInfo[$EHICtrlID] == "" Then
    $ArrayFrameInfo[$EHISendInformation]  = GUICtrlRead( $ArrayFormQuery[$GuiCtrlEditText][$EHwnd] )

;    Local $EWinWaitState=WinWaitActive( $ArrayFrameInfo[$EHITitleName] , $ArrayFrameInfo[$EHITextContent], 5 )
;   If $EWinWaitState == 0 Then
;      MsgBox( 4096 , "Windows Allocation Failed" , "Can not allocate windows for activation and automation." , 0 )
;    EndIf
;    WinActivate( $ArrayFrameInfo[$EHITitleName] , $ArrayFrameInfo[$EHITextContent] )
    WindowsWaitState()
    ;CursorWaitPos()
    If $ArrayFrameInfo[$EHICheckBoxReturn] == $EnumCheckBoxFocusFree Then
      Send( $ArrayFrameInfo[$EHISendInformation] )
    EndIf
    If $ArrayFrameInfo[$EHICheckBoxReturn] == $EnumCheckBoxFocusForced Then
      MsgBox( 4096, "Windows Action", "This windows Implies third hand for allocation problems or lack of ControlID. Please Focus on the field to write the information and press OK." , 0 )
      $ArrayFrameInfo[$EHISendInformation]  = GUICtrlRead( $ArrayFormQuery[$GuiCtrlEditText][$EHwnd] )
      Send( $ArrayFrameInfo[$EHISendInformation] )
    EndIf
  Else
    WindowsWaitState()
    ControlSend( $ArrayFrameInfo[$EHITitleName] , $ArrayFrameInfo[$EHITextContent], $ArrayFrameInfo[$EHICtrlID], $ArrayFrameInfo[$EHISendInformation] )

  EndIf

EndFunc

Func Form1Close()
  Local $StrFuncName = "Form1Close"
  ConsoleWrite("@CRLF@From Func $StrFuncName$@CRLF@" )
  Exit
EndFunc

Func Form1Maximize()
  Local $StrFuncName = "Form1Maximize"
  ConsoleWrite("@CRLF@From Func $StrFuncName$@CRLF@" )
EndFunc

Func Form1Minimize()
  Local $StrFuncName = "Form1Minimize"
  ConsoleWrite("@CRLF@From Func $StrFuncName$@CRLF@" )
EndFunc

Func Form1Restore()
  Local $StrFuncName = "Form1Restore"
  ConsoleWrite("@CRLF@From Func $StrFuncName$@CRLF@" )
EndFunc

Func GuiCtrlEditTextChange()
  Local $StrFuncName = "GuiCtrlEditTextChange"
  ConsoleWrite("@CRLF@From Func $StrFuncName$@CRLF@" )

EndFunc

Func GuiCtrlListCtrlIDChange()
  Local $StrFuncName = "GuiCtrlListCtrlIDChange"
  ConsoleWrite("@CRLF@From Func $StrFuncName$@CRLF@" )
EndFunc

Func GuiCtrlListTextChange()
  Local $StrFuncName = "GuiCtrlListTextChange"
  ConsoleWrite("@CRLF@From Func $StrFuncName$@CRLF@" )
EndFunc

Func GuiCtrlListTitleChange()
  Local $StrFuncName = "GuiCtrlListTitleChange"
  ConsoleWrite("@CRLF@From Func $StrFuncName$@CRLF@" )
  $ArrayFormQuery[$GuiCtrlListTitle][$EQueryGet] = GUICtrlRead( @GUI_CtrlId )
  Local $StrValue=$ArrayFormQuery[$GuiCtrlListTitle][$EQueryGet]
  ConsoleWrite( "@CRLF@GuiCtrlListTitleChange: $StrValue$@CRLF@" )

EndFunc

Func ButtonOK()
  Local $StrFuncName = "ButtonOK"
  ConsoleWrite("@CRLF@From Func $StrFuncName$@CRLF@" )
EndFunc

Func ButtonQuit()
  Local $StrFuncName = "ButtonQuit"
  ConsoleWrite("@CRLF@From Func $StrFuncName$@CRLF@" )
  Exit
EndFunc

Func ButtonCOM()

EndFunc

Func ButtonHelp()
  Local $StrFuncName = "ButtonHelp"
  ConsoleWrite("@CRLF@From Func $StrFuncName$@CRLF@" )
EndFunc

Func CursorWaitPos()
  Local $StrFuncName = "CursorWaitPos"
  ConsoleWrite("@CRLF@From Func $StrFuncName$@CRLF@" )
  ;$ArrayFrameInfo[$EHICheckBoxReturn]     = GUICtrlRead( $ArrayFormQuery[$GuiCtrlCursor][$EHwnd], "Checkbox" )
  $ArrayFrameInfo[$EHICheckBoxReturn]      = GUICtrlRead( @GUI_CtrlId, "Checkbox" )
  ConsoleWrite( "@CRLF@CheckBox Return : " & $ArrayFrameInfo[$EHICheckBoxReturn] &"@CRLF@" )
EndFunc

Func Label1Click()
  Local $StrFuncName = "Label1Click"
  ConsoleWrite("@CRLF@From Func $StrFuncName$@CRLF@" )
EndFunc

Func Label2Click()
  Local $StrFuncName = "Label2Click"
  ConsoleWrite("@CRLF@From Func $StrFuncName$@CRLF@" )
EndFunc

Func Label3Click()
  Local $StrFuncName = "Label3Click"
  ConsoleWrite("@CRLF@From Func $StrFuncName$@CRLF@" )
EndFunc

Func Label4Click()
  Local $StrFuncName = "Label4Click"
  ConsoleWrite("@CRLF@From Func $StrFuncName$@CRLF@" )
EndFunc

Func AutoITLoader()
  ;; ControlHide( )
  ProcessClose( "Au3Info.exe" )
  ShellExecute ( "C:\Program Files\AutoIt3\Au3Info.exe" ,"", "" ,"open" , @SW_SHOW )
  Sleep( 3 )
  Local $StrTitle="(Frozen) AutoIt v3 Window Info"
  Local $StrText="Basic Window Info"
  Local $StrClassID="Static6"

 ;MouseMove ( x, y [, speed] )
EndFunc

ControlQuery()
