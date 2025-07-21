vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- como gestor de plugins ocupo packer


  use {
  'goolord/alpha-nvim',
  config = function()
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
      dashboard.button("e", "  Nuevo archivo", ":ene <BAR> startinsert <CR>"),
      dashboard.button("q", "  Salir de Neovim", ":qa<CR>"),
    }


    alpha.setup(dashboard.config)
  end
}

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- autocompletado
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  --indent line
  use("lukas-reineke/indent-blankline.nvim")

  -- plugin prettier
  use {'neoclide/coc.nvim', branch = 'release'}

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use({
  'projekt0n/github-nvim-theme',
  config = function()
    require('github-theme').setup({
      
    })

    vim.cmd('colorscheme github_dark_default')
  end
  })

  -- gestor de archivos
 use {
  'nvim-tree/nvim-tree.lua',
  requires = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("nvim-tree").setup({
      renderer = {
        icons = {
          show = {
            git = true,         -- mostrar iconos de git
            folder = true,      -- mostrar iconos de carpetas
            file = true,        -- mostrar iconos de archivos
            folder_arrow = true -- mostrar flechas de carpeta
          },
        },
      },
    })
  end
}

  -- barra de estado
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'gruvbox-material',
          icons_enabled = false,
          section_separators = '',
          component_separators = ''
        }
      }
    end
  }

  -- barra de pestañas para buffers (tabs)
  use {
    'akinsho/bufferline.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup {
        options = {
          diagnostics = "nvim_lsp",
          show_buffer_icons = false, -- quita íconos si quieres
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
    end,
  }

   -- panel de errores parecido a errror lens
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons", -- para los iconos
    config = function()
      require("trouble").setup {
        auto_open = false,
        auto_close = true,
        use_lsp_diagnostic_signs = true,
      }
    end
  }


end)

