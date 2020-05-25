; Make sure that we always start with the first item
Run,mmsys.cpl ; Sound control panel
WinWait,Sound
ControlSend,SysListView321,{Down 1}
ControlClick,&Set Default
ControlClick,OK

toggle = true

^!s::
  toggle := !toggle
  Run,mmsys.cpl ; Sound control panel
  WinWait,Sound

  if toggle
    ControlSend,SysListView321,{Down 1}
  Else
    ControlSend,SysListView321,{Down 2}

	ControlClick,&Set Default
  ControlClick,OK
return