return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", config = true },
        { "williamboman/mason-lspconfig.nvim" },
        { "j-hui/fidget.nvim", opts = {}, event = "LspAttach" },
    },
    event = "BufReadPre",
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()

        local lspconfig = require('lspconfig')
        local capabilities = vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            require("cmp_nvim_lsp").default_capabilities()
        )
        local on_attach = function(client, bufnr)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
        end

        require('mason-lspconfig').setup_handlers {
            -- Default handler for all LSP servers
            function(server_name)
                lspconfig[server_name].setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    flags = {
                        debounce_text_changes = 150,
                    },
                }
            end,
        }
    end,
}
