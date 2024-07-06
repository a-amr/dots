-- NOTE: Here is where you install your plugins.
return {
	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
	-- "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	-- NOTE: Plugins can also be added by using a table,
	-- with the first argument being the link and the following
	-- keys can be used to configure plugin behavior/loading/etc.

	-- Here is a more advanced example where we pass configuration
	-- options to `gitsigns.nvim`. This is equivalent to the following lua:
	--    require('gitsigns').setup({ ... })
	-- { -- Adds git related signs to the gutter, as well as utilities for managing changes
	-- 	"lewis6991/gitsigns.nvim",
	-- 	opts = {
	-- 		signs = {
	-- 			add = { text = "+" },
	-- 			change = { text = "~" },
	-- 			delete = { text = "_" },
	-- 			topdelete = { text = "‾" },
	-- 			changedelete = { text = "~" },
	-- 		},
	-- 	},
	-- },

	-- NOTE: Plugins can also be configured to run lua code when they are loaded.
	-- For example, in the following configuration, we use:
	--  event = 'VimEnter'
	-- which loads which-key before all the UI elements are loaded. Events can be
	-- normal autocommands events (`:help autocmd-events`).
	-- Then, because we use the `config` key, the configuration only runs
	-- after the plugin has been loaded:
	--  config = function() ... end





	-- { -- You can easily change to a different colorscheme.
	--   -- Change the name of the colorscheme plugin below, and then
	--   -- change the command in the config to whatever the name of that colorscheme is
	--   --
	--   -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
	--   'folke/tokyonight.nvim',
	--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
	--   priority = 1000, -- make sure to load this before all the other start plugins
	--   config = function()
	--     -- Load the colorscheme here
	--     vim.cmd.colorscheme 'tokyonight-night'
	--
	--     -- You can configure highlights by doing something like
	--     vim.cmd.hi 'Comment gui=none'
	--   end,
	-- },

	---------------------------------------------------------------------------------


	-- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
	-- init.lua. If you want these files, they are in the repository, so you can just download them and
	-- put them in the right spots if you want.

	-- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for kickstart
	--
	--  Here are some example plugins that I've included in the kickstart repository.
	--  Uncomment any of the lines below to enable them (you will need to restart nvim).
	--
	-- require 'kickstart.plugins.debug',
	-- require 'kickstart.plugins.indent_line',

	-- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
	--    This is the easiest way to modularize your config.
	--
	--  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
	--    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
	-- { import = 'custom.plugins' },
}
