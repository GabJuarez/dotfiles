-- mason
require("mason").setup()

-- LSP para c, python y java
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.clangd.setup { capabilities = capabilities }
lspconfig.pyright.setup { capabilities = capabilities }
lspconfig.jdtls.setup {
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls" },
    capabilities = capabilities
}
