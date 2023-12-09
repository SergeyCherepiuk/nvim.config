vim.keymap.set("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files, {})
vim.keymap.set("n", "<leader>fg", telescope.live_grep, {})
vim.keymap.set("n", "<leader>fb", telescope.buffers, {})
vim.keymap.set("n", "<leader>fh", telescope.help_tags, {})

vim.keymap.set("n", "<A-i>", "<CMD>lua require(\"FTerm\").toggle()<CR>")
vim.keymap.set("t", "<A-i>", "<C-\\><C-n><CMD>lua require(\"FTerm\").toggle()<CR>")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<A-c>", "<CMD>lua require(\"no-neck-pain\").toggle()<CR>")

vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)

vim.keymap.set("n", "<leader>e", "<CMD>Ex<CR>")
