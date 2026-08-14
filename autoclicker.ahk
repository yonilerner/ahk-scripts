#SingleInstance Force
#NoEnv

Clicking := false

^+a::
    Clicking := !Clicking
    if (Clicking) {
        SetTimer, DoClick, 500 ; 1000ms / 2 = 500ms
    } else {
        SetTimer, DoClick, Off
    }
return

DoClick:
    Click
return
