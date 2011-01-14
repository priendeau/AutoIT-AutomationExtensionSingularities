#include-once
; Active Directory Function Library. Include this to allow access to Active Directory Functions

; Author : maxiste deams, patrick riendeau, rheault etccy
; Email : priendea@ca.ibm.com, maxistedeams@gmail.com
; Version : 0.01alpha-brthy

#include <INet.au3>
#include <SQLite.au3>
#Include <Array.au3>

#cs
  Content

  This is a tiny complement to integration of AdoDB to commonly add Ldap, ActiveDirectory
  Object from AutoIT definition, which can be updated frequently, I offer this Wrapper loader
  which Download adfunction.au3 and load-it automatically...

  This is also reserved for automation test over wide range of implemented strutures...

#ce

AutoItSetOption ( "ExpandVarStrings"  , 1 )
AutoItSetOption ( "GUICloseOnESC"     , 1 )
AutoItSetOption ( "GUIResizeMode"     , 1024 )
AutoItSetOption ( "MouseCoordMode"    , 0 )
AutoItSetOption ( "MustDeclareVars"   , 1 )
AutoItSetOption ( "PixelCoordMode"    , 0 )
AutoItSetOption ( "WinWaitDelay"      , 1250 )
AutoItSetOption ( "GUIOnEventMode"    , 1 )
AutoItSetOption ( "WinTextMatchMode"  , 1 )
AutoItSetOption ( "WinTitleMatchMode" , 4 )

Global $UpdateLDAPInclude="http://www.autoitscript.com/forum/files/download/66-adfunctionsau3-active-directory-functions/adfunctions.au3"




Local $ArrayRegAdo[1]=[ 0 ]

Func LoadAdoDbList( ByRef $ArrayRegAdo , $StrRegScan="HKEY_CLASSES_ROOT", $StreamRegExpScan="(?i)^ADO[DRXM][DB]?" )
  Local $StrRegResult, $IsRegMatch = 0
  For $i= 1 to 10000
    $StrRegResult = RegEnumKey( $StrRegScan, $i)
    If @error <> 0 then
      ExitLoop
    EndIf
    $IsRegMatch=StringRegExp( $StrRegResult, $StreamRegExpScan, 0 )
    If $IsRegMatch == 1 Then
      _ArrayAdd( $ArrayRegAdo, $StrRegResult )
    EndIf
  Next
  Local $IntRegExpEntry=Number( UBound( $ArrayRegAdo, 1) ) -1
  ConsoleWrite("Ado Registry, for ActiveDirectory integration return $IntRegExpEntry$@CRLF@")
EndFunc

Func AdoDbActiveIntegrationLoader( ByRef $ArrayRegAdo )
  Local $ArrayObjAdoObject[ UBound( $ArrayRegAdo, 1) - 1 ]
  Local $IntAdoResultLen = Number( UBound( $ArrayRegAdo, 1) ) -1

  For $IntItemLoad = 0 To $IntAdoResultLen
    ConsoleWrite("Pre-Loading Ado Object: " & $ArrayRegAdo[$IntItemLoad] & "@CRLF@" )
    ObjCreate( $ArrayRegAdo[$IntItemLoad] )
  Next
EndFunc


Func GetLdapAutoITAP( $StreamFile, $StrFileNameLdapDef = "adfunctions.au3" , $EDefaultMote = 2, $StrPathDef="E:\document\API\AutoIT" )
  Local $FHandler,$IntRetFile,$StrIncludeHeader, $IntRetFile, $StreamFileLocation, $IsFileExist
  $StreamFileLocation=$StrPathDef & "\" &  $StrFileNameLdapDef
  $IsFileExist= FileExists( $StreamFileLocation )

  If $IsFileExist <> 1 Then
    $FHandler=FileOpen ( $StrFileNameLdapDef , $EDefaultMote  )
    $IntRetFile=FileWrite ( $FHandler, _INetGetSource( $UpdateLDAPInclude ) )
    $StrIncludeHeader="#include  <$StrFileNameLdapDe$>"
    FileClose( $FHandler )
  Else
    ConsoleWrite( "ManagementLib@CRLF@@TAB@No need to update definition, already downloaded, file$StreamFileLocation$: @CRLF@@CRLF@" )
  EndIf

  If $IntRetFile <> 0 Then
    ConsoleWrite( "ManagementLib@CRLF@@TAB@Successfully received new update of file $StreamFileLocation$@CRLF@" )
    Execute( $StrIncludeHeader )
  Else
    ConsoleWrite("ManagementLib@CRLF@@TAB@Did not transfert file $StrFileNameLdapDef$ for communication problems.@TAB@" )
  EndIf
EndFunc

LoadAdoDbList( $ArrayRegAdo )
AdoDbActiveIntegrationLoader( $ArrayRegAdo )
GetLdapAutoITAP( $UpdateLDAPInclude )








