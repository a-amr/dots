-- Define a function to compile
 function Compile()
    vim.g.current_compiler = "g++"
    vim.api.nvim_exec([[
        set makeprg=g++\ %\ -std=c++17\ -Wall\ -Wextra\ -pedantic\ -o\ %<\ -g\ &&\ ./\%<
        w
        cd %:p:h
        make
        cd -
        cwindow
        redraw!
        set makeprg&
        set errorformat&
    ]], false)
end

-- Define a function to run the compiled code
 function Run()
    vim.api.nvim_command("!./%<")
    vim.api.nvim_command("redraw!")
end

-- Set up autocmds for cpp file type
vim.api.nvim_command("autocmd FileType cpp nnoremap <buffer> \\c :lua Compile()<cr>")
vim.api.nvim_command("autocmd FileType cpp nnoremap <buffer> \\r :lua Run()<cr>")
vim.api.nvim_command("autocmd FileType cpp nnoremap <buffer> \\a :echo 'How are you! this is a cpp plugin'<LF>")
