local telescope = require('telescope')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local sorters = require('telescope.sorters')

local function parse_justfile_tasks()
  local tasks = {}
  local handle = io.popen('just --list 2>/dev/null') -- Run just command
  if handle then
    local is_first_line = true
    for line in handle:lines() do
      if is_first_line then
        is_first_line = false -- Skip the header line
      else
        local task_name = line:match('^%s*(%S+)%s*$') -- Match task name and trim whitespace
        if task_name then
          table.insert(tasks, task_name) -- Insert task name into the table
        end
      end
    end
    handle:close()
  end
  return tasks
end

local terminal_bufnr = nil

local function open_terminal(command)
  vim.print('terminal_bufnr:', terminal_bufnr)
  vim.print('is valid:', terminal_bufnr and vim.api.nvim_buf_is_valid(terminal_bufnr))
  if terminal_bufnr and vim.api.nvim_buf_is_valid(terminal_bufnr) then
    vim.cmd('bdelete ' .. terminal_bufnr) -- Close the existing terminal buffer
  end

  vim.cmd('j')
  vim.cmd('j')
  vim.cmd('j')
  vim.cmd('j')
  vim.cmd('j')
  vim.cmd('belowright split')
  vim.cmd('terminal ' .. command) -- Run the command in the terminal

  -- Register the new terminal buffer number
  terminal_bufnr = vim.api.nvim_get_current_buf()
end

local function select_justfile_task()
  local tasks = parse_justfile_tasks()
  if #tasks == 0 then
    print('No tasks found.')
    return
  end
  pickers
    .new({}, {
      prompt_title = 'Select a Justfile Task',
      finder = finders.new_table {
        results = tasks,
        entry_maker = function(entry)
          return {
            value = entry,
            display = entry,
            ordinal = entry,
          }
        end,
      },
      sorter = sorters.get_fuzzy_file(),
      attach_mappings = function(_, map)
        map('i', '<CR>', function(prompt_bufnr)
          local selection = require('telescope.actions.state').get_selected_entry(prompt_bufnr)
          require('telescope.actions').close(prompt_bufnr)
          open_terminal('just ' .. selection.value) -- Open the terminal with the command
        end)
        return true
      end,
    })
    :find()
end

select_justfile_task()
