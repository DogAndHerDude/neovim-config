-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/dominykasbartkus/.cache/nvim/packer_hererocks/2.1.1765228720/share/lua/5.1/?.lua;/Users/dominykasbartkus/.cache/nvim/packer_hererocks/2.1.1765228720/share/lua/5.1/?/init.lua;/Users/dominykasbartkus/.cache/nvim/packer_hererocks/2.1.1765228720/lib/luarocks/rocks-5.1/?.lua;/Users/dominykasbartkus/.cache/nvim/packer_hererocks/2.1.1765228720/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/dominykasbartkus/.cache/nvim/packer_hererocks/2.1.1765228720/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["claudecode.nvim"] = {
    config = { "\27LJ\2\né\1\0\1\b\0\t\0\v6\1\0\0009\1\1\0019\1\2\1'\3\3\0'\4\4\0'\5\5\0005\6\6\0009\a\a\0=\a\b\6B\1\5\1K\0\1\0\vbuffer\bbuf\1\0\2\tdesc\rAdd file\vbuffer\0\31<cmd>ClaudeCodeTreeAdd<cr>\15<leader>as\6n\bset\vkeymap\bvim©\b\1\0\6\0+\0X6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\22\0'\4\23\0005\5\24\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\25\0'\3\26\0'\4\27\0005\5\28\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\29\0'\4\30\0005\5\31\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3 \0'\4!\0005\5\"\0B\0\5\0016\0\3\0009\0#\0009\0$\0'\2%\0005\3'\0005\4&\0=\4(\0033\4)\0=\4*\3B\0\3\1K\0\1\0\rcallback\0\fpattern\1\0\2\fpattern\0\rcallback\0\1\6\0\0\rNvimTree\rneo-tree\boil\14minifiles\nnetrw\rFileType\24nvim_create_autocmd\bapi\1\0\1\tdesc\14Deny diff <cmd>ClaudeCodeDiffDeny<cr>\15<leader>ad\1\0\1\tdesc\16Accept diff\"<cmd>ClaudeCodeDiffAccept<cr>\15<leader>aa\1\0\1\tdesc\19Send to Claude\28<cmd>ClaudeCodeSend<cr>\15<leader>as\6v\1\0\1\tdesc\23Add current buffer\29<cmd>ClaudeCodeAdd %<cr>\15<leader>ab\1\0\1\tdesc\24Select Claude model#<cmd>ClaudeCodeSelectModel<cr>\15<leader>am\1\0\1\tdesc\20Continue Claude#<cmd>ClaudeCode --continue<cr>\15<leader>aC\1\0\1\tdesc\18Resume Claude!<cmd>ClaudeCode --resume<cr>\15<leader>ar\1\0\1\tdesc\17Focus Claude\29<cmd>ClaudeCodeFocus<cr>\15<leader>af\1\0\1\tdesc\18Toggle Claude\24<cmd>ClaudeCode<cr>\15<leader>ac\6n\bset\vkeymap\bvim\nsetup\15claudecode\frequire\0" },
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/claudecode.nvim",
    url = "https://github.com/coder/claudecode.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["conform.nvim"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/conform.nvim",
    url = "https://github.com/stevearc/conform.nvim"
  },
  everforest = {
    config = { "\27LJ\2\nù\1\0\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0\27colorscheme everforest\bcmd\bvim\1\0\2\15background\thard!transparent_background_level\3\0\nsetup\15everforest\frequire\0" },
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/neanias/everforest-nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["git.nvim"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/git.nvim",
    url = "https://github.com/dinhhuy258/git.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["prettier.nvim"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/prettier.nvim",
    url = "https://github.com/MunifTanjim/prettier.nvim"
  },
  ["snacks.nvim"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/snacks.nvim",
    url = "https://github.com/folke/snacks.nvim"
  },
  ["sqlua.nvim"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/sqlua.nvim",
    url = "https://github.com/xemptuous/sqlua.nvim"
  },
  ["swift.nvim"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/swift.nvim",
    url = "https://github.com/devswiftzone/swift.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/dominykasbartkus/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: everforest
time([[Config for everforest]], true)
try_loadstring("\27LJ\2\nù\1\0\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0\27colorscheme everforest\bcmd\bvim\1\0\2\15background\thard!transparent_background_level\3\0\nsetup\15everforest\frequire\0", "config", "everforest")
time([[Config for everforest]], false)
-- Config for: claudecode.nvim
time([[Config for claudecode.nvim]], true)
try_loadstring("\27LJ\2\né\1\0\1\b\0\t\0\v6\1\0\0009\1\1\0019\1\2\1'\3\3\0'\4\4\0'\5\5\0005\6\6\0009\a\a\0=\a\b\6B\1\5\1K\0\1\0\vbuffer\bbuf\1\0\2\tdesc\rAdd file\vbuffer\0\31<cmd>ClaudeCodeTreeAdd<cr>\15<leader>as\6n\bset\vkeymap\bvim©\b\1\0\6\0+\0X6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\22\0'\4\23\0005\5\24\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\25\0'\3\26\0'\4\27\0005\5\28\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\29\0'\4\30\0005\5\31\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3 \0'\4!\0005\5\"\0B\0\5\0016\0\3\0009\0#\0009\0$\0'\2%\0005\3'\0005\4&\0=\4(\0033\4)\0=\4*\3B\0\3\1K\0\1\0\rcallback\0\fpattern\1\0\2\fpattern\0\rcallback\0\1\6\0\0\rNvimTree\rneo-tree\boil\14minifiles\nnetrw\rFileType\24nvim_create_autocmd\bapi\1\0\1\tdesc\14Deny diff <cmd>ClaudeCodeDiffDeny<cr>\15<leader>ad\1\0\1\tdesc\16Accept diff\"<cmd>ClaudeCodeDiffAccept<cr>\15<leader>aa\1\0\1\tdesc\19Send to Claude\28<cmd>ClaudeCodeSend<cr>\15<leader>as\6v\1\0\1\tdesc\23Add current buffer\29<cmd>ClaudeCodeAdd %<cr>\15<leader>ab\1\0\1\tdesc\24Select Claude model#<cmd>ClaudeCodeSelectModel<cr>\15<leader>am\1\0\1\tdesc\20Continue Claude#<cmd>ClaudeCode --continue<cr>\15<leader>aC\1\0\1\tdesc\18Resume Claude!<cmd>ClaudeCode --resume<cr>\15<leader>ar\1\0\1\tdesc\17Focus Claude\29<cmd>ClaudeCodeFocus<cr>\15<leader>af\1\0\1\tdesc\18Toggle Claude\24<cmd>ClaudeCode<cr>\15<leader>ac\6n\bset\vkeymap\bvim\nsetup\15claudecode\frequire\0", "config", "claudecode.nvim")
time([[Config for claudecode.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
