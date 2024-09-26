return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"dundalek/lazy-lsp.nvim",
		"hrsh7th/nvim-cmp",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"kristijanhusak/vim-dadbod-completion",
		'rafamadriz/friendly-snippets',
		{
			"L3MON4D3/LuaSnip",
			build = (function()
				-- Build Step is needed for regex support in snippets
				-- This step is not supported in many windows environments
				-- Remove the below condition to re-enable on windows
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
		},
		{ "j-hui/fidget.nvim", opts = {} },
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		luasnip.config.setup({})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = { completeopt = "menu,menuone,noinsert" },

			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-f>"] = cmp.mapping.complete({}),
				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "vim-dadbod-completion"},
				{ name = "path" },
				{ name = 'cmdline' },
				{ name = 'buffer' },
			},
		})

		require("lazy-lsp").setup {
			-- By default all available servers are set up. Exclude unwanted or misbehaving servers.
			excluded_servers = {
				"nixd", "denols", "ltex", "sourcekit", "digestif", "tailwindcss", "scry", "ccls", "zk", "rnix",
			},
			-- Alternatively specify preferred servers for a filetype (others will be ignored).
			preferred_servers = {
				markdown = {},
				nix = { nil },
				lua = { "lua_ls" },
				c = { "clangd" },
				-- python = { "pyright", "ruff_lsp" },
			},
			prefer_local = true, -- Prefer locally installed servers over nix-shell
			-- Default config passed to all servers to specify on_attach callback and other options.
			default_config = {
				flags = {
					debounce_text_changes = 150,
				},
				capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), require("cmp_nvim_lsp").default_capabilities()),
				-- on_attach = on_attach,
			},
			-- Override config for specific servers that will passed down to lspconfig setup.
			-- Note that the default_config will be merged with this specific configuration so you don't need to specify everything twice.
			configs = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								-- Get the language server to recognize the `vim` global
								globals = { "vim" },
							},
						},
					},
				},
			},
		}
	end
}
