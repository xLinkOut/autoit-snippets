#include <GUIConstantsEx.au3>

Opt("TrayOnEventMode", 1) ; Use event trapping for tray menu
Opt("TrayMenuMode", 3) ; Default tray menu items will not be shown.

$hTray_Show_Item = TrayCreateItem("Hide")
TrayItemSetOnEvent(-1, "To_Tray")
TrayCreateItem("")
TrayCreateItem("Exit")
TrayItemSetOnEvent(-1, "On_Exit")

; Use the Autoit window as a parent to prevent appearing on the taskbar
$hGUI = GUICreate("Test", 200, 200, 200, 200, Default, Default, WinGetHandle(AutoItWinGetTitle()))
GUISetState()

While 1
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            Exit
        Case $GUI_EVENT_MINIMIZE
            To_Tray()
    EndSwitch
WEnd

Func To_Tray()

    If TrayItemGetText($hTray_Show_Item) = "Hide" Then
        GUISetState(@SW_HIDE, $hGUI)
        TrayItemSetText($hTray_Show_Item, "Show")
    Else
        GUISetState(@SW_SHOW, $hGUI)
        GUISetState(@SW_RESTORE, $hGUI)
        TrayItemSetText($hTray_Show_Item, "Hide")
    EndIf

EndFunc

Func On_Exit()
    Exit
EndFunc