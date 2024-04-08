
+u::

Send, ^n
Sleep 100
Send, {Raw}about:unloads
Send, {Enter}
Sleep 500

MouseMove (902), (401), 0
clicks()
Sleep 250
Send, {Alt Down}{F4}{Alt Up}

clicks() {
i=1
Loop{
	Sleep 5
	Send, {LButton}
	i++
	;MsgBox, 'i++' %i%
	if(i>20){
		Break
		}
	}
}

;MsgBox, 'Páginas descargadas de memoria.'