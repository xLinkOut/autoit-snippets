#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

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
			_Send()
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