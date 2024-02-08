local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

return {
	sources = {
		-- Golang
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.goimports,

		-- Zig
		null_ls.builtins.formatting.zigfmt,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
}
