
^w::

MouseGetPos, OutputVarX, OutputVarY
Send, {Shift Down}
Send, {LButton}
Send, {Shift Up}
Sleep 50
MouseMove (642), (831), 0 ;Dismantle
Send, {LButton}
Sleep 50
MouseMove (889), (587), 0 ;Yes
Send, {LButton}
Sleep 50
MouseMove (626), (460), 0 ;Resultado1
Send, {Shift Down}
Send, {LButton}
Send, {Shift Up}
Sleep 50
MouseMove (628), (577), 0 ;Resultado2
Send, {Shift Down}
Send, {LButton}
Send, {Shift Up}
Sleep 50
MouseMove (OutputVarX), (OutputVarY), 0
Sleep 50
Return

