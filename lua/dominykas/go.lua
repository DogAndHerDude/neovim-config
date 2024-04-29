local autocmd = vim.api.nvim_create_autocmd

-- Auto formats go files
autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({ async = false })
  end
})

-- autocmd("BufWritePre", {
--   pattern = "*.templ",
--   callback = vim.lsp.buf.format,
-- })

-- Run test on current file
vim.api.nvim_create_user_command(
  "GoTest",
  function()
    local file_buffer = vim.api.nvim_get_current_buf()
    local name = vim.api.nvim_buf_get_name(file_buffer)
    local command = { "go", "test", name }
    -- Validate for *_test.go pattern
    -- TODO: Find workspace root
    vim.api.nvim_cmd({
      cmd = "vnew",
      -- TODO: Find out how to limit width
    }, {})

    local info_buffer = vim.api.nvim_get_current_buf()
    local info_window = vim.api.nvim_get_current_win()

    vim.api.nvim_win_set_width(info_window, 80)

    local append_data = function(_, data)
      if not data then
        return
      end

      vim.api.nvim_buf_set_option(info_buffer, "modifiable", true)
      vim.api.nvim_buf_set_lines(info_buffer, -1, -1, false, data)
      vim.api.nvim_buf_set_option(info_buffer, "modifiable", false)
      vim.api.nvim_buf_set_option(info_buffer, "modified", false)
    end

    local append_error = function(_, data)
      if not data then
        return
      end

      vim.api.nvim_buf_set_option(info_buffer, "modifiable", true)
      vim.api.nvim_buf_set_lines(info_buffer, -1, -1, false, data)
      vim.api.nvim_buf_set_option(info_buffer, "modifiable", false)
      vim.api.nvim_buf_set_option(info_buffer, "modified", false)
    end

    vim.api.nvim_buf_set_lines(info_buffer, 0, -1, false, { "Running go test on buffer: [" .. name .. "]", "" })
    -- Make sure nvim does not complain that buffer is modified and does not let you quit
    vim.api.nvim_buf_set_option(info_buffer, "modifiable", false)
    vim.fn.jobstart(command, {
      stdout_buffered = true,
      on_stdout = append_data,
      on_stderr = append_error,
    })

    -- Append name of buffer to the top: Running test on buffer: [name_of_test.go]
    -- Show some sort of separator
    -- Run command with information of go buffer
    -- Update info with stdout logs
    -- Show commands
    -- > q - quit
    -- > r - rerun
    -- Highlight commands
  end,
  { nargs = 0 }
)
