-- Cargar packer
vim.cmd [[packadd packer.nvim]]


-- Configuración base
require("user.settings")
require("user.keymaps")
require("user.plugins")
require("user.lsp")
require("user.cmp")
