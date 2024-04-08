
clicks() {
i=1
Loop{
	Sleep 5
	Send, {LButton}
	i++
	if(i>20){
		Break
		}
	}
}

+c::

MouseMove (759), (200), 0 
clicks()
MouseMove (1130), (200), 0 
clicks()
MouseMove (759), (320), 0 
clicks()
MouseMove (1130), (320), 0 
clicks()
MouseMove (759), (440), 0 
clicks()
MouseMove (1130), (440), 0 
clicks()

+z::
clicks()


