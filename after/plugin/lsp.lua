local lspconfig = require('lspconfig')
local cmp = require('cmp')
local capabilities = require('cmp_nvim_lsp')

local default_capabilities = capabilities.default_capabilities()

cmp.setup {
  snippet = {
    expand = function(args)
      require 'luasnip'.lsp_expand(args.body)
    end
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'path' },
  }, {
    { name = 'buffer' },
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
}

lspconfig.gopls.setup {
  capabilities = default_capabilities,
  settings = {
    gopls = {
      staticcheck = true,
      gofumpt = true,
    }
  }
}
lspconfig.tsserver.setup {
  capabilities = default_capabilities,
}
lspconfig.graphql.setup {
  capabilities = default_capabilities,
}
lspconfig.prismals.setup {
  capabilities = default_capabilities,
}
lspconfig.tailwindcss.setup {
  capabilities = default_capabilities,
  init_options = { userLanguages = { templ = "html" } },
}
lspconfig.astro.setup {
  capabilities = default_capabilities,
}
lspconfig.rust_analyzer.setup {
  capabilities = default_capabilities,
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}
lspconfig.lua_ls.setup {
  capabilities = default_capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          'vim',
          'require'
        },
      },
    },
  }
}
lspconfig.html.setup {
  capabilities = default_capabilities,
}
lspconfig.htmx.setup {
  capabilities = capabilities,
}
lspconfig.templ.setup {
  capabilities = default_capabilities,
  filetypes = { "templ" }
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'F', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- vim.keymap.set('n', '<space>f', function()
    --   vim.lsp.buf.format { async = true }
    -- end, opts)
  end,
})
