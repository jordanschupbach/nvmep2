if vim.g.did_load_telescope_plugin then
  return
end
vim.g.did_load_telescope_plugin = true

local telescope = require('telescope')
local actions = require('telescope.actions')
local actions_state = require('telescope.actions.state')

local builtin = require('telescope.builtin')

local layout_config = {
  vertical = {
    width = function(_, max_columns)
      return math.floor(max_columns * 0.99)
    end,
    height = function(_, _, max_lines)
      return math.floor(max_lines * 0.99)
    end,
    prompt_position = 'bottom',
    preview_cutoff = 0,
  },
}

-- Fall back to find_files if not in a git repo
local project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(builtin.git_files, opts)
  if not ok then
    builtin.find_files(opts)
  end
end

---@param picker function the telescope picker to use
local function grep_current_file_type(picker)
  local current_file_ext = vim.fn.expand('%:e')
  local additional_vimgrep_arguments = {}
  if current_file_ext ~= '' then
    additional_vimgrep_arguments = {
      '--type',
      current_file_ext,
    }
  end
  local conf = require('telescope.config').values
  picker {
    vimgrep_arguments = vim.tbl_flatten {
      conf.vimgrep_arguments,
      additional_vimgrep_arguments,
    },
  }
end

--- Grep the string under the cursor, filtering for the current file type
local function grep_string_current_file_type()
  grep_current_file_type(builtin.grep_string)
end

--- Live grep, filtering for the current file type
local function live_grep_current_file_type()
  grep_current_file_type(builtin.live_grep)
end

--- Like live_grep, but fuzzy (and slower)
local function fuzzy_grep(opts)
  opts = vim.tbl_extend('error', opts or {}, { search = '', prompt_title = 'Fuzzy grep' })
  builtin.grep_string(opts)
end

local function fuzzy_grep_current_file_type()
  grep_current_file_type(fuzzy_grep)
end

---@diagnostic disable-next-line: unused-function
local function file_exists(filename)
  local file = io.open(filename, 'r')
  if file then
    io.close(file)
    return true
  else
    return false
  end
end

---@diagnostic disable-next-line: unused-local, unused-function
local function on_project_selected(prompt_bufnr)
  local entry = actions_state.get_selected_entry()
  vim.cmd('cd ' .. entry['value']) -- change to project directory
  vim.cmd('Direnv allow') -- change to project directory
  -- vim.cmd('Direnv reload') -- change to project directory
  actions.close(prompt_bufnr)
  if entry['value']:gsub('/+$', ''):match('([^/]+)$') == 'nvim-playground' then
    vim.cmd('edit ' .. entry['value'] .. '/init.lua')
  else
    if file_exists('' .. entry['value'] .. '/README.org') then
      vim.cmd('edit ' .. entry['value'] .. '/README.org')
    else
      vim.cmd('edit ' .. entry['value'] .. '/README.md')
    end
  end
  vim.cmd('NvimTreeToggle')
  vim.cmd('wincmd l')
  vim.cmd('split')
  vim.cmd('wincmd j')
  vim.cmd('term')
  vim.api.nvim_win_set_height(0, 8)
  vim.cmd('wincmd k')
end

