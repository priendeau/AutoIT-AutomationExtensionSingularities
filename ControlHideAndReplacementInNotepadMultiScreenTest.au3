
#cs

    Test : Studying comportement of alterated componnent from MS-Windows based application despite offering
    fast and efficient control alternative behavioring :


    Description of COMponnent :

    The following application ( notepad.exe ), will hold diferrent Control, named EditN to be show upon trigger-enabled
    implemented information within it's own menu to compare the edging implementation of program based multi-area edition
    weight and notepad altered from memory assignation of elements thru accessor like superposition of interaction which is
    memory similar without holding finite source-code...

    This will be presented with gitHub Diff, superposition of not-working subset into working set.
    Which is normal to represent what is not "convenable" for application memory-management and what's it
    std. for memory... Hooking will be used as simple redirector, which it normal MSDN uses of some dll-link-call
    function....

#ce

Local $CtrlHwndNew,  $CtrlHwndOld, $CtrlCopy
$CtrlHwndOld = ControlGetHandle( "Untitled - Notepad", "", "Edit1" )
Local $TagRectRegionOld = _WinAPI_GetWindowRect( $CtrlHwndOld )

Local $IntLeft,$IntTop,$IntRight,$IntBottom

$IntLeft=DllStructGetData($TagRectRegionOld, "Left" )
$IntTop=DllStructGetData($TagRectRegionOld, "Top" )
$IntRight=DllStructGetData($TagRectRegionOld, "Right" )
$IntBottom=DllStructGetData($TagRectRegionOld, "Bottom" )
$CtrlHwndNew=GUICtrlCreateEdit( "Test 123",  $IntLeft, $IntTop, ($IntRight-$IntLeft), ($IntBottom-$IntTop) , -1, -1 )
ControlHide("Untitled - Notepad", "", "Edit1")
$CtrlCopy=

Sleep( 5000 )
ControlShow("Untitled - Notepad", "", "Edit1")
