
if test -z "${XDG_RUNTIME_DIR}"; then
  export XDG_RUNTIME_DIR=/tmp/$(id -u)-runtime-dir
  if ! test -d "${XDG_RUNTIME_DIR}"; then
    mkdir "${XDG_RUNTIME_DIR}"
    chmod 0700 "${XDG_RUNTIME_DIR}"
  fi
fi

doas loadkeys ~/.config/loadkeys/loadkeysrc


[[ ! $(pgrep startx) && $(tty) = "/dev/tty1" ]] && startx



export PATH=$PATH:/home/ababa/scripts/:/home/ababa/qemu:/home/ababa/local/bin/:/root/.cargo/bin/:/home/ababa/cargoBuild/debug:/home/ababa/.cargo/bin/

export 	CARGO_TARGET_DIR=/home/ababa/cargoBuild
export _JAVA_AWT_WM_NONREPARENTING=1

export NNN_USE_EDITOR=1
export NNN_NO_AUTOSELECT=1	
export NNN_TRASH=1	
export NNN_OPS_PROG=0	
export EDITOR=nvim
export NNN_OPENER=xdg-open
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export NNN_NO_AUTOSELECT=1

export HARDWARECLOCK=localtime

export TERMINAL=st
export BROWSER=qutebrowser
export TERM=st
export VISUAL=vim
