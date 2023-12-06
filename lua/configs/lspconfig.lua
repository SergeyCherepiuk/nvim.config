local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Golang
lspconfig.gopls.setup({
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    capabilities = capabilities,
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = { unusedparams = true },
        },
    },
})

lspconfig.elixirls.setup({
	cmd = { os.getenv("HOME") .. "/elixir-ls/release/language_server.sh" },
	filetypes = { "elixir", "eelixir", "heex", "surface" },
	capabilities = capabilities,
})
