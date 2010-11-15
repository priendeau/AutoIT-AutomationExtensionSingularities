#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_outfile=C:\Documents and Settings\Administrator\Desktop\KellyIbmConnector.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Res_Description=Password Manager and automation-tools in safe-environment
#AutoIt3Wrapper_Res_Fileversion=0.0.1.0
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Res_requestedExecutionLevel=requireAdministrator
#AutoIt3Wrapper_Res_File_Add=E:\document\API\AutoIT\logotop_KellyInformatique.gif, IMAGE, KELLYIMAGE
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#cs
  Development property, Patrick Riendeau 1997-2010, under old and new BSD License.

#ce


#cs
  Const-Caster, evolution of vnc ;

  Started in the mid-1990, the vnc aplication appear both in US and GB domain ( lately in EU ), dedicating
  wide family of management console into better-visual and appealing methodology to train
  I.T to understand this topology : A-Windows-Framework.

  Following this idea of wasting bandwith and and cpu's utility, All 'A-Windows-Framework' will depend
  of memory-section and focus on object to get interaction... One question remain, If all applications
  remain std. if we design accessor to allow directe interaction, shall we save time, bandwith and much
  more.

  Concept of vnc is first, an interpretation of of handler-host to handler-assistant, which is redrawing information
  in way User Experience can be similar has owning it's own screen onver distant... Can Be usefull for some case,
  but most of time-wasted in problematic of screen display can be saved with structured lookup between host...

  1- If we own an application with missing detail, it's faster interacting with per-focus field.
  2- Human insertion is error prone and will continue being a recluant factor even with vnc session..
  3- Most of human effort is directly based on pushing information from server to client. Assuming aplication
  are fixed and User-Interaction is not drawed, we can use VCN to push manually information... But what's
  happenning if information from VNC client owning direct user Interaction being reproduced to enhance
  management ??? A segment of Const-Caster... All interaction are fixed and permanent...



#ce

#cs
  Matrix of Functionality :
  This Matrix is responsible of functionnality being executed or not.
  This is used as reference in UnitTest to allow Application being validated against
  error .
#ce


#cs
  Note : The Prototype work with config-like .ini method with lot of unsafe methodology, while pre-draft in develpt.
  depend of Second-UI Interface and sqlite3 (db3) management compatible with AutoIT and Python for __future__ export.



#ce

#cs
  This Note :

  This project is Purely a

          PPPPPPPP     RRRRRRRR     OOOO   TTTTTTTTT   OOOO    TTTTTTTTT  YY    YY  PPPPPPPP   EEEEEEEE
          PP     PP    RR     RR  OO    OO    TT     OO    OO     TT      YY    YY  PP     PP  EE
          PP     PP    RR     RR  OO    OO    TT     OO    OO     TT       YY  YY   PP     PP  EE
          PPPPPPP      RRRRRRRR   OO    OO    TT     OO    OO     TT         YY     PPPPPPP    EEEEEEE
          PP           RR    RR   OO    OO    TT     OO    OO     TT         YY     PP         EE
          PP           RR     RR  OO    OO    TT     OO    OO     TT         YY     PP         EE
          PP           RR     RR   OOOO       TT      OOOO        TT         YY     PP         EEEEEEEE

    Developped with open source for restricted reason and willing to developt a better infrastructure topology to
    transform restricted area into safe access for minimalistic transsaction/interaction over finite task...

    This is not developped by team lead developped the BNC initiative of deploying wide range of minimalistic
    transactive subset over minimalistic knowledge required to operate finite set of sub-task in banking systems...

    I'm working in the I.T Administration filed to deploy safe layer of leasing-password handler to manage password
    transparently without change ourself the infratructure...

    This project is using theorical name "Kelly Services" which is purely non-intentionnal and work submitted for
    futur prototyping will propose to 3rd entity a finite answer over actual interest.

    Aka, people remembering this acsii art should at least remeber-too the place where it was left because
    previous version was not sended to any public repository !

    And There is no valid password in prototyping project sended to repository or should not contains valid password.
    And may not offense public or private security in local-infrastructure.


#ce

#include "KellyIbmEnumHandler.au3"

Func MainAppsSeqHandler ( $EnumId=$EAppsDefault, $EnumSubSeq = $EAppsSeqDefault )
  Local $STitle   = $ArrayInfo[$EnumId][$EnumSubSeq][$Etitle]
  Local $SText    = $ArrayInfo[$EnumId][$EnumSubSeq][$EText]
  Local $SClassNN = $ArrayInfo[$EnumId][$EnumSubSeq][$EClassNN]
  Local $hwnd=WinGetHandle( $STitle, $SText )
  Local $StrTitleDisplay = $ArrayInfo[$EnumId][$EnumSubSeq][$Etitle]
  If $hwnd == 0 Then
    MsgBox( 4096, "Application detection report", "The Windows Named : $StrTitleDisplay$ is absent " , 0 )
  Else
        MsgBox( 4096, "Application detection report", "The Windows Named : $StrTitleDisplay$ is present " , 0 )

  EndIf

