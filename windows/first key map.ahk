#Requires AutoHotkey v2.0
#Warn

;# windows 
;! alt
;+ shift
;^ ctrl


#c::Run "msedge.exe"
#z::Run "nvim"
!l::send "#^{Right}"
!h::send "#^{Left}"
!j::send "!{tab}"
!k::send "+!{tab}"


;!d::send "#^d"
;!q::send "#^{F4}"
;*eml::send "sseadaamr@gmail.com"
;#z::run "qutebrowser.exe"
;!q::send "!{f4}"
;MButton & LButton::Send "!{F4}"
;Capslock::send "+{f10}"
;Esc  k::send "{up}"
;*Space:: SendInput {Blind}{Space}
;#+t:: WinSetAlwaysOnTop -1
;how to make it run on startup
