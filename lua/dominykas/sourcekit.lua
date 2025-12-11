local sourcekit_config = {
  -- The command to execute the language server
  -- 'xcrun' is necessary on macOS to find the bundled sourcekit-lsp
  -- If you are on Linux and installed it via other means, adjust this path/command.
  cmd = { "xcrun", "sourcekit-lsp" },

  -- Filetypes this LSP server should handle
  filetypes = { "swift", "c", "cpp", "objective-c", "objective-cpp" },

  -- How the LSP server determines the root of your project.
  -- sourcekit-lsp typically looks for a Package.swift file or a .git directory.
  root_dir = lsp_utils.root_pattern("Package.swift", ".git"),

  -- Optional: Important capability setting for file watching
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },

  -- You can add an on_attach function here if you want to set buffer-local keymaps
  -- or perform other setup when the server attaches to a buffer.
  on_attach = function(client, bufnr)
    -- Example of setting a keymap for hover information
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
    -- Add other keymaps as needed (e.g., gd for definition)
  end,
}

return sourcekit_config
