#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <IE.au3>

Global Enum _
  $EAHelpGuiHelpReference       = 0, _
  $EAHelpGUIActiveX             = 1, _
  $EAHelpoIE                    = 2, _
  $EAHelpGUI_EVENT_CLOSE        = 3, _
  $EAHelpGUI_EVENT_MINIMIZE     = 4, _
  $EAHelpGUI_EVENT_MAXIMIZE     = 5, _
  $EAHelpGUI_EVENT_RESTORE      = 6, _
  $EAHelpGuiButtonBack          = 7, _
  $EAHelpGuiButtonForward       = 8, _
  $EAHelpGuiButtonHome          = 9, _
  $EAHelpGuiButtonStop          = 10, _
  $EAHelpGuiButtonGo            = 11, _
  $EAHelpStatusBar1             = 12, _
  $EAHelpGroup1                 = 13, _
  $EAHelpGuiNavBarAddr          = 14, _
  $EAHelpEnumSize               = 15

#cs
Global Enum _
  $EIfaceHwnd                   = 0 , _
  $EIfaceEvent                  = 1 , _
  $EIfaceTextInfo               = 2 , _
  $EIfaceExternalLink           = 3 , _
  $EIfaceEventFuncName          = 4 , _
  $EIfaceEnumSize               = 5
#ce

  Global $ArrayHelpPage[ $EAHelpEnumSize ][ $EIfaceEnumSize ]
  $ArrayHelpPage[$EAHelpoIE][$EIfaceExternalLink]          = "http://www.mykelly.ca/eprise/main/web/ca/mykelly/fr/index.html?division=kit"
  $ArrayHelpPage[$EAHelpGuiHelpReference][$EIfaceTextInfo] = "MyKelly Reference Page"
  $ArrayHelpPage[$EAHelpGuiButtonBack][$EIfaceTextInfo]    = "Back"
  $ArrayHelpPage[$EAHelpGuiButtonForward][$EIfaceTextInfo] = "Forward"
  $ArrayHelpPage[$EAHelpGuiButtonHome][$EIfaceTextInfo]    = "Home"
  $ArrayHelpPage[$EAHelpGuiButtonStop][$EIfaceTextInfo]    = "Stop"
  $ArrayHelpPage[$EAHelpGuiButtonGo][$EIfaceTextInfo]      = "Go"
  $ArrayHelpPage[$EAHelpGroup1][$EIfaceTextInfo]           = "Kelly Reference Pages"
  $ArrayHelpPage[$EAHelpGuiNavBarAddr][$EIfaceTextInfo]    = "http://"

  $ArrayHelpPage[$EAHelpGUI_EVENT_CLOSE][$EIfaceEventFuncName]   = "GuiHelpReferenceClose"
  $ArrayHelpPage[$EAHelpGUI_EVENT_MINIMIZE][$EIfaceEventFuncName]= "GuiHelpReferenceMinimize"
  $ArrayHelpPage[$EAHelpGUI_EVENT_MAXIMIZE][$EIfaceEventFuncName]= "GuiHelpReferenceMaximize"
  $ArrayHelpPage[$EAHelpGUI_EVENT_RESTORE][$EIfaceEventFuncName] = "GuiHelpReferenceRestore"
  $ArrayHelpPage[$EAHelpGuiButtonBack][$EIfaceEventFuncName]     = "GuiButtonBackClick"
  $ArrayHelpPage[$EAHelpGuiButtonForward][$EIfaceEventFuncName]  = "GuiButtonForwardClick"
  $ArrayHelpPage[$EAHelpGuiButtonHome][$EIfaceEventFuncName]     = "GuiButtonHomeClick"
  $ArrayHelpPage[$EAHelpGuiButtonStop][$EIfaceEventFuncName]     = "GuiButtonStopClick"
  $ArrayHelpPage[$EAHelpGuiButtonGo][$EIfaceEventFuncName]       = "GuiButtonGoClick"
  $ArrayHelpPage[$EAHelpGuiNavBarAddr][$EIfaceEventFuncName]     = "GuiNavBarAddrChange"


