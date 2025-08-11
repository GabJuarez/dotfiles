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

-- Mason
require("mason").setup()

-- LSP para C, Python y Java
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.clangd.setup{
    capabilities = capabilities
}
lspconfig.pyright.setup{
    capabilities = capabilities
}

lspconfig.jdtls.setup{
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls" },
    capabilities = capabilities
}

-- Autocompletado con nvim-cmp y luasnip
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged } -- Activa al escribir
  },
  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter para aceptar
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- Forzar autocompletado al abrir un archivo Java
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.java",
  callback = function()
    vim.defer_fn(function()
      require('cmp').complete()
    end, 300) -- pequeño delay para que jdtls cargue
  end,
})

-- Atajos personalizados
vim.keymap.set("n", "<C-d>", function() vim.lsp.buf.format() end, { noremap = true, silent = true }) -- Formateo
vim.keymap.set("n", "<C-f>", ":NvimTreeToggle<CR>", { noremap = true, silent = true }) -- Explorador
