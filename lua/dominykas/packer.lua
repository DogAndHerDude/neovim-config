vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = {
      { 'nvim-lua/plenary.nvim' },
    }
  }
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate', lazy = false })
  use({
    'neanias/everforest-nvim',
    as = 'everforest',
    config = function()
      require('everforest').setup({
        background = 'hard',
        transparent_background_level = 0,
      })
      vim.cmd('colorscheme everforest')
    end
  })
  use('neovim/nvim-lspconfig')
  use('L3MON4D3/LuaSnip')
  use('hrsh7th/nvim-cmp')
  use('saadparwaiz1/cmp_luasnip')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('rafamadriz/friendly-snippets')
  use('hrsh7th/cmp-nvim-lua')
  use('nvim-lualine/lualine.nvim')
  use('MunifTanjim/prettier.nvim')
  use('williamboman/mason.nvim')
  use('onsails/lspkind.nvim')
  use({ 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' })
  use('tpope/vim-fugitive')
  use('dinhhuy258/git.nvim')
  use('windwp/nvim-ts-autotag')
  use('lewis6991/gitsigns.nvim')
  use('nvim-tree/nvim-web-devicons')
  use('stevearc/conform.nvim')
  use("xemptuous/sqlua.nvim")
  use("devswiftzone/swift.nvim", {
    ft = "swift",
    config = function()
      require("swift").setup({
        format_on_save = true,
        tool = "swift-format",
      })
    end,
  })
end)
