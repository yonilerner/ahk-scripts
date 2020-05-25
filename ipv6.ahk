#Include <headers>
#Include <elevate-admin>

toggle = true
^!n::
  toggle := !toggle

  elevate_admin()

  command := "-NetAdapterBinding -Name '*' -ComponentID ms_tcpip6"
  if toggle
    command := "Enable" . command
  Else
    command := "Disable" . command
  
  Run, powershell -Command %command%
  MsgBox % toggle ? "Enabled!" : "Disabled"
return