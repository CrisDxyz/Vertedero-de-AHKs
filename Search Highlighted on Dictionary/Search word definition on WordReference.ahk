
;#SingleInstance, force

+s::

Send, {Ctrl Down}
Send, {c}
Send, {Ctrl Up}

;En caso de tener ya una pestana abierta

;MsgBox, %counter% 'inicio'
;MsgBox, (%counter% > 0)

if (counter > 0)
	{
		WinActivate
		;MsgBox, Window activated.
		WinGetActiveTitle, TituloVentanaLoop
		;MsgBox, 'Ventana activa: ' %TituloVentanaLoop%
		Loop
		{
			if TituloVentanaLoop contains WordReference
			{
				;MsgBox, 'Found! '
				Send, {Ctrl Down}
				Send, {Del}
				Send, {v}
				Send, {Ctrl Up}
				Send, {Enter}
				Arreglo := []
				Break
			}
			if Arreglo[1] == TituloVentanaLoop {
				counter = 0
				Arreglo := []
				Break
			}
			;MsgBox, %TituloVentanaLoop% 'y' %Inicio%
			Else
			{
				Arreglo.Push(TituloVentanaLoop)
				;MsgBox, 'Window not found!'
				Send {LCtrl Down}{PgDn}{LCtrl Up}
				WinGetActiveTitle, TituloVentanaLoop
				Valor := Arreglo[1]
				;MsgBox % Arreglo[1]
				;MsgBox % Valor
				;MsgBox, %TituloVentanaLoop% 'Ventana obtenida en pgup'
			}
		}
	}

;Desde aqui se parte de cero


if (counter != 1){

Send, {Ctrl Down}
Send, {t}
Send, {Ctrl Up}

Send, {Raw}www.wordreference.com/definition/
Send, {Enter}
Sleep 750

Send, {Ctrl Down}
Send, {v}
Send, {Ctrl Up}

Send, {Enter}

counter = 1
aux = 1
Inicio = '<'
Arreglo := []
;MsgBox % Arreglo[1]
;MsgBox {Arreglo[1]} 'Arreglo 1' {Valor} 'Valor'
;MsgBox, %counter% 'final'

}


