local alpha = require'alpha'
local dashboard = require'alpha.themes.dashboard'

dashboard.section.header.val = {
  " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
  " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
  " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
  " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
  " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
  " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
}

dashboard.section.buttons.val = {
  dashboard.button("e", "  Nuevo archivo", ":ene <CR>"),
  dashboard.button("q", "  Salir de Neovim", ":qa<CR>"),
}

alpha.setup(dashboard.config)