vim.keymap.set('n', '<leader>tp', function()
  builtin.find_files()
end, { desc = '[t]elescope find files - ctrl[p] style' })
vim.keymap.set('n', '<M-p>', builtin.oldfiles, { desc = '[telescope] old files' })
vim.keymap.set('n', '<C-g>', builtin.live_grep, { desc = '[telescope] live grep' })
vim.keymap.set('n', '<leader>tf', fuzzy_grep, { desc = '[t]elescope [f]uzzy grep' })
vim.keymap.set('n', '<M-f>', fuzzy_grep_current_file_type, { desc = '[telescope] fuzzy grep filetype' })
vim.keymap.set('n', '<M-g>', live_grep_current_file_type, { desc = '[telescope] live grep filetype' })
vim.keymap.set(
  'n',
  '<leader>t*',
  grep_string_current_file_type,
  { desc = '[t]elescope grep current string [*] in current filetype' }
)
vim.keymap.set('n', '<leader>*', builtin.grep_string, { desc = '[telescope] grep current string [*]' })
vim.keymap.set('n', '<leader>tg', project_files, { desc = '[t]elescope project files [g]' })
vim.keymap.set('n', '<leader>tc', builtin.quickfix, { desc = '[t]elescope quickfix list [c]' })
vim.keymap.set('n', '<leader>tq', builtin.command_history, { desc = '[t]elescope command history [q]' })
vim.keymap.set('n', '<leader>tl', builtin.loclist, { desc = '[t]elescope [l]oclist' })
vim.keymap.set('n', '<leader>tr', builtin.registers, { desc = '[t]elescope [r]egisters' })
vim.keymap.set('n', '<leader>tbb', builtin.buffers, { desc = '[t]elescope [b]uffers [b]' })
vim.keymap.set(
  'n',
  '<leader>tbf',
  builtin.current_buffer_fuzzy_find,
  { desc = '[t]elescope current [b]uffer [f]uzzy find' }
)
vim.keymap.set('n', '<leader>td', builtin.lsp_document_symbols, { desc = '[t]elescope lsp [d]ocument symbols' })
vim.keymap.set(
  'n',
  '<leader>to',
  builtin.lsp_dynamic_workspace_symbols,
  { desc = '[t]elescope lsp dynamic w[o]rkspace symbols' }
)

local project_actions = require('telescope._extensions.project.actions')

telescope.setup {
  defaults = {
    path_display = {
      'truncate',
    },
    layout_strategy = 'vertical',
    layout_config = layout_config,
    mappings = {
      i = {
        ['<C-q>'] = actions.send_to_qflist,
        ['<C-l>'] = actions.send_to_loclist,
        -- ['<esc>'] = actions.close,
        ['<C-s>'] = actions.cycle_previewers_next,
        ['<C-a>'] = actions.cycle_previewers_prev,

        ['<C-h>'] = 'which_key',
      },
      n = {
        q = actions.close,
      },
    },
    preview = {
      treesitter = true,
    },
    history = {
      path = vim.fn.stdpath('data') .. '/telescope_history.sqlite3',
      limit = 1000,
    },
    color_devicons = true,
    set_env = { ['COLORTERM'] = 'truecolor' },
    prompt_prefix = '   ',
    selection_caret = '  ',
    entry_prefix = '  ',
    initial_mode = 'insert',
    vimgrep_arguments = {
      'rg',
      '-L',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },

    project = {
      hidden_files = true, -- default: false
      theme = 'dropdown',
      order_by = 'asc',
      search_by = 'title',
      sync_with_nvim_tree = false, -- default false
      -- default for on_project_selected = find project files
      on_project_selected = function(prompt_bufnr)
        on_project_selected(prompt_bufnr)
      end,

      mappings = {
        n = {
          ['d'] = project_actions.delete_project,
          ['r'] = project_actions.rename_project,
          ['c'] = project_actions.add_project,
          ['C'] = project_actions.add_project_cwd,
          ['f'] = project_actions.find_project_files,
          ['b'] = project_actions.browse_project_files,
          ['s'] = project_actions.search_in_project_files,
          ['R'] = project_actions.recent_project_files,
          ['w'] = project_actions.change_working_directory,
          ['o'] = project_actions.next_cd_scope,
        },
        i = {
          ['<c-d>'] = project_actions.delete_project,
          ['<c-v>'] = project_actions.rename_project,
          ['<c-i>'] = project_actions.add_project,
          ['<c-A>'] = project_actions.add_project_cwd,
          ['<c-f>'] = project_actions.find_project_files,
          ['<c-b>'] = project_actions.browse_project_files,
          ['<c-s>'] = project_actions.search_in_project_files,
          ['<c-r>'] = project_actions.recent_project_files,
          ['<c-l>'] = project_actions.change_working_directory,
          ['<c-o>'] = project_actions.next_cd_scope,
        },
      },
    },
  },
}

telescope.load_extension('fzy_native')
-- telescope.load_extension('smart_history')
