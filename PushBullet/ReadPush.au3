#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <String.au3>

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Form1", 189, 77, 422, 151)
$btn = GUICtrlCreateButton("btn", 8, 8, 169, 57)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

;Impostazioni
$access_token = ""

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		 case $btn
			;_PushBullet()
			;_Send()
			_RemoteControl()
	EndSwitch
WEnd

Func _PushBullet($pTitle = "", $pMessage = "")
	$oHTTP = ObjCreate("WinHTTP.WinHTTPRequest.5.1")
	;$access_token = $PushBullettoken
	$oHTTP.Open("Get", "https://api.pushbullet.com/v2/devices", False)
	$oHTTP.SetCredentials($access_token, "", 0)
	$oHTTP.Send()
	$Result = $oHTTP.ResponseText
	Local $device_iden = _StringBetween($Result, 'iden":"', '"')
	Local $device_name = _StringBetween($Result, 'nickname":"', '"')
	MsgBox(0,"","Fatto")
 EndFunc   ;==>_PushBullet

 Func _Send()
   $sPD = '{"type": "note", "title": "FUNGE", "body": "LOL"}'
			   $oHTTP = ObjCreate("winhttp.winhttprequest.5.1")
			   $oHTTP.Open("POST", "https://api.pushbullet.com/v2/pushes", False)
			   $oHTTP.setRequestHeader("Authorization", "Bearer " & $access_token)
			   $oHTTP.SetRequestHeader("Content-Type", "application/json")
			   $oHTTP.Send($sPD)
			   MsgBox(0,"","Inviato")
EndFunc

Func _RemoteControl()
	$oHTTP = ObjCreate("WinHTTP.WinHTTPRequest.5.1")
	;$access_token = $PushBullettoken
	$oHTTP.Open("Get", "https://api.pushbullet.com/v2/pushes?active=true&limit=3", False)
	$oHTTP.SetCredentials($access_token, "", 0)
	$oHTTP.SetRequestHeader("Content-Type", "application/json")
	$oHTTP.Send()
	$Result = $oHTTP.ResponseText
	;MsgBox(0,"",$Result)

	If StringInStr(StringLower($Result), '"body":"come stai') Then
		 $sPD = '{"type": "note", "title": "", "body": "io bene e tu"}'
			$oHTTP = ObjCreate("winhttp.winhttprequest.5.1")
			$oHTTP.Open("POST", "https://api.pushbullet.com/v2/pushes", False)
			$oHTTP.setRequestHeader("Authorization", "Bearer " & $access_token)
			$oHTTP.SetRequestHeader("Content-Type", "application/json")
			$oHTTP.Send($sPD)
	  EndIf
EndFunc   ;==>_RemoteControl