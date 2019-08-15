﻿#SingleInstance force
#InstallKeybdHook

; For use on Ducky
Launch_App2::
send {Media_Play_Pause}
return

^Volume_down::
send {Media_Previous}
return

^Volume_up::
send {Media_Next}
return



<^>^x::
send ×
return


<^>^l::
send Ł
return


^Space::
  if WinActive("ahk_class Notepad++") {
  
  Send {U+00A0} ; non-breaking space
  }
return





; Paste new line below current line
^NumpadEnter::
send {End}
send {Enter}
send ^v
return





; Closer Arrow Keys
; =================
LShift & RShift::
send {Up}
return

LShift & RControl::
send {Right}
return

LShift & RWin::
send {Left}
return

LShift & AppsKey::
send {Down}
return

; =======================


~LControl::return

~RControl::
;400 is the maximum allowed delay (in milliseconds) between presses.

if (A_PriorHotKey = "~LControl" AND A_TimeSincePriorHotkey < 400)
{

input, var, L3

; Heading styles 1-5

  if (var = 003)  { 
    Send ^!1
  }
  if (var = 004)  { 
    Send ^!2 
  }
  if (var = 005)  { 
    Send ^!3 
  }
  if (var = 006)  {
    Send ^!4 
  }
  if (var = 023)  { 
    Send ^!5 
  }


; Word: accept selected change  (You need to configure Word to have the Control+Shift+Alt+F12 = "acceptSelectedChange"
  if (var = 031)  {
    Send ^+!{F12}
  }




  if (var = 007)  {
    Send {Media_Prev}
  }

  if (var = 008)  {
    Send {Media_Play_Pause}
  }

  if (var = 009)  {
    Send {Media_Stop}
  }

  if (var = 010)  {
     Send {Media_Next}
  }

  if (var = 032)  {
    send ^99
  }

  if (var = 013)  {
     Send {Volume_Mute} 
  }

  if (var = 014)  {
    SoundSet, -5
  }

  if WinActive("ahk_exe OUTLOOK.EXE") {
    if (var = 019)  {
      Send ^{F11}  ; turn off "TODO" flag
      Send ^{F12}  ; turn on "Done" flag
    }
  }
  
  if (var = 015)  {
     SoundSet, +5
  }

  if WinActive("ahk_exe OUTLOOK.EXE") {
      if (var = 039)  {
         Send ^{F11} && 
     }
  }
  

  if (var = 001)  {
    MouseGetPos, MouseX, MouseY
    PixelGetColor, color, %MouseX%, %MouseY%
    MsgBox, 36 ,,The color at the current cursor position is %color%. `n`nCopy it to the clipboard?
    ifMsgBox Yes  
        clipboard := color
    
    
  }   
  ; Msgbox,Quad press detected.
}

Sleep 0
KeyWait Ctrl
return