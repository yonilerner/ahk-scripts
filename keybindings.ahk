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
   SendInput {End}
   SendInput +{Home 2}{Delete 2}
return

