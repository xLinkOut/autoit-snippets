#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <String.au3>

$Push = GUICreate("Push", 234, 100, 192, 124)
$titlebox = GUICtrlCreateInput("Titolo...", 8, 8, 217, 21)
$messagebox = GUICtrlCreateInput("Messaggio...", 8, 40, 217, 21)
$send = GUICtrlCreateButton("Send", 8, 70, 217, 25)
GUISetState(@SW_SHOW)

;Program Settings
$AccessToken = ""

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		 Case $send
			;_Send()
			_PushFile()
	EndSwitch
 WEnd

Func _Send()
   $title = GUICtrlRead($titlebox)
   $message = GUICtrlRead($messagebox)
   $sPD = '{"type": "note", "title": "' & $title & '", "body": "' & $message & '"}'
			   $oHTTP = ObjCreate("winhttp.winhttprequest.5.1")
			   $oHTTP.Open("POST", "https://api.pushbullet.com/v2/pushes", False)
			   $oHTTP.setRequestHeader("Authorization", "Bearer " & $AccessToken)
			   $oHTTP.SetRequestHeader("Content-Type", "application/json")
			   $oHTTP.Send($sPD)
			EndFunc


Func _PushFile();($File, $Folder, $FileType, $title, $body)
	;If StringStripWS(GUICtrlRead($inppushuser), 3) <> "" Then $Title = "[" & StringStripWS(GUICtrlRead($inppushuser), 3) & "] " & $Title
	$oHTTP = ObjCreate("WinHTTP.WinHTTPRequest.5.1")
	;$access_token = $PushBullettoken
	$oHTTP.Open("Post", "https://api.pushbullet.com/v2/upload-request", False)
	$oHTTP.SetCredentials($AccessToken, "", 0)
	$oHTTP.SetRequestHeader("Content-Type", "application/json")

	Local $pPush = '{"file_name": "a.png", "file_type": "image/png"}'
	$oHTTP.Send($pPush)
	$Result = $oHTTP.ResponseText
	;MsgBox(0,"",$Result)
	$Result1 = $Result
	Local $upload_url = _StringBetween($Result, 'upload_url":"', '"')
	Local $awsaccesskeyid = _StringBetween($Result, 'awsaccesskeyid":"', '"')
	Local $acl = _StringBetween($Result, 'acl":"', '"')
	Local $key = _StringBetween($Result, 'key":"', '"')
	Local $signature = _StringBetween($Result, 'signature":"', '"')
	Local $policy = _StringBetween($Result, 'policy":"', '"')
	Local $file_url = _StringBetween($Result, 'file_url":"', '"')
	MsgBox(0,"",$policy)

   If IsArray($upload_url) And IsArray($awsaccesskeyid) And IsArray($acl) And IsArray($key) And IsArray($signature) And IsArray($policy) Then
		 $Result = RunWait(@ScriptDir & "\curl.exe -i -X POST " & $upload_url[0] & ' -F awsaccesskeyid="' & $awsaccesskeyid[0] & '" -F acl="' & $acl[0] & '" -F key="' & $key[0] & '" -F signature="' & $signature[0] & '" -F policy="' & $policy[0] & '" -F content-type="' & "image/png" & '" -F file=@"' & @ScriptDir & '" -o "' & @ScriptDir & '\curl.log"', "", @SW_HIDE)
		 MsgBox(0,"",$Result & $upload_url[0] & $acl[0] & $key[0] & $signature[0] & $policy[0] & $awsaccesskeyid[0] & $file_url[0] & $Result1 & @ScriptDir & "\curl\curl.exe -i -X POST " & $upload_url[0] & ' -F awsaccesskeyid="' & $awsaccesskeyid[0] & '" -F acl="' & $acl[0] & '" -F key="' & $key[0] & '" -F signature="' & $signature[0] & '" -F policy="' & $policy[0] & '" -F content-type="' & "image/png" & '" -F file=@"' & '" -o "' & @ScriptDir & '\curl.log"')
   EndIf
EndFunc