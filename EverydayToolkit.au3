#include <Clipboard.au3>
#include <Array.au3>
; + = Shift / ! = Alt

HotKeySet("{PAUSE}","_Exit")

HotKeySet("^1","directToUpper")
HotKeySet("+^1","copiedToUpper")

HotKeySet("^2","directToLower")
HotKeySet("+^2","copiedToLower")

HotKeySet("^3","directSortAscending")
HotKeySet("+^3","copiedSortAscending")

HotKeySet("^4","directSortDiscending")
HotKeySet("+^4","copiedSortDiscending")

HotKeySet("^5","directSplitPattern")
HotKeySet("+^5","copiedSplitPattern")

HotKeySet("^6","directReplace")
HotKeySet("+^6","copiedReplace")

HotKeySet("^7","directStringLenght")
HotKeySet("+^7","copiedStringLenght")

HotKeySet("^8","directSearchGoogle")
HotKeySet("+^8","copiedStringLenght")

Func directToUpper()
   Send("^c")
   $selectedText = _ClipBoard_GetData()
   $newText = StringUpper($selectedText)
   _ClipBoard_SetData($newText)
   Send("^v")
EndFunc
Func copiedToUpper()
   $selectedText = _ClipBoard_GetData()
   $newText = StringUpper($selectedText)
   _ClipBoard_SetData($newText)
EndFunc

Func directToLower()
   Send("^c")
   $selectedText = _ClipBoard_GetData()
   $newText = StringLower($selectedText)
   _ClipBoard_SetData($newText)
   Send("^v")
EndFunc
Func copiedToLower()
   $selectedText = _ClipBoard_GetData()
   $newText = StringLower($selectedText)
   _ClipBoard_SetData($newText)
EndFunc

Func directSortAscending()
   Send("^c")
   $selectedText = _ClipBoard_GetData()
   $selectedText = StringReplace($selectedText,@LF,"")
   $arrayText = StringSplit($selectedText,@CR)
   _ArraySort($arrayText,0,1)
   _ArrayDisplay($arrayText)
   $newText = ""
   For $i=1 to $arrayText[0]
	  If $arrayText[$i] = "" Then ContinueLoop
	  $newText &= $arrayText[$i] & @CRLF
   Next
   _ClipBoard_SetData($newText)
   Send("^v")
EndFunc
Func copiedSortAscending()
   $selectedText = _ClipBoard_GetData()
   $selectedText = StringReplace($selectedText,@LF,"")
   $arrayText = StringSplit($selectedText,@CR)
   _ArraySort($arrayText,0,1)
   $newText = ""
   For $i=1 to $arrayText[0]
	  If $arrayText[$i] = "" Then ContinueLoop
	  $newText &= $arrayText[$i] & @CRLF
   Next
   _ClipBoard_SetData($newText)
EndFunc

Func directSortDiscending()
   Send("^c")
   $selectedText = _ClipBoard_GetData()
   $selectedText = StringReplace($selectedText,@LF,"")
   $arrayText = StringSplit($selectedText,@CR)
   _ArraySort($arrayText,1,1)
   $newText = ""
   For $i=1 to $arrayText[0]
	  If $arrayText[$i] = "" Then ContinueLoop
	  $newText &= $arrayText[$i] & @CRLF
   Next
   _ClipBoard_SetData($newText)
   Send("^v")
EndFunc
Func copiedSortDiscending()
   $selectedText = _ClipBoard_GetData()
   $selectedText = StringReplace($selectedText,@LF,"")
   $arrayText = StringSplit($selectedText,@CR)
   _ArraySort($arrayText,1,1)
   $newText = ""
   For $i=1 to $arrayText[0]
	  If $arrayText[$i] = "" Then ContinueLoop
	  $newText &= $arrayText[$i] & @CRLF
   Next
   _ClipBoard_SetData($newText)
EndFunc

Func directSplitPattern()
   Send("^c")
   $selectedText = _ClipBoard_GetData()
   $pattern = InputBox("#String Split","Insert pattern: ","\n")
   $arrayText = StringSplit($selectedText, $pattern)
   $newText = ""
   For $i=1 to $arrayText[0]
	 $newText &= $arrayText[$i] & @CRLF
   Next
   _ClipBoard_SetData($newText)
   Send("^v")
EndFunc
Func copiedSplitPattern()
   $selectedText = _ClipBoard_GetData()
   $pattern = InputBox("#String Split","Insert pattern: ","\n")
   $arrayText = StringSplit($selectedText, $pattern)
   $newText = ""
   For $i=1 to $arrayText[0]
	 $newText &= $arrayText[$i] & @CRLF
   Next
   _ClipBoard_SetData($newText)
EndFunc

Func directReplace()
   Send("^c")
   $selectedText = _ClipBoard_GetData()
   $what = InputBox("#String Replace","Insert pattern to replace: ",".")
   $with = InputBox("#String Replace","Insert pattern to inserti: ","\n")
   $newText = StringReplace($selectedText,$what,$with)
   _ClipBoard_SetData($newText)
   Send("^v")
EndFunc
Func copiedReplace()
   $selectedText = _ClipBoard_GetData()
   $what = InputBox("#String Replace","Insert pattern to replace: ",".")
   $with = InputBox("#String Replace","Insert pattern to inserti: ","\n")
   $newText = StringReplace($selectedText,$what,$with)
   _ClipBoard_SetData($newText)
EndFunc

Func directStringLenght()
   Send("^c")
   $selectedText = _ClipBoard_GetData()
   $lenght = StringLen($selectedText)
   _ClipBoard_SetData($lenght)
   MsgBox(64,"#String Lenght",$lenght)
EndFunc
Func copiedStringLenght()
   $selectedText = _ClipBoard_GetData()
   $lenght = StringLen($selectedText)
   _ClipBoard_SetData($lenght)
   MsgBox(64,"#String Lenght",$lenght)
EndFunc

Func directSearchGoogle()
   Send("^c")
   $selectedText = _ClipBoard_GetData()
   $URL = "https://www.google.it/search?q=" & $selectedText
   ShellExecute($URL)
EndFunc

Func duplicaFile()
   Send("^c")
   Send("^v")
EndFunc

Func _Exit()
   Exit 0
EndFunc

while 1
   Sleep(10)
WEnd
