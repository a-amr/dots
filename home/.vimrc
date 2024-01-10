filetype on           " behavior based on file type
filetype plugin on    " behavior based on file type
filetype indent on    " behavior based on file type
set number
set relativenumber
set ruler
set nowrapscan
syntax enable
hi Normal ctermbg=none
set cursorcolumn
set cursorline
set clipboard=unnamedplus
"source ~/.vim/ftplugin/tex.vim
"source ~/.vim/ftplugin/cpp.vim
"source ~/.vim/ftplugin/c.vim


command! -nargs=0 WW :w !doas tee %



set incsearch         " incremental searching
set ignorecase        " case insensitive matching
set smartcase         " smart case matching
set showmatch         " show matching bracket

set tabstop=4         " 4-space tabs
set shiftwidth=4      " 4-space tabs

vnoremap <C-n> :norm
set hls
set undofile
