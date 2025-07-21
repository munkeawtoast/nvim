local M = {}

function M.get_node_path()
  local ts_utils = require 'nvim-treesitter.ts_utils'
  local result = {}
  local node = ts_utils.get_node_at_cursor()
  while node do
    if tostring(node) == '<node pair>' then
      local key_node = node:named_child(0):named_child(0)
      table.insert(result, 1, ts_utils.get_node_text(key_node)[1])
    end
    node = node:parent()
  end
  local path = vim.fn.join(result, '.')
  vim.fn.setreg('+', path)
  print('Copied to clipboard: ' .. path)
end

function M.i18n_helper()
  local clipboard_content = vim.fn.getreg('+')
  local current_file = vim.fn.expand('%:t')
  
  if current_file:match('%.json$') and clipboard_content ~= '' then
    vim.fn.inputsave()
    local translation = vim.fn.input('Enter translation: ')
    vim.fn.inputrestore()
    
    if translation and translation ~= '' then
      -- Get current buffer content
      local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
      local json_content = table.concat(lines, '\n')
      
      -- Use jq to set the value at the clipboard path
      local jq_filter = 'setpath([' .. clipboard_content:gsub('%.', '","'):gsub('^', '"'):gsub('$', '"') .. ']; "' .. translation .. '")'
      local cmd = 'echo ' .. vim.fn.shellescape(json_content) .. ' | jq ' .. vim.fn.shellescape(jq_filter)
      
      local result = vim.fn.system(cmd)
      if vim.v.shell_error == 0 then
        -- Replace buffer content with the result
        local new_lines = {}
        for line in result:gmatch('[^\n]*') do
          if line ~= '' then
            table.insert(new_lines, line)
          end
        end
        vim.api.nvim_buf_set_lines(0, 0, -1, false, new_lines)
        print('Added translation: ' .. clipboard_content .. ' = "' .. translation .. '"')
      else
        print('Error using jq: ' .. result)
      end
    end
  else
    print('Not in JSON file or clipboard is empty')
  end
end

return M