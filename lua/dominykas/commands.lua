local replacements = {
  ['\\"'] = '"',
  ['"{'] = '{',
  ['}"'] = '}'
}

local function jsq_command()
  local file_buffer = vim.api.nvim_get_current_buf()
  local possible_json = vim.api.nvim_buf_get_lines(file_buffer, 0, -1, false)
  local str = table.concat(possible_json, "\n")

  if #str == 0 then
    vim.api.nvim_echo({ { "Buffer empty", "WarningMsg" } }, true, {})
    return
  end

  if string.match(str, "^%{.*%}$") == nil then
    vim.api.nvim_echo({ { "Buffer malformed", "WarningMsg" } }, true, {})
    return
  end

  vim.bo.filetype = "json"

  str = string.gsub(string.gsub(str, "^%{", "["), "%}$", "]")


  for pattern, replacement in pairs(replacements) do
    str = string.gsub(str, pattern, replacement)
  end

  local output = vim.fn.system("jq .", str)

  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(output, "\n"))
end

local function jq_command()
  local file_buffer = vim.api.nvim_get_current_buf()
  local possible_json = vim.api.nvim_buf_get_lines(file_buffer, 0, -1, false)
  local str = table.concat(possible_json, "\n")

  if #str == 0 then
    vim.api.nvim_echo({ { "Buffer empty", "WarningMsg" } }, true, {})
    return
  end

  vim.bo.filetype = "json"

  local output = vim.fn.system("jq .", str)

  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(output, "\n"))
end

vim.api.nvim_create_user_command(
  "JsonifySQLArray",
  jsq_command,
  { nargs = 0 }
)

vim.api.nvim_create_user_command("JQ", jq_command, { nargs = 0 })

return {
  jsq = jsq_command,
  jq = jq_command,
}
