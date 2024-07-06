vim9script
def Compile()
#set makeprg=g++\ %\ -std=c++17\ -Wall\ -Wextra\ -pedantic\ -o\ %<\ -g\ &&\ ./\%<
set makeprg=gcc\ -Wall\ -Wextra\ %\ -o\ %<\ -g\ &&\ ./\%<
#set makeprg="gcc % -o\ %<\ -g\ &&\ ./\%<"
#set makeprg="gcc -Wall -Wextra % -o %< && ./%<"
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

autocmd FileType c nnoremap \c <ScriptCmd>Compile()<cr>
autocmd FileType c nnoremap \r <ScriptCmd>Run()<cr>
autocmd FileType c nnoremap \a :echo "How are you this is a c plugin"<LF>
