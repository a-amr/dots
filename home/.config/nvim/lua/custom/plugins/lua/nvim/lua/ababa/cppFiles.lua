
-- Define a function to compile and run C/C++ files
function CompileAndRun()
    local file_extension = vim.fn.expand('%:e')
    
    if file_extension == 'c' or file_extension == 'cpp' then
        local file_name = vim.fn.expand('%:t:r')
        local output_name = file_name
        
        if file_extension == 'cpp' then
            output_name = output_name .. "_cpp"
        end
        
        local compile_cmd = ''
        
        if file_extension == 'c' then
            compile_cmd = 'gcc ' .. vim.fn.shellescape('%') .. ' -o ' .. output_name
        else
            compile_cmd = 'g++ ' .. vim.fn.shellescape('%') .. ' -o ' .. output_name
        end
        
        local run_cmd = './' .. output_name
        
        -- Compile the file
        vim.fn.system(compile_cmd)
        
        -- Run the compiled executable
        vim.fn.system(run_cmd)
    else
        print('Not a C or C++ file.')
    end
end

-- Map <Leader>r to the CompileAndRun function
vim.api.nvim_set_keymap('n', '<Leader>r', ':lua CompileAndRun()<CR>', { noremap = true, silent = true })
