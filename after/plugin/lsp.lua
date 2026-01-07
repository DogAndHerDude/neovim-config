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

vim.lsp.config('eslint', {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        -- This is the code that 'EslintFixAll' executes under the hood
        vim.lsp.buf.execute_command({
          command = 'eslint.applyAllFixes',
          arguments = {
            {
              uri = vim.uri_from_bufnr(bufnr),
              version = vim.lsp.util.buf_versions[bufnr],
            },
          },
        })
      end,
    })
  end,
})
vim.lsp.enable('eslint')

vim.lsp.config('gopls', {
  capabilities = default_capabilities,
  settings = {
    gopls = {
      staticcheck = true,
      gofumpt = true,
    }
  }
})
vim.lsp.enable('gopls')

vim.lsp.config('ts_ls', {})
vim.lsp.enable('ts_ls')
vim.lsp.config('graphql', {
  capabilities = default_capabilities,
})
vim.lsp.enable('graphql')
vim.lsp.config('prismals', {
  capabilities = default_capabilities,
})
vim.lsp.enable('prismals')
vim.lsp.config('tailwindcss', {
  capabilities = default_capabilities,
  init_options = { userLanguages = { templ = "html" } },
})
vim.lsp.enable('tailwindcss')
vim.lsp.config('astro', {
  capabilities = default_capabilities,
})
vim.lsp.enable('astro')
vim.lsp.config('rust_analyzer', {
  capabilities = default_capabilities,
  -- Server-specific settings. See `:help vim.lsp.config-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
})
vim.lsp.enable('rust_analyzer')
vim.lsp.config('lua_ls', {
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
})
vim.lsp.enable('lua_ls')

vim.lsp.config('html', {
  capabilities = default_capabilities,
})
vim.lsp.enable('html')
--It's dead, Jimbo...
--vim.lsp.config.htmx.setup {
--  capabilities = capabilities,
--}

vim.lsp.config('templ', {
  capabilities = default_capabilities,
  filetypes = { "templ" }
})
vim.lsp.enable('templ')

vim.lsp.config('ansible-lint', {
  capabilities = default_capabilities,
  ansible = {
    ansible = {
      path = "ansible"
    },
    executionEnvironment = {
      enabled = false
    },
    python = {
      interpreterPath = "python"
    },
    validation = {
      enabled = true,
      lint = {
        enabled = true,
        path = "ansible-lint"
      }
    }
  }
})
vim.lsp.enable('ansible-lint')

vim.lsp.enable('ansiblels')

vim.lsp.config('sourcekit', {
  cmd = { "xcrun", "sourcekit-lsp" },

  filetypes = { "swift", "c", "cpp", "objective-c", "objective-cpp" },

  root_markers = { "buildServer.json", "*.xcodeproj", ".git" },

  capabilities = default_capabilities,
  --capabilities = {
  --  workspace = {
  --    didChangeWatchedFiles = {
  --      dynamicRegistration = true,
  --    },
  --  },
  --},

  on_attach = function(client, bufnr)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
  end,
})
vim.lsp.enable('sourcekit')

vim.lsp.config('zls', {
  cmd = { "zls" },
  filetypes = { "zig", "zir" },
  root_markers = { "build.zig", ".git" },
  single_file_support = true,
  capabilities = default_capabilities,
  settings = {
    zls = {
      zig_exe_path = "/opt/homebrew/bin/zig",
      warn_style = true,
      highlight_global_var_declarations = true,
      build_on_save = true,
    }
  },
})
vim.lsp.enable('zls')

-- it borken
--vim.lsp.config.sqls.setup {
--  on_attach = function(client, bufnr)
--    require('sqls').on_attach(client, bufnr)
--  end
--}


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
    vim.keymap.set('n', '<space>f', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- vim.keymap.set('n', '<space>f', function()
    --   vim.lsp.buf.format { async = true }
    -- end, opts)
  end,
})
