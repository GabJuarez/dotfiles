require('project_nvim').setup({
  --detecta automaticamente la raiz del proyecto
  detection_methods = { "pattern" },
  patterns = { ".git", "Makefile", "package.json", "pom.xml", "build.gradle" },
  silent_chdir = true,
  ignore_lsp = {},
  datapath = vim.fn.stdpath("data"),
})
