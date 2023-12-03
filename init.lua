-- Install lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Vim options
require("options")

-- Install plugins
require("lazy").setup({
	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		opts = function()
			return require("configs.cmp")
		end,
	},

	-- Language server and autocompletion
	{
		"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp,
		"saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
		"L3MON4D3/LuaSnip", -- Snippets plugin
		"neovim/nvim-lspconfig",
	},

	-- Color scheme
	{ "nyoom-engineering/oxocarbon.nvim" },

	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			return require("configs.lualine")
		end,
	},

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter" },

	-- Telescope (fuzzy finder)
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" }
	},

	-- Floating terminal
	{
		"numToStr/FTerm.nvim",
		opts = function()
			return require("configs.fterm")
		end,
	},

	-- Git signs
	{
		"lewis6991/gitsigns.nvim",
		opts = function()
			return require("configs.gitsigns")
		end,
	},

	-- Comments
	{
		"numToStr/Comment.nvim",
		opts = function()
			return require("configs.comment")
		end,
	},

	-- Center buffer
	{
		"shortcuts/no-neck-pain.nvim",
		opts = function()
			return require("configs.no-neck-pain")
		end,
	},

	-- Errors list
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
})

require("no-neck-pain").enable()
vim.cmd("autocmd VimEnter * wincmd w")

require("configs.treesitter")
require("configs.lspconfig")

-- Setup key mappings
require("keymaps")

-- Color scheme
vim.opt.background = "dark"
vim.cmd("colorscheme oxocarbon")
