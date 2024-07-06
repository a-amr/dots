return {
	"dundalek/lazy-lsp.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
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

			-- For an understanding of why these mappings were
			-- chosen, you will need to read `:help ins-completion`
			--
			-- No, but seriously. Please read `:help ins-completion`, it is really good!
			mapping = cmp.mapping.preset.insert({
				-- Select the [n]ext item
				["<C-n>"] = cmp.mapping.select_next_item(),
				-- Select the [p]revious item
				["<C-p>"] = cmp.mapping.select_prev_item(),

				-- Accept ([y]es) the completion.
				--  This will auto-import if your LSP supports it.
				--  This will expand snippets if the LSP sent a snippet.
				["<C-y>"] = cmp.mapping.confirm({ select = true }),

				-- Manually trigger a completion from nvim-cmp.
				--  Generally you don't need this, because nvim-cmp will display
				--  completions whenever it has completion options available.
				["<C-Space>"] = cmp.mapping.complete({}),

				-- Think of <c-l> as moving to the right of your snippet expansion.
				--  So if you have a snippet that's like:
				--  function $name($args)
				--    $body
				--  end
				--
				-- <c-l> will move you to the right of each of the expansion locations.
				-- <c-h> is similar, except moving you backwards.
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
				-- { name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
			},
		})
		cmp.setup()









		require("lazy-lsp").setup {
			-- By default all available servers are set up. Exclude unwanted or misbehaving servers.
			excluded_servers = {
				"denols", "ltex", "sourcekit", "digestif", "tailwindcss", "scry", "ccls", "zk", "rnix",
			},
			-- Alternatively specify preferred servers for a filetype (others will be ignored).
			preferred_servers = {
				-- markdown = {},
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
				-- capabilities = capabilities,
			},
			-- Override config for specific servers that will passed down to lspconfig setup.
			-- Note that the default_config will be merged with this specific configuration so you don't need to specify everything twice.


			-- configs = {
			-- 	lua_ls = {
			-- 		settings = {
			-- 			Lua = {
			-- 				diagnostics = {
			-- 					-- Get the language server to recognize the `vim` global
			-- 					globals = { "vim" },
			-- 				},
			-- 			},
			-- 		},
			-- 	},
			-- },



		}






		-- 	config = function()
		--    See `:help CursorHold` for information about when this is executed
		-- 				local client = vim.lsp.get_client_by_id(event.data.client_id)
		-- 				if client and client.server_capabilities.documentHighlightProvider then
		-- 					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
		-- 						buffer = event.buf,
		-- 						callback = vim.lsp.buf.document_highlight,
		-- 					})
		--
		-- 					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
		-- 						buffer = event.buf,
		-- 						callback = vim.lsp.buf.clear_references,
		-- 					})
		-- 				 end
		-- 			 end,
	end,
}
