vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function (use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		requires = {
      {'nvim-lua/plenary.nvim'},
    }
	}
	use('nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'})
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
  use('nvim-lualine/lualine.nvim')
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')
  use('williamboman/mason.nvim')
  use('onsails/lspkind.nvim')
  use({'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'})
	use('tpope/vim-fugitive')
  use('dinhhuy258/git.nvim')
  use('windwp/nvim-ts-autotag')
end)
