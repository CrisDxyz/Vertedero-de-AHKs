#SingleInstance, force
#NoEnv

^q::

Loop{
	;40% cd active
	PixelGetColor, colour, 992, 406 ;"Slow"
	;MsgBox The color at the current cursor position is %colour%.
	if (colour = F7EF29 or colour = 29EFF7 or colour = 0xF7EF29 or colour = 0x29EFF7){
		;MsgBox, %colour% detected, script paused.
		Fight()
		MouseClick, Right, 989, 313
		PixelGetColor, colourSR, 906, 160 ;"Slow"
		Sleep, 3000 
		if (colourSR != 7C4E4E or colourSR != 0x7C4E4E){ ;si no esta en cd
			Send, r
			PixelGetColor, colourSB, 906, 160 ;"Slow"
			Sleep, 1000 ;0 ;10s
			if (colourSB != 334452 or colourSB != 0x334452){
				Send, g
				PixelGetColor, colourSB2, 963, 263 ;"Slow"
				}
				if (colourSB2 != C39494 or colourSB2 != 0xC39494){ ;si esta en cd
					Sleep, 22000 ;20s
				}
				MouseClick, Right, 1259, 311
		}
	}Else{
		;MsgBox, color diferente
		Send, {Left}
		Sleep, 50
		Send, {Right}
		Sleep, 1500
	}
}

Fight(){

	Send, z
	Sleep, 900
	Send, v
	Sleep, 900
	Send, y
	Sleep, 900
	Send, e
	Sleep, 900
	Send, t
	Sleep, 900
	Send, w
	Sleep, 900
	Send, w
	Sleep, 900
	Send, e
	;Sleep, 100
}

Return

;-Panic Button
Esc::ExitApp

;-Update script
^r::Reload
