return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- Lazy load on entering insert mode
    dependencies = {
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
    },
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            snippet = {
                expand = function(args)
                    -- No snippet expansion
                end,
            },
            completion = { completeopt = "menu,menuone,noinsert" },
            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-f>"] = cmp.mapping.confirm({ select = true }),
                -- ["<C-l>"] = cmp.mapping(function() end, { "i", "s" }),
                -- ["<C-h>"] = cmp.mapping(function() end, { "i", "s" }),
                ["<C-h>"] = cmp.mapping.abort()
            }),
            sources = {
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "cmdline" },
                { name = "buffer" },
                -- { name = "vim-dadbod-completion"}
            },
        })
            vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'sql', 'mysql', 'plsql' },
        callback = function()
            cmp.setup.buffer({ sources = { { name = 'vim-dadbod-completion' } } })
        end,
        group = autocomplete_group,
})

    end,
}
