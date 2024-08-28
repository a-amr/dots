#Requires AutoHotkey v2.0
SetCapsLockState "AlwaysOff"

; Remap Shift Left + Shift Right to Caps Lock
LShift & RShift::Capslock
RShift & LShift::Capslock
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

^k::send "^{PgUp}"
^j::send "^{PgDn}"

;LCtrl & j::send "^{PgDn}"
;LCtrl & k::send "^{PgUp}"


DetectHiddenWindows "On"
WinExistCheck(Title, Path) {
    if WinExist(Title) {
        WinActivate
    } else {
        Run(Path)
    }
}

!s:: {
    result := InputBox("Enter the window name to open (case-insensitive):")
    if result.Result != "OK" || result.Value == ""
        return
    wname_lower := StrLower(result.Value)
    for window in WinGetList() {
        this_title := WinGetTitle(window)
        this_title_lower := StrLower(this_title)
        if InStr(this_title_lower, wname_lower) {
            WinActivate(window)
            return
        }
    }
    MsgBox("Window '" result.Value "' not found.")
}



!f:: WinExistCheck("Firefox", "C:\Program Files\Mozilla Firefox\firefox.exe")
;!f:: WinExistCheck("Zen Browser", "C:\Program Files\Zen Browser\zen.exe")
!m:: winExistCheck("thunderbird", "c:\program files\mozilla thunderbird\thunderbird.exe")
!t:: WinExistCheck("Terminal", "C:\Users\" A_UserName "\AppData\Local\Microsoft\WindowsApps\wt.exe")
!e:: WinExistCheck("ahk_class CabinetWClass", "C:\WINDOWS\explorer.exe")