EndFunc


#cs
  Sample of applicative test :
  Because both VpnPowerCAHandler and LotusHandler obey to same application restrictions:
    1 - Being detected with valid winget-addr
    2 - Sending Text to specific location
      They are both elligble to refactoring the code under better name to allow the
      Matrix-Unit Test Handle the login, correctly...
#ce
Func VpnPowerCAHandler( $EnumDataFieldID=$EAppsSeqLogin, $EnumId=$EAppsVPNPowerCA, $EnumSubSeq=$EAppsSeqLogin )
  Local $STitle   = $ArrayInfo[$EnumId][$EnumSubSeq][$Etitle]
  Local $SText    = $ArrayInfo[$EnumId][$EnumSubSeq][$EText]
  Local $SClassNN = $ArrayInfo[$EnumId][$EnumSubSeq][$EClassNN]
  Local $StrPasswd=$ArrayDataHeader[$EnumId][$EnumSubSeq][$EnumDataFieldID]
  Local $hwnd=WinGetHandle( $STitle, $SText )
  If $hwnd <> 0 Then
    ControlSend ( $hwnd, $SText, $SClassNN, $StrPasswd , 0 )
  EndIf
EndFunc

Func TreeLinePassword( $EnumDataFieldID=$EContentDataPwd, $EnumId=$EAppsTreeLinePass, $EnumSubSeq=$EAppsSeqLogin )
  Local $STitle     = $ArrayInfo[$EnumId][$EnumSubSeq][$Etitle]
  Local $SText      = $ArrayInfo[$EnumId][$EnumSubSeq][$EText]
  Local $SClassNN   = $ArrayInfo[$EnumId][$EnumSubSeq][$EClassNN]
  Local $StrPasswd  = $ArrayDataHeader[$EnumId][$EnumSubSeq][$EnumDataFieldID]
  Local $hwnd=WinGetHandle( $STitle, $SText )
  If $hwnd <> 0 Then
    ControlSend ( $hwnd, $SText, $SClassNN, $StrPasswd , 0 )
  EndIf
EndFunc




Func LotusHandler( $EnumDataFieldID=$EAppsSeqLogin, $EnumId=$EAppsLotus, $EnumSubSeq=$EAppsSeqLogin )
  Local $hwnd
  Local $STitle     = $ArrayInfo[$EnumId][$EnumSubSeq][$Etitle]
  Local $SText      = $ArrayInfo[$EnumId][$EnumSubSeq][$EText]
  Local $SClassNN   = $ArrayInfo[$EnumId][$EnumSubSeq][$EClassNN]
  Local $StrPasswd  = $ArrayDataHeader[$EnumId][$EnumSubSeq][$EnumDataFieldID]
  $hwnd=WinGetHandle( $STitle, $SText )
  If $hwnd <> 0 Then
    ControlSend ( $hwnd, $SText, $SClassNN, $StrPasswd , 0 )
  EndIf
  $hwnd=WinGetHandle( $STitle, $SText )

EndFunc

Func ApplicationSeqIdHandler( $EnumId=$EAppsDefault, $EnumSubSeq=$EAppsSeqLogin, $EContentDataID = $EContentDataDefault )
  Local $hwnd
  Local $ValueSend  = $ArrayDataHeader[$EnumId][$EnumSubSeq][$EContentDataID]
  Local $STitle     = $ArrayInfo[$EnumId][$EnumSubSeq][$Etitle]
  Local $SText      = $ArrayInfo[$EnumId][$EnumSubSeq][$EText]
  Local $SClassNN   = $ArrayInfo[$EnumId][$EnumSubSeq][$EClassNN]
  If $EnumSubSeq <> $EAppsSeqDetect Then
    $hwnd=WinGetHandle( $ArrayInfo[$EnumId][$EnumSubSeq][$Etitle], $ArrayInfo[$EnumId][$EnumSubSeq][$EText] )
    If $hwnd <> 0 Then
      ControlSend ( $hwnd, $SText, $ArrayInfo[$EnumId][$EnumSubSeq][$EClassNN], $ValueSend , 0 )
    EndIf
    $hwnd=WinGetHandle( $STitle, $SText )
  Else
    MsgBox( 4096, "ApplicationSeqIdHandler, $EAppsSeqDetect", "Application Sequence handler is set to $EAppsSeqDetect mode" , 0 )
  EndIf
EndFunc





