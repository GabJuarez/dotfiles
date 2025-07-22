-- Cargar packer
vim.cmd [[packadd packer.nvim]]

-- Cargar plugins
require('plugins')

-- Opciones básicas
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showcmd = true
vim.opt.encoding = 'utf-8'
vim.opt.showmatch = true

-- indent line (indent-blankline.nvim)
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
require("ibl").setup()

-- Iconos para nvim-tree y otros
require('nvim-web-devicons').setup()

-- LSP para C y Python
local lspconfig = require('lspconfig')
lspconfig.clangd.setup{}
lspconfig.pyright.setup{}

-- Autocompletado con nvim-cmp y luasnip
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>']     = cmp.mapping.abort(),
    ['<CR>']      = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true })
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<C-j>']     = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<C-k>']     = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- Atajos personalizados
vim.keymap.set("n", "<C-d>", function() vim.lsp.buf.format() end, { noremap = true, silent = true }) -- Formateo
vim.keymap.set("n", "<C-f>", ":NvimTreeToggle<CR>", { noremap = true, silent = true }) -- Explorador
