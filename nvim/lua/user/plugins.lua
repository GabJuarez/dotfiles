return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Pantalla de inicio
  use { 'goolord/alpha-nvim', config = function() require("user.plugin-config.alpha") end }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- Autocompletado
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Indent line
  use { "lukas-reineke/indent-blankline.nvim", config = function() require("user.plugin-config.indent-blankline") end }

  -- Tema
  use { 'projekt0n/github-nvim-theme', config = function() require("user.plugin-config.github-theme") end }

  -- Gestor de archivos
  use { 'nvim-tree/nvim-tree.lua', requires = 'nvim-tree/nvim-web-devicons', config = function() require("user.plugin-config.nvim-tree") end }

  -- Barra de estado
  use { 'nvim-lualine/lualine.nvim', requires = 'nvim-tree/nvim-web-devicons', config = function() require("user.plugin-config.lualine") end }

  -- Barra de pestañas
  use { 'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons', config = function() require("user.plugin-config.bufferline") end }

  -- Panel de errores
  use { "folke/trouble.nvim", requires = 'nvim-tree/nvim-web-devicons', config = function() require("user.plugin-config.trouble") end }

  -- Autopairs
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('user.plugin-config.nvim-autopairs')
    end
  }

  -- Plugin para proyectos
  use {
    'ahmedkhalf/project.nvim',
    config = function()
      require('user.plugin-config.project')
    end
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require('user.plugin-config.telescope')
    end
  }
end)
