#SingleInstance,Force
SetWinDelay, -1
CoordMode, Mouse, Screen

CircleSize := 75
Gui, -Caption +Hwndhwnd +AlwaysOnTop +ToolWindow +E0x20 ;+E0x20 click thru
Gui, Color, c00FF00 ;c00FF00 dark green ;cFFFF00 hex code yellow
Gui, Show, x0 y-%CircleSize% w%CircleSize% h%CircleSize% NA, ahk_id %hwnd%
WinSet, Transparent, 50, ahk_id %hwnd%
WinSet, Region, 0-0 w%CircleSize% h%CircleSize% E, ahk_id %hwnd%
SetTimer, Circle, 1
return

Circle:
MouseGetPos, X, Y
X -= CircleSize / 2 - 3
Y -= CircleSize / 2 - 2
WinMove, ahk_id %hwnd%, , %X%, %Y%
WinSet, AlwaysOnTop, On, ahk_id %hwnd%
return

^r::Reload
Esc::ExitApp