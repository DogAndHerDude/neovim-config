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
  use {
    "coder/claudecode.nvim",
    requires = { "folke/snacks.nvim" },
    config = function()
      require("claudecode").setup()

      vim.keymap.set("n", "<leader>ac", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude" })
      vim.keymap.set("n", "<leader>af", "<cmd>ClaudeCodeFocus<cr>", { desc = "Focus Claude" })
      vim.keymap.set("n", "<leader>ar", "<cmd>ClaudeCode --resume<cr>", { desc = "Resume Claude" })
      vim.keymap.set("n", "<leader>aC", "<cmd>ClaudeCode --continue<cr>", { desc = "Continue Claude" })
      vim.keymap.set("n", "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", { desc = "Select Claude model" })
      vim.keymap.set("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", { desc = "Add current buffer" })
      vim.keymap.set("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>", { desc = "Send to Claude" })
      vim.keymap.set("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "Accept diff" })
      vim.keymap.set("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", { desc = "Deny diff" })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
        callback = function(ev)
          vim.keymap.set("n", "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>",
            { desc = "Add file", buffer = ev.buf })
        end,
      })
    end,
  }
end)
