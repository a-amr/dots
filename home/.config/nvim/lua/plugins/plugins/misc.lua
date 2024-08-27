return {
	-- Highlight todo, notes, etc in comments
	{
		-- WARNING:
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			require("mini.git").setup()
			-- Simple and easy statusline.
			--  You could remove this setup call if you don't like it,
			--  and try some other statusline plugin
			local statusline = require("mini.statusline")
			statusline.setup()
			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for
			-- cursor location to LINE:COLUMN
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end

			-- ... and there is more!
			--  Check out: https://github.com/echasnovski/mini.nvim
		end,
	},
	{ "ellisonleao/glow.nvim",    config = true, cmd = "Glow" },
	{ "dstein64/nvim-scrollview", opts = {} },
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	main = "ibl",
	-- 	config = function()
	-- 		require("ibl").setup {
	-- 			indent = {
	-- 				tab_char = { "⎜" },
	-- 				char = { "┋" },
	-- 			},
	-- 			scope = {
	-- 				enabled = true,
	-- 				char = { "║" },
	-- 			},
	-- 		}
	-- 	end
	-- },

	-- { -- Adds git related signs to the gutter, as well as utilities for managing changes
	--   "lewis6991/gitsigns.nvim",
	--   opts = {
	--     signs = {
	--       add = { text = "+" },
	--       change = { text = "~" },
	--       delete = { text = "_" },
	--       topdelete = { text = "‾" },
	--       changedelete = { text = "~" },
	--     },
	--   },
	-- },
	--
	{
		'nvim-neorg/neorg',
		lazy = false,
		version = "*",
		config = function()
			require('neorg').setup {
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {},
					["core.syntax"] = {},
				},
			}
		end,
	},

{
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
  }
}

}
