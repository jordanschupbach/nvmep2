local telescope = require('telescope')

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

local function select_justfile_task()
  local tasks = parse_justfile_tasks()
  if #tasks == 0 then
    print('No tasks found.')
    return
  end
  telescope.pickers
    .new({}, {
      prompt_title = 'Select a Justfile Task',
      finder = telescope.finders.new_table {
        results = tasks,
        entry_maker = function(entry)
          return {
            value = entry,
            display = entry,
            ordinal = entry,
          }
        end,
      },
      sorter = telescope.sorters.get_fuzzy_file(),
      attach_mappings = function(_, map)
        map('i', '<CR>', function(prompt_bufnr)
          local selection = require('telescope.actions.state').get_selected_entry(prompt_bufnr)
          print('Selected task: ' .. selection.value)
          require('telescope.actions').close(prompt_bufnr) -- Close Telescope
        end)
        return true
      end,
    })
    :find()
end

-- Call the function to select a Justfile task
select_justfile_task()
