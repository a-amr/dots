vim9script

def Compile()
g:current_compiler = "g++"
set makeprg=g++\ %\ -std=c++17\ -Wall\ -Wextra\ -pedantic\ -o\ %<\ -g\ &&\ ./\%<
#set makeprg=g++\ %\ -std=c++17\ -o\ %<\ -g\ &&\ ./\%<
#set errorformat=%f:%l:%c:\ %m
set errorformat=%f:%l:%c:\ %trror:\ %m,%f:%l:\ %trror:\ %m,%f:%l:%c:\ %trror:\ %m\ %#,%-G%f:%l:%m
w
cd %:p:h
make
cd -
cwindow
redraw!
set makeprg&
set errorformat&
enddef

def Run()
!./%<
redraw!
enddef




autocmd FileType cpp nnoremap \c <ScriptCmd>Compile()<cr>
autocmd FileType cpp nnoremap \r <ScriptCmd>Run()<cr>
autocmd FileType cpp nnoremap \a :echo "How are you! this is a cpp plugin"<LF>
