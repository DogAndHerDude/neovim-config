local function jsq_command()
  local file_buffer = vim.api.nvim_get_current_buf()
  local possible_json = vim.api.nvim_buf_get_lines(file_buffer, 0, -1, false)
  local len = #possible_json

  if len == 0 then
    vim.api.nvim_cmd('echo "Buffer is empty"', {})
    return
  end

  if len == 1 and string.match(possible_json[1], "^%{.*%}$") == nil then
    vim.api.nvim_cmd('echo "Buffer malformed"', {})
    return
  end

  if len > 1 and (string.match(possible_json[1], "^%{") == nil or string.match(possible_json[len], ".*%}$")) == nil then
    vim.api.nvim_cmd('echo "Buffer malformed"', {})
    return
  end

  vim.bo.filetype = "json"

  if len == 1 then
    possible_json[1] = string.gsub(string.gsub(possible_json[1], "^%{", "["), "%}$", "]")
  end

  if len > 1 then
    possible_json[1] = string.gsub(possible_json[1], "^%{", "[")
    possible_json[len] = string.gsub(possible_json[len], "%}$", "]")
  end

  local replacements = {
    ['\\"'] = '"',
    ['"{'] = '{',
    ['}"'] = '}'
  }

  local concated = table.concat(possible_json, "\n")

  for pattern, replacement in pairs(replacements) do
    concated = string.gsub(concated, pattern, replacement)
  end

  local output = vim.fn.system("jq .", concated)

  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(output, "\n"))
end

vim.api.nvim_create_user_command(
  "JsonifySQLArray",
  jsq_command,
  { nargs = 0 }
)

return {
  jsq = jsq_command
}
