return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", config = true },
        { "williamboman/mason-lspconfig.nvim" },

        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "kristijanhusak/vim-dadbod-completion",
        { "j-hui/fidget.nvim", opts = {} },
    },

    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()

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
                -- ["<C-f>"] = cmp.mapping.complete({}),
                ["<C-l>"] = cmp.mapping(function()
                end, { "i", "s" }),
                ["<C-h>"] = cmp.mapping(function()
                end, { "i", "s" }),
            }),
            sources = {
                { name = "nvim_lsp" },
                { name = "path" },
                { name = 'cmdline' },
                { name = 'buffer' },
            },
        })

        local lspconfig = require('lspconfig')
        local capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), require("cmp_nvim_lsp").default_capabilities())

        require('mason-lspconfig').setup_handlers {
            -- Default handler for all LSP servers
            function(server_name)
                lspconfig[server_name].setup {
                    capabilities = capabilities,
                    flags = {
                        debounce_text_changes = 150,
                    },
                }
            end,
        }
    end
}
