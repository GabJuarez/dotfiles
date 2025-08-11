-- atajos
vim.keymap.set("n", "<C-d>", function() vim.lsp.buf.format() end, { noremap = true, silent = true }) -- Formateo
vim.keymap.set("n", "<C-f>", ":NvimTreeToggle<CR>", { noremap = true, silent = true }) -- Explorador
