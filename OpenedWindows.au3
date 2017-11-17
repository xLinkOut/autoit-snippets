$aWindows = WinList()
For $i=1 To $aWindows[0][0]

    ; skip windows without a title
    If $aWindows[$i][0] = '' Then ContinueLoop

    ;use the HWND to get the state of the window
    $iWndState =  WinGetState($aWindows[$i][1])

    ; here you could filter out the windows you don't want to modify
    ConsoleWrite($aWindows[$i][0] & ': ')
    If BitAND($iWndState,1) = 1 Then ConsoleWrite(' exists')
    If BitAND($iWndState,2) = 2 Then ConsoleWrite(' visible')
    If BitAND($iWndState,4) = 4 Then ConsoleWrite(' enabled')
    If BitAND($iWndState,8) = 8 Then ConsoleWrite(' active')
    If BitAND($iWndState,16) = 16 Then ConsoleWrite(' minimised')
    If BitAND($iWndState,32) = 32 Then ConsoleWrite(' maximised')
    ConsoleWrite(@CRLF)
Next