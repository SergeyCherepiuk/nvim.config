local configs = require("nvim-treesitter.configs")

configs.setup {
	ensure_installed = {
		"go", -- Golang
		"elixir", "heex", "eex", -- Elixir
	},
	sync_install = false,
	ignore_install = { "" },
	highlight = {
		enable = true,
		disable = { "" },
		additional_vim_regex_highlighting = true,

	},
	indent = { enable = true, disable = { "yaml" } },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	}
}
