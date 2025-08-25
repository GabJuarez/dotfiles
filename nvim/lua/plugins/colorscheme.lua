return {
  "V4N1LLA-1CE/xcodedark.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("xcodedark").setup({
      -- New color scheme with your specifications
      transparent = true, -- or false if you prefer solid background

      integrations = {
        telescope = true,
        nvim_tree = true,
        gitsigns = true,
        bufferline = true,
        incline = true,
        lazygit = true,
        which_key = true,
        notify = true,
      },

      -- Font weight customization
      styles = {
        comments = { italic = true, fg = "#6A737D" },
        keywords = { bold = true, fg = "#0000FF" },
        functions = { fg = "#795E26" },
        variables = { fg = "#333333" },
        strings = { fg = "#A31515" },
        booleans = { bold = true },
        types = { bold = true, fg = "#267F99" },
        constants = {},
        operators = {},
        punctuation = {},
      },

      terminal_colors = true,
    })
    vim.cmd.colorscheme("xcodedark")
  end,
}
