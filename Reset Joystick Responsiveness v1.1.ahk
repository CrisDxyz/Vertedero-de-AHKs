#SingleInstance Force

Down() {
i=1
Loop{
	Sleep 5
	Send, {Down}
	i++
	;MsgBox, 'i++' %i%
	if(i>6){
		Break
		}
	}
}

F1::
Send, #d
MouseGetPos, OutputVarX, OutputVarY
Sleep 20
MouseMove (0), (0), 0
Send, {LeftClick}
MouseMove (OutputVarX), (OutputVarY), 0
ControlSend SysListView321,USB Joystick.lnk,A
Send, {AppsKey}
Down()
Send, {Enter}
sleep 550
MouseMove (313), (256), 0
MouseClick, left, 313, 256
Sleep 200
Send, {Enter}
Sleep 25
Send, {Esc}
MouseMove (OutputVarX), (OutputVarY), 0
return

^r::Reload
^e::Edit