#cs
  Matrix-rollup,
  This Loop will test all Entity statement being a boolean-value responsible of testing functionality
  or not .
#ce
Func TestConn()

Local $WindowsName
For $intAppsCount= 0 to $EAppsEnumSize
  For $IntSeqAppsCount = 0 To $EAppsSeqEnumSize
    $WindowsName=$ArrayInfo[$intAppsCount][$IntSeqAppsCount][$Etitle]
    MsgBox( 4096, "Windows detection annonce", "Processing Windows $WindowsName$", 0 )
    Switch $intAppsCount
        Case $EAppsVPNPowerCA, $EAppsLotus
            Switch $IntSeqAppsCount
              Case $EAppsSeqDetect
                MainAppsSeqHandler( $intAppsCount , $IntSeqAppsCount )
            EndSwitch
    EndSwitch
  Next
Next
EndFunc


Func MainGui( )

  #Region ### START Koda GUI section ### Form=E:\document\API\AutoIT\FormPasswordSenderKellyIBM.kxf
  $ArrayGuiInterface[$EGuiChildNode] = GUICtrlCreateDummy()
  $ArrayGuiInterface[$EGuiForm1] = GUICreate("User Content Management Facilities", 564, 240, 645, 289)
  GUICtrlSendToDummy ( $ArrayGuiInterface[$EGuiChildNode], GUICtrlGetState( $ArrayGuiInterface[$EGuiForm1] ) )

  $ArrayGuiInterface[$EGuiGrpHandlerSrv]        = GUICtrlCreateGroup("Kelly / IBM Password Management ", 20, 24, 513, 81)
  $ArrayGuiInterface[$EGuiLabelLabelDeclServ]   = GUICtrlCreateLabel("Services Handler Name ", 39, 66, 162, 20)
  $ArrayGuiInterface[$EGuiHandlerServNameCBBox] = GUICtrlCreateCombo("HandlerServNameCBBox", 211, 64, 214, 25)
  GUICtrlSetData($ArrayGuiInterface[$EGuiHandlerServNameCBBox], "LotusHandler|VpnPowerCAHandler|TreeLinePassword", "VpnPowerCAHandler")
  $ArrayGuiInterface[$EGuiButtonSend] = GUICtrlCreateButton("Send", 429, 64, 86, 25, $WS_GROUP)
  GUICtrlCreateGroup("", -99, -99, 1, 1)
  $ArrayGuiInterface[$EGuiButtonQuit] = GUICtrlCreateButton("Quit", 356, 144, 75, 25, $WS_GROUP)
  $ArrayGuiInterface[$EGuiButtonHelp] = GUICtrlCreateButton("Help", 436, 144, 75, 25, $WS_GROUP)
  $ArrayGuiInterface[$EGuiCompanyPic] = GUICtrlCreatePic("logotop_KellyInformatique.gif", 20, 104, 188, 76, BitOR($SS_NOTIFY,$WS_GROUP,$WS_CLIPSIBLINGS))

  $ArrayGuiInterface[$EGuiGroup1] = GUICtrlCreateGroup("Password Handler", 4, 8, 553, 201)
  GUICtrlCreateGroup("", -99, -99, 1, 1)
  $ArrayGuiInterface[$EGuiStatusBar1] = _GUICtrlStatusBar_Create($ArrayGuiInterface[$EGuiForm1])
  GUISetState(@SW_SHOW)
  #EndRegion ### END Koda GUI section ###
EndFunc

Func GuiEventSequence()

  While 1
    $ArrayGuiInterface[$EGuinMsg] = GUIGetMsg()
    $ArrayGuiInterface[$EGuiComboReadChoice] = GUICtrlRead ( $ArrayGuiInterface[$EGuiHandlerServNameCBBox] , "Combo" )

    Switch $ArrayGuiInterface[$EGuinMsg]
      Case $ArrayGuiInterface[$EGuiButtonQuit]
        ExitLoop
      Case $GUI_EVENT_CLOSE
        ExitLoop
      Case $ArrayGuiInterface[$EGuiButtonSend]
        Execute( $ArrayGuiInterface[$EGuiComboReadChoice] & "()" )

    EndSwitch
  WEnd
  Exit
EndFunc


Func _Main()

  Global $sSQliteDll = _SQLite_Startup()

  Local $IntArraySize=UBound( $ArraySeqApps )-1
  Local $StrVarExec
  For $IntCountFuncExec = 0 To $IntArraySize
    $StrVarExec=$ArraySeqApps[$IntCountFuncExec] & "()"
    ConsoleWrite( "@CRLF@Loading function: $StrVarExec$@CRLF@" )
    Execute( $StrVarExec )
  Next

  _SQLite_Shutdown ()

EndFunc

_Main()
