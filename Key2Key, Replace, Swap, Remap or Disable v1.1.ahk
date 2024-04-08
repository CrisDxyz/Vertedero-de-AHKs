
;down arrow as 'ctrl+z'
Down::
Send, ^z
return

;shift key as 'Z'
z::
Send, {Shift Down}
KeyWait, z
Send, {Shift Up}
return

;Remap or swap keys
a::b
b::a
return

;Disable Right Windows button
RWin::Return

;Create a context menu button
q::AppsKey