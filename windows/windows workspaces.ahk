#Requires AutoHotkey v2.0
SetCapsLockState "AlwaysOff"

; Remap Shift Left + Shift Right to Caps Lock
LShift & RShift::Capslock
RShift & LShift::Capslock


#HotIf GetKeyState('CapsLock', 'P')                         ; Following hotkeys are enabled when caps is held
k::Up
h::Left
j::Down
l::Right

u::PgUp
d::PgDn

;a::Shift
;s::Control
;d::Alt

.::End
,::Home

`;::Delete
'::BackSpace 
#HotIf 



;# windows 
;! alt
;+ shift
;^ ctrl

;#c::Run "msedge.exe"
!l::send "#^{Right}"
!h::send "#^{Left}"
;!j::send "!{tab}"
;!k::send "+!{tab}"
;!q::send "!{F4}"
;#k::send "#{Up}"
