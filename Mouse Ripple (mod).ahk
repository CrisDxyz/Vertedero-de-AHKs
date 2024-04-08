;source: https://autohotkey.com/boards/viewtopic.php?p=49774&sid=a19281392f2727e8916d38b1f8671491#p49774
#SingleInstance,Force
#NoEnv
CoordMode Mouse, Screen
Setup()

~LButton::
	if(A_PriorHotkey = "~LButton" && A_TimeSincePriorHotkey < 5200){
		RippleVisible := False
		ShowRipple(LeftClickRippleColor)
	} else {
		ShowRipple(LeftClickRippleColor)
	}
return
;~RButton::ShowRipple(RightClickRippleColor)
~RButton::
	if(A_PriorHotkey = "~RButton" && A_TimeSincePriorHotkey < 5200){
		RippleVisible := False
		ShowRipple(RightClickRippleColor)
	} else {
		ShowRipple(RightClickRippleColor)
	}
return

Setup()
{
    Global
    RippleWinSize := 100
    RippleStep := 5
    RippleMinSize := 1
    RippleMaxSize := RippleWinSize - 20
    RippleAlphaMax := 300
    RippleAlphaStep := RippleAlphaMax // ((RippleMaxSize - RippleMinSize) / RippleStep)
    RippleVisible := False
    LeftClickRippleColor := 0xd439e6 ;0x101010 ;Win10 theme
    RightClickRippleColor := 0xffffff
    MouseIdleRippleColor := 0xffffff
    
    DllCall("LoadLibrary", Str, "gdiplus.dll")
    VarSetCapacity(buf, 16, 0)
    NumPut(1, buf)
    DllCall("gdiplus\GdiplusStartup", UIntP, pToken, UInt, &buf, UInt, 0)
    
    Gui Ripple: -Caption +LastFound +AlwaysOnTop +ToolWindow +Owner +E0x80000
    Gui Ripple: Show, NA, RippleWin
    hRippleWin := WinExist("RippleWin")
    hRippleDC := DllCall("GetDC", UInt, 0)
    VarSetCapacity(buf, 40, 0)
    NumPut(40, buf, 0)
    NumPut(RippleWinSize, buf, 4)
    NumPut(RippleWinSize, buf, 8)
    NumPut(1, buf, 12, "ushort")
    NumPut(32, buf, 14, "ushort")
    NumPut(0, buf, 16)
    hRippleBmp := DllCall("CreateDIBSection", UInt, hRippleDC, UInt, &buf, UInt, 0, UIntP, ppvBits, UInt, 0, UInt, 0)
    DllCall("ReleaseDC", UInt, 0, UInt, hRippleDC)
    hRippleDC := DllCall("CreateCompatibleDC", UInt, 0)
    DllCall("SelectObject", UInt, hRippleDC, UInt, hRippleBmp)
    DllCall("gdiplus\GdipCreateFromHDC", UInt, hRippleDC, UIntP, pRippleGraphics)
    DllCall("gdiplus\GdipSetSmoothingMode", UInt, pRippleGraphics, Int, 4)
    
    MouseGetPos _lastX, _lastY
    ;~ SetTimer MouseIdleTimer, 5000
    Return

MouseIdleTimer:
    MouseGetPos _x, _y
    if (_x == _lastX and _y == _lastY)
        ShowRipple(MouseIdleRippleColor, _interval:=20)
    else
        _lastX := _x, _lastY := _y
    Return
}

ShowRipple(_color, _interval:=20)
{
    Global
    if (RippleVisible)
    	Return
    RippleColor := _color
    RippleDiameter := RippleMinSize
    RippleAlpha := RippleAlphaMax
    RippleVisible := True

    MouseGetPos _pointerX, _pointerY
    SetTimer RippleTimer, % _interval
    Return

RippleTimer:
    DllCall("gdiplus\GdipGraphicsClear", UInt, pRippleGraphics, Int, 0)
    if ((RippleDiameter += RippleStep) < RippleMaxSize) {
        DllCall("gdiplus\GdipCreatePen1", Int, ((RippleAlpha -= RippleAlphaStep) << 24) | RippleColor, float, 3, Int, 2, UIntP, pRipplePen)
        DllCall("gdiplus\GdipDrawEllipse", UInt, pRippleGraphics, UInt, pRipplePen, float, 1, float, 1, float, RippleDiameter - 1, float, RippleDiameter - 1)
        DllCall("gdiplus\GdipDeletePen", UInt, pRipplePen)
    }
    else {
        RippleVisible := False
        SetTimer RippleTimer, Off
    }

    VarSetCapacity(buf, 8)
    NumPut(_pointerX - RippleDiameter // 2, buf, 0)
    NumPut(_pointerY - RippleDiameter // 2, buf, 4)
    DllCall("UpdateLayeredWindow", UInt, hRippleWin, UInt, 0, UInt, &buf, Int64p, (RippleDiameter + 5) | (RippleDiameter + 5) << 32, UInt, hRippleDC, Int64p, 0, UInt, 0, UIntP, 0x1FF0000, UInt, 2)
    Return
}

^r::Reload
Esc::ExitApp