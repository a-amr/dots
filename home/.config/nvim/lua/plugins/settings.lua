--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- mine---------------------------------------------------------------------------------------
--  vim.cmd("command! -nargs=0 W :w !sudo tee %")
vim.keymap.set("c", "W<CR>", "<cmd>w !sudo tee %<CR><cmd>e!<CR><esc>", { silent = true })
-- Enable undo file
vim.opt.swapfile = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.cache/undodir"
vim.opt.backup = false
vim.opt.undofile = true


-- https://vi.stackexchange.com/questions/4244/what-is-softtabstop-used-for
vim.opt.tabstop = 2
vim.opt.softtabstop = -1
vim.opt.shiftwidth = 0
-- make no real \t just spaces
-- vim.opt.expandtab = true

-- vi like
-- vim.opt.laststatus = 1
-- vim.cmd("syntax off")
vim.wo.signcolumn = "no"

vim.cmd("inoremap jk <Esc>")
vim.cmd("cnoremap jk <C-c><cmd>nohlsearch<CR>")


vim.cmd("tnoremap <c-space> <C-\\><C-n>")

vim.opt.timeoutlen = 500

vim.keymap.set("n", "<leader>t", vim.cmd.Ex, { desc = "open netrw" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- nice but i don't need it now
--  vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- mine---------------------------------------------------------------------------------------

vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = ""
-- for disable
-- vim.cmd("set mouse=")
-- Don't show the mode, since it's already in status line
vim.opt.showmode = true

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "auto"

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
--vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- vim.opt.listchars = { tab = "»»", trail = " ", nbsp = "␣" }
-- Preview substitutions live, as you type!
-- very important
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 500

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "lsp format" })

vim.g.netrw_browse_split = 3









-- yank highlight
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yanked-text", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
-- lsp keybindings
local TheGroup = vim.api.nvim_create_augroup('group', {})
vim.api.nvim_create_autocmd('LspAttach', {
	group = TheGroup,
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "LSP: goto definition" }, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: goto declaration" }, opts)

		vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end,
			{ desc = "LSP:workspace symbols " }, opts)
		vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { desc = "LSP: open float!! " }, opts)
		vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { desc = "LSP: code action" }, opts)
		vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, { desc = "LSP:references!! " }, opts)
		vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, { desc = "LSP: rename" }, opts)
		vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { desc = "LSP: signature_help" }, opts)
		vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, { desc = "LSP: next error" }, opts)
		vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, { desc = "LSP: previous error" }, opts)
		vim.keymap.set("n", "gI", require("telescope.builtin").lsp_implementations, { desc = "LSP: goto implementation" },
			opts)
		vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols,
			{ desc = "LSP: workspace symbols" }, opts)
		vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols,
			{ desc = "LSP: document symbols" }, opts)

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end
})





-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
