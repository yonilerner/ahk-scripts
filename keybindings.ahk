#Include <headers>

SetKeyDelay -1

; Win-> :: End
#Right::
   SendInput {End}
return

; Win<- :: Home
#Left::
   SendInput {Home}
return

; Shift+Win-> :: Shift+End
#+Right::
   SendInput {ShiftDown}{End}{ShiftUp}
return

; Shift+Win<- :: Shift+Home
#+Left::
   SendInput {ShiftDown}{Home}{ShiftUp}
return

; Win+Delete :: Delete Line
#BackSpace::
   SendInput {End} ; Skip to end of line
   ; Select all the way to beginning of line, including whitespace,
   ; then hit Left once to select the last character on the previous line
   ; this makes sure to select both the entire line and the line ending char, if there is text,
   ; as well as *only* the line ending char if there is no text
   SendInput {ShiftDown}{Home 2}{Left}{ShiftUp}
   SendInput {Delete} ; Delete selection
   SendInput {Right} ; Reposition to the line that was just deleted (eg. the new position will be on the line below that which you just deleted)
return
