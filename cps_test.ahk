#SingleInstance Force
#NoEnv
SetBatchLines -1

ClickCount := 0
TestRunning := false
TimeLeft := 0
TestDuration := 30 ; seconds

Gui, Font, s14
Gui, Add, Text, w300 Center vInfoText, Click the button as fast as you can!
Gui, Font, s20 Bold
Gui, Add, Button, w300 h80 gClickButton vClickBtn, Start
Gui, Font, s16 Normal
Gui, Add, Text, w300 Center vTimerText, Time: --
Gui, Add, Text, w300 Center vCountText, Clicks: 0
Gui, Font, s24 Bold
Gui, Add, Text, w300 Center vCpsText cBlue, CPS: --
Gui, Show, , CPS Test
return

ClickButton:
    if (!TestRunning) {
        ; Start the test
        TestRunning := true
        ClickCount := 0
        TimeLeft := TestDuration
        GuiControl,, ClickBtn, CLICK!
        GuiControl,, InfoText, GO! Click as fast as you can!
        GuiControl,, CountText, Clicks: 0
        GuiControl,, TimerText, % "Time: " TimeLeft "s"
        GuiControl,, CpsText, CPS: --
        SetTimer, UpdateTimer, 1000
    } else {
        ; Count the click
        ClickCount++
        GuiControl,, CountText, % "Clicks: " ClickCount
        cps := Round(ClickCount / (TestDuration - TimeLeft + 0.001), 1)
        GuiControl,, CpsText, % "CPS: " cps
    }
return

UpdateTimer:
    TimeLeft--
    if (TimeLeft <= 0) {
        SetTimer, UpdateTimer, Off
        TestRunning := false
        finalCps := Round(ClickCount / TestDuration, 2)
        GuiControl,, TimerText, Time: 0s
        GuiControl,, CpsText, % "CPS: " finalCps
        GuiControl,, ClickBtn, Start Again
        GuiControl,, InfoText, % "Done! " ClickCount " clicks in " TestDuration "s"
    } else {
        GuiControl,, TimerText, % "Time: " TimeLeft "s"
    }
return

GuiClose:
    ExitApp
