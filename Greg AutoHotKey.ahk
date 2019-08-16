#SingleInstance force
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



# Both control keys + x == multiplication sign
<^>^x::
send ×
return



; To be able to write Łs, in order to address your colleague from Poland correctly.
<^>^l::
send Ł
return





; Add the ability to insert non-breaking spaces in Notepad++ (in the same way that MSWord does it)
^Space::
  if WinActive("ahk_class Notepad++") {
  
  Send {U+00A0} ; non-breaking space
  }
return




; Ctrl+Windows+X and Ctrl+Windows+C cuts/copies straight to plain text.
^#x::
^#c::                            ; Text-only cut/copy to ClipBoard
   Clip0 = %ClipBoardAll%
   ClipBoard =
   StringRight x,A_ThisHotKey,1  ; C or X
   Send ^%x%                     ; For best compatibility: SendPlay
   ClipWait 2                    ; Wait for text, up to 2s
   If ErrorLevel
      ClipBoard = %Clip0%        ; Restore original ClipBoard
   Else
      ClipBoard = %ClipBoard%    ; Convert to text
   VarSetCapacity(Clip0, 0)      ; Free memory 
Return










; Paste new line below current line (cursor can be anywhere on the line above)
^NumpadEnter::
send {End}
send {Enter}
send ^v
return





; Make use of the keys under the Return key to have Closer Arrow Keys, to save those valuable milliseconds moving from the home row to the arrow buttons
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




; =======================
; This final section to the end will only work with Delvin RapidAccess keyboards. If you aren't using one, ignore this section
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
