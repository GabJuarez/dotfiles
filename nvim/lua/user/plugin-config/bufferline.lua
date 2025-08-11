require("bufferline").setup {
  options = {
    diagnostics = "nvim_lsp",
    show_buffer_icons = false,
    show_buffer_close_icons = true,
    separator_style = "thin",
    always_show_bufferline = true,
    offsets = {
      {
        filetype = "NvimTree",
        text = "Explorador",
        highlight = "Directory",
        text_align = "left",
      }
    },
  }
}
