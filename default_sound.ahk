#Include <headers>

; Turns out this name/subtitle thing isnt necessary since I can rename items in Sound
; find_row_with_name(name, subtitle) {
;   ControlGet, items, List,, SysListView321, Sound
;   Loop, Parse, items, `n  ; Rows are delimited by linefeeds (`n).
;   {
;     parsed := StrSplit(A_LoopField, "`t")
;     if parsed[1] = name and parsed[2] = subtitle
;       return A_Index
;   }
; }
; found := find_row_with_name("Speakers", "High Definition Audio Device")

; FindString doesnt work, always returns 1???
; find_row_with_name(name) {
;   ControlGet item, FindString, "zzzzzzzzzzzzz", SysListView321, Sound
;   return item
; }

find_row_with_name(name) {
  ControlGet, items, List,, SysListView321, Sound
  Loop, Parse, items, `n  ; Rows are delimited by linefeeds (`n).
  {
    parsed := StrSplit(A_LoopField, "`t")
    if parsed[1] = name {
      return A_Index
    }
  }
}

focus_list() {
  ControlFocus, SysListView321, Sound
}

select_list_item(index) {
  index := index - 1
  ControlSend, SysListView321, {Home}{Down %index%}, Sound
}

open_sound() {
  win := WinExist("Sound")
  if !win {
    Run, mmsys.cpl ; Sound control panel
    WinWait, Sound
    return true
  }
  return false
}

select_item_by_name(name) {
  needed_open := open_sound()
  focus_list()
  select_list_item(find_row_with_name(name))
  ControlClick, &Set Default, Sound
  if needed_open {
    ControlClick, OK
  } else {
    ControlClick, &Apply
  }
}

select_item_by_name("Speakers")
using_speakers = true

; TODO Select accompanying mic. Handle speakermic also
^!s::
  using_speakers := !using_speakers
  if !using_speakers {
    select_item_by_name("RazerHeadset")
  } else {
    select_item_by_name("Speakers")
  }
return