#SingleInstance, force

^q::OpenWebsite()

OpenWebsite(){

WinGetActiveTitle, TituloVentana
if TituloVentana contains [REDACTED]
{
	Sleep 12
	;MsgBox, TituloVentana (%TituloVentana%) %var1% Found.
}
Else 
{
	if WinExist("ahk_class MozillaWindowClass")
	{
		WinActivate
		;MsgBox, Window activated.
		WinGetActiveTitle, TituloVentanaLoop
		Loop
		{
			if TituloVentanaLoop contains [REDACTED]
			{
				Break
			}
			Else
			{
				;MsgBox, Window not found!
				Send {LCtrl Down}{PgDn}{LCtrl Up}
				WinGetActiveTitle, TituloVentanaLoop 
			}
		}
	}
	Else
	{
	;MsgBox, TituloVentana (%TituloVentana%) Not Found.
	try{
	Run "[PATH]\firefox.exe" https://[REDACTED]/ , max
	}
	Catch{
	MsgBox, Could not find firefox.exe installed.
	}
	}
}

/*VPN
[REDACTED]
*/

Sleep 2000
try{
	PixelGetColor, ColorActivo, 344, 365
	If (ColorActivo=0x5A5A5A)
	{
	MsgBox, Colors (%ColorActivo%) match.
	MouseMove, 344, 365
	Send {LButton}
	}
	Else 
	{
	Sleep 1
	;MsgBox, Colors (%ColorActivo%) dont match.
	}
	
	}Catch{
	MsgBox, "Could not get ("%ColorActivo%") hex values".
}


}

^w::[REDACTED]

[REDACTED](){

InputBox, nLoop, [REDACTED], Numero, , 180, 130
if ErrorLevel
    MsgBox, CANCEL was pressed.
else
    MsgBox, You entered "%nLoop%"

MouseMove, 1298, 494
Send {RButton}
Sleep 103
MouseMove, 1310, 524
Send {LButton}

x:=1

While (nLoop>x)
{
	MsgBox, %x%
	mpy:=85*x
	MsgBox, %mpy%
	MouseMove, 1298, (494+mpy)
	Send {RButton}
	Sleep 117
	MouseMove, 1310, (524+mpy)
	Send {LButton}
	Sleep 120
	x++
	;MsgBox, x=x+1= %x%
	if x=4
	{
		Send {PgDn}
	}
}
/*
Send {LCtrl Down}{PgDn}{LCtrl Up} 
Sleep 2000
Send {End}

MouseMove, 820, 709
Send {LButton}

MouseMove, 820, 795
Send {LButton}

MouseMove, 946, 873
Sleep 1000
Send {LButton}

Loop, nLoop
{
	Send {LCtrl Down}{PgUp}{LCtrl Up}
}
*/
}

Sleep 10