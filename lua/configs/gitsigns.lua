return {
	signs = {
		add = { text = "│" },
		change = { text = "~" },
		delete = { text = "-" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "│" },
	},
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns
		local no_neck_pain = require("no-neck-pain")
		
		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame)
		vim.keymap.set("n", "<leader>hd", function() no_neck_pain.disable(); gs.diffthis() end)
		vim.keymap.set("n", "<leader>hD", function() gs.diffthis("~") end)
		vim.keymap.set("n", "<leader>td", gs.toggle_deleted)
	end,
}