Func HelpPageSupport()
  _IEErrorHandlerRegister ()

  $ArrayHelpPage[$EAHelpoIE][$EIfaceHwnd] = _IECreateEmbedded ()

  #Region ### START Koda GUI section ### Form=
  $ArrayHelpPage[$EAHelpGuiHelpReference][$EIfaceHwnd]  = GUICreate($ArrayHelpPage[$EAHelpGuiHelpReference][$EIfaceTextInfo], 905, 504, 459, 97 )
  $ArrayHelpPage[$EAHelpGUIActiveX][$EIfaceHwnd]        = GUICtrlCreateObj( $ArrayHelpPage[$EAHelpoIE][$EIfaceHwnd], 10, 90, 885, 360 )

  _IENavigate ( $ArrayHelpPage[$EAHelpoIE][$EIfaceHwnd], $ArrayHelpPage[$EAHelpoIE][$EIfaceExternalLink] )


  $ArrayHelpPage[$EAHelpGuiButtonBack][$EIfaceHwnd]     = _
    GUICtrlCreateButton( $ArrayHelpPage[$EAHelpGuiButtonBack][$EIfaceTextInfo], 17, 30, 100, 23, $WS_GROUP)

  $ArrayHelpPage[$EAHelpGuiButtonForward][$EIfaceHwnd]        = _
    GUICtrlCreateButton( $ArrayHelpPage[$EAHelpGuiButtonForward][$EIfaceTextInfo], 127, 30, 100, 23, $WS_GROUP)


  $ArrayHelpPage[$EAHelpGuiButtonHome][$EIfaceHwnd]     = _
    GUICtrlCreateButton( $ArrayHelpPage[$EAHelpGuiButtonHome][$EIfaceTextInfo], 237, 30, 100, 23, $WS_GROUP)


  $ArrayHelpPage[$EAHelpGuiButtonStop][$EIfaceHwnd]     = _
    GUICtrlCreateButton( $ArrayHelpPage[$EAHelpGuiButtonStop][$EIfaceTextInfo] , 347, 30, 100, 23, $WS_GROUP)


  $ArrayHelpPage[$EAHelpGuiButtonGo][$EIfaceHwnd]       = _
    GUICtrlCreateButton($ArrayHelpPage[$EAHelpGuiButtonGo][$EIfaceTextInfo], 17, 56, 100, 23, $WS_GROUP)

  $ArrayHelpPage[$EAHelpStatusBar1][$EIfaceHwnd]        = _
    _GUICtrlStatusBar_Create( $ArrayHelpPage[$EAHelpGuiHelpReference][$EIfaceHwnd] )

  $ArrayHelpPage[$EAHelpGroup1][$EIfaceHwnd]            = _
    GUICtrlCreateGroup($ArrayHelpPage[$EAHelpGroup1][$EIfaceTextInfo], 8, 8, 889, 465)

  $ArrayHelpPage[$EAHelpGuiNavBarAddr][$EIfaceHwnd]     = _
    GUICtrlCreateInput($ArrayHelpPage[$EAHelpGuiNavBarAddr][$EIfaceTextInfo], 128, 56, 737, 24)


  $ArrayHelpPage[$EAHelpGroup1][$EIfaceHwnd]      = _
    GUICtrlCreateGroup( "", -99, -99, 1, 1)

  $ArrayHelpPage[$EAHelpGUI_EVENT_CLOSE][$EIfaceHwnd] =$GUI_EVENT_CLOSE
  $ArrayHelpPage[$EAHelpGUI_EVENT_MINIMIZE][$EIfaceHwnd]= $GUI_EVENT_MINIMIZE
  $ArrayHelpPage[$EAHelpGUI_EVENT_MAXIMIZE][$EIfaceHwnd]= $GUI_EVENT_MAXIMIZE
  $ArrayHelpPage[$EAHelpGUI_EVENT_RESTORE][$EIfaceHwnd]= $GUI_EVENT_RESTORE

  GUISetOnEvent( $ArrayHelpPage[$EAHelpGUI_EVENT_CLOSE][$EIfaceHwnd]   ,  $ArrayHelpPage[$EAHelpGUI_EVENT_CLOSE][$EIfaceEventFuncName] )
  GUISetOnEvent( $ArrayHelpPage[$EAHelpGUI_EVENT_MINIMIZE][$EIfaceHwnd],  $ArrayHelpPage[$EAHelpGUI_EVENT_MINIMIZE][$EIfaceEventFuncName] )
  GUISetOnEvent( $ArrayHelpPage[$EAHelpGUI_EVENT_MAXIMIZE][$EIfaceHwnd],  $ArrayHelpPage[$EAHelpGUI_EVENT_MAXIMIZE][$EIfaceEventFuncName] )
  GUISetOnEvent( $ArrayHelpPage[$EAHelpGUI_EVENT_RESTORE][$EIfaceHwnd] ,  $ArrayHelpPage[$EAHelpGUI_EVENT_RESTORE][$EIfaceEventFuncName] )
  GUICtrlSetOnEvent( $ArrayHelpPage[$EAHelpGuiButtonBack][$EIfaceHwnd],    $ArrayHelpPage[$EAHelpGuiButtonBack][$EIfaceEventFuncName] )
  GUICtrlSetOnEvent( $ArrayHelpPage[$EAHelpGuiButtonForward][$EIfaceHwnd], $ArrayHelpPage[$EAHelpGuiButtonForward][$EIfaceEventFuncName] )
  GUICtrlSetOnEvent( $ArrayHelpPage[$EAHelpGuiButtonHome][$EIfaceHwnd],    $ArrayHelpPage[$EAHelpGuiButtonHome][$EIfaceEventFuncName] )
  GUICtrlSetOnEvent( $ArrayHelpPage[$EAHelpGuiButtonStop][$EIfaceHwnd],    $ArrayHelpPage[$EAHelpGuiButtonStop][$EIfaceEventFuncName] )
  GUICtrlSetOnEvent( $ArrayHelpPage[$EAHelpGuiButtonGo][$EIfaceHwnd],      $ArrayHelpPage[$EAHelpGuiButtonStop][$EIfaceEventFuncName] )
  GUICtrlSetOnEvent( $ArrayHelpPage[$EAHelpGuiNavBarAddr][$EIfaceHwnd],   $ArrayHelpPage[$EAHelpGuiNavBarAddr][$EIfaceEventFuncName] )


  GUISetState(@SW_SHOW, $ArrayHelpPage[$EAHelpGuiHelpReference][$EIfaceHwnd] )
  #EndRegion ### END Koda GUI section ###

  While 1
    Sleep(100)
  WEnd
EndFunc

Func GuiButtonBackClick()
EndFunc

Func GuiButtonForwardClick()
EndFunc

Func GuiButtonGoClick()
EndFunc

Func GuiButtonHomeClick()
EndFunc

Func GuiButtonStopClick()
EndFunc

Func GuiHelpReferenceClose()
  GUISetState(@SW_HIDE, $ArrayHelpPage[$EAHelpGuiHelpReference][$EIfaceHwnd])
Exit
EndFunc

Func GuiHelpReferenceMaximize()
EndFunc

Func GuiHelpReferenceMinimize()
EndFunc

Func GuiHelpReferenceRestore()
  GUISetState(@SW_HIDE, $ArrayHelpPage[$EAHelpGuiHelpReference][$EIfaceHwnd])
EndFunc

Func GuiNavBarAddrChange()
EndFunc

HelpPageSupport()
