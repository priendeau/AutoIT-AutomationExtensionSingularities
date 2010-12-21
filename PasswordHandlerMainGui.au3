#include <IE.au3>


Func GuiPicOpenIEPage()
  Local $oIE = _IECreate($ArrayGuiInterface[$EGuiCompanyPic][$EIfaceExternalLink])
EndFunc

Func GuiButtonSend()
  Execute( $ArrayGuiInterface[$EIfaceHwnd][$EGuiComboReadChoice] & "()" )
EndFunc

Func GuiButtonQuit()
  Exit
EndFunc

Func GuiButtonHelp()

EndFunc



Func MainGui( $IntDefaultApplicationId=$EAppsVPNPowerCA)

  Local $StrListApplicationControl=_ArrayToString( $ArrayFuncTitleList, "|" )
  Local $StrDefaultLAC=$ArrayFuncTitleList[$IntDefaultApplicationId]

  #Region ### START Koda GUI section ### Form=E:\document\API\AutoIT\FormPasswordSenderKellyIBM.kxf
  $ArrayGuiInterface[$EIfaceHwnd][$EGuiChildNode] = GUICtrlCreateDummy()
  $ArrayGuiInterface[$EIfaceHwnd][$EGuiForm1] = GUICreate("User Content Management Facilities", 564, 240, 645, 289)
  GUICtrlSendToDummy ( $ArrayGuiInterface[$EGuiChildNode], GUICtrlGetState( $ArrayGuiInterface[$EGuiForm1] ) )

  $ArrayGuiInterface[$EIfaceHwnd][$EGuiGrpHandlerSrv]        = GUICtrlCreateGroup("Kelly / IBM Password Management ", 20, 24, 513, 81)
  $ArrayGuiInterface[$EIfaceHwnd][$EGuiLabelLabelDeclServ]   = GUICtrlCreateLabel("Services Handler Name ", 39, 66, 162, 20)
  $ArrayGuiInterface[$EIfaceHwnd][$EGuiHandlerServNameCBBox] = GUICtrlCreateCombo("HandlerServNameCBBox", 211, 64, 214, 25)

  GUICtrlSetData($ArrayGuiInterface[$EGuiHandlerServNameCBBox], $StrListApplicationControl , $StrDefaultLAC )

  $ArrayGuiInterface[$EIfaceHwnd][$EGuiButtonSend] = GUICtrlCreateButton("Send", 429, 64, 86, 25, $WS_GROUP)


  GUICtrlSetOnEvent( $ArrayGuiInterface[$EIfaceHwnd][$EGuiButtonSend], $ArrayGuiInterface[$EGuiButtonSend][$EIfaceEvent] )

  GUICtrlCreateGroup("", -99, -99, 1, 1)

  $ArrayGuiInterface[$EIfaceHwnd][$EGuiButtonQuit] = GUICtrlCreateButton("Quit", 356, 144, 75, 25, $WS_GROUP)
  GUICtrlSetOnEvent( $ArrayGuiInterface[$EIfaceHwnd][$EGuiButtonQuit], $ArrayGuiInterface[$EGuiButtonQuit][$EIfaceEvent] )

  $ArrayGuiInterface[$EIfaceHwnd][$EGuiButtonHelp] = GUICtrlCreateButton("Help", 436, 144, 75, 25, $WS_GROUP)
  GUICtrlSetOnEvent( $ArrayGuiInterface[$EIfaceHwnd][$EGuiButtonHelp], $ArrayGuiInterface[$EGuiButtonHelp][$EIfaceEvent] )

  $ArrayGuiInterface[$EIfaceHwnd][$EGuiCompanyPic] = GUICtrlCreatePic("logotop_KellyInformatique.gif", 20, 104, 188, 76, BitOR($SS_NOTIFY,$WS_GROUP,$WS_CLIPSIBLINGS))
  GUICtrlSetOnEvent( $ArrayGuiInterface[$EIfaceHwnd][$EGuiCompanyPic], $ArrayGuiInterface[$EGuiCompanyPic][$EIfaceEvent] )

  $ArrayGuiInterface[$EIfaceHwnd][$EGuiGroup1] = GUICtrlCreateGroup("Password Handler", 4, 8, 553, 201)
  GUICtrlCreateGroup("", -99, -99, 1, 1)
  $ArrayGuiInterface[$EIfaceHwnd][$EGuiStatusBar1] = _GUICtrlStatusBar_Create($ArrayGuiInterface[$EGuiForm1])
  GUISetState(@SW_SHOW)
  #EndRegion ### END Koda GUI section ###
EndFunc

Func GuiEventSequence()

  While 1
    $ArrayGuiInterface[$EIfaceHwnd][$EGuinMsg] = GUIGetMsg()
    $ArrayGuiInterface[$EIfaceHwnd][$EGuiComboReadChoice] = GUICtrlRead ( $ArrayGuiInterface[$EIfaceHwnd][$EGuiHandlerServNameCBBox] , "Combo" )

    Switch $ArrayGuiInterface[$EIfaceHwnd][$EGuinMsg]
      Case $ArrayGuiInterface[$EIfaceHwnd][$EGuiButtonQuit]
        ExitLoop
      Case $GUI_EVENT_CLOSE
        ExitLoop
      Case $ArrayGuiInterface[$EIfaceHwnd][$EGuiButtonSend]
        Execute( $ArrayGuiInterface[$EIfaceHwnd][$EGuiComboReadChoice] & "()" )

    EndSwitch
  WEnd
  Exit
EndFunc