#Requires AutoHotkey v2.0
SetCapsLockState "AlwaysOff"

^[::send "{Esc}"

LCtrl & j::send "^{PgDn}"
LCtrl & k::send "^{PgUp}"


DetectHiddenWindows "On"
WinExistCheck(Title, Path) {
    if WinExist(Title) {
        WinActivate
    } else {
        Run(Path)
    }
}




!w:: WinExistCheck("Firefox", "C:\Program Files\Mozilla Firefox\firefox.exe")
;!w:: WinExistCheck("Zen Browser", "C:\Program Files\Zen Browser\zen.exe")
!m:: winExistCheck("thunderbird", "c:\program files\mozilla thunderbird\thunderbird.exe")
;!t:: WinExistCheck("Terminal", "C:\Users\" A_UserName "\AppData\Local\Microsoft\WindowsApps\wt.exe")
!t:: {
    WinExistCheck("Terminal", "C:\Users\" A_UserName "\AppData\Local\Microsoft\WindowsApps\wt.exe")
    
    ; Check if the current input language is not English (0x0409)
    InputLang := DllCall("GetKeyboardLayout", "UInt", DllCall("GetWindowThreadProcessId", "UInt", WinActive(), "UInt"), "UInt")
    if (InputLang != 0x0409) {
        ; Switch to English input
        PostMessage(0x50, 0, 0x0409, , "A")
    }
}
!e:: WinExistCheck("ahk_class CabinetWClass", "C:\WINDOWS\explorer.exe")

;RShift & LShift::Capslock
;lshift & rshift::capslock
;Capslock::Ctrl
;LCtrl::Return
;#HotIf GetKeyState('CapsLock', 'P')
;;CapsLock::Send "{Esc}"
;[::send "{Esc}"
;k::Up
;j::Down
;h::Left
;l::Right
;; this work well
;;h::send "#^{Left}"
;;l::send "#^{Right}"
;'::Send("+{F10}")
;u::PgUp
;d::PgDn
;.::End
;,::Home
;#HotIf 

;# windows 
;! alt
;+ shift
;^ ctrl


;!t::send "#4"
;!f::send "#2"
;!m::send "#3"
;!e::send "#4"

;RAlt & h::{ 
;  KeyWait "RAlt"
;  SendInput "#^{Left}"
;  }
;RAlt & l::{ 
;  KeyWait "RAlt"
;  SendInput "#^{Right}"
;  }

;#LCtrl:: {
;  KeyWait "LCtrl"
;  SendInput "#^{Left}"
;  }

;^k::send "^{PgUp}"
;^j::send "^{PgDn}"
;!h::send "{Left}"
;!j::send "{down}"
;!K::send "{up}"
;!l::send "{Right}"
;RAlt & h::send "{Left}"
;RAlt & l::send "{Right}"
;RAlt & j::send "{down}"
;RAlt & K::send "{up}"
