vim9script
#copen

def Compile()
g:current_compiler = "latex"
set makeprg=pdflatex\ -interaction=nonstopmode\ -synctex=-1\ %:p

set  errorformat=%E!\ LaTeX\ %trror:\ %m,
        \%E!\ %m,
      \%+WLaTeX\ %.%#Warning:\ %.%#line\ %l%.%#,
         \%+W%.%#\ at\ lines\ %l--%*\\d,
         \%WLaTeX\ %.%#Warning:\ %m,
         \%Cl.%l\ %m,
         \%+C\ \ %m.,
         \%+C%.%#-%.%#,
         \%+C%.%#[]%.%#,
         \%+C[]%.%#,
         \%+C%.%#%[{}\\]%.%#,
         \%+C<%.%#>%.%#,
         \%C\ \ %m,
         \%-GSee\ the\ LaTeX%m,
         \%-GType\ \ H\ <return>%m,
         \%-G\ ...%.%#,
         \%-G%.%#\ (C)\ %.%#,
         \%-G(see\ the\ transcript%.%#),
         \%-G\\s%#,
         \%+O(%*[^()])%r,
         \%+O%*[^()](%*[^()])%r,
         \%+P(%f%r,
         \%+P\ %\\=(%f%r,
         \%+P%*[^()](%f%r,
         \%+P[%\\d%[^()]%#(%f%r,
         \%+Q)%r,
         \%+Q%*[^()])%r,
          \%+Q[%\\d%*[^()])%r

  w
  cd %:p:h
  #set makeprg=pdflatex\ -interaction=nonstopmode\ %:p
  silent make
#  silent !pdflatex %:p
  cd -
  cwindow
  redraw!
set makeprg&
set errorformat&
enddef

def Openpdf()
#silent !zathura '%:p:r'.pdf & disown
const opta = "--synctex-forward "
const optb = line(".") .. ":" .. col(".") .. ":" .. '%:p'
const optc = "-c ~/.config/zathura/fortex "
exec "silent !zathura '%:p:r'.pdf " .. opta .. optb .. "&disown"
redraw! 
enddef


autocmd FileType tex nnoremap \a :echo "How are you! this is a latex file plugin"<LF><cr>
autocmd FileType tex noremap \c <ScriptCmd>Compile()<cr>
autocmd FileType tex noremap \r <scriptCmd>Openpdf()<cr>
