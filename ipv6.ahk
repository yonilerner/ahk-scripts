toggle = true
^!n::
  toggle := !toggle

  if toggle
    Run nvspbind /d "Ethernet 2" ms_tcpip6
  Else
    Run nvspbind /e "Ethernet 2" ms_tcpip6
return