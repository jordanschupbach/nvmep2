local function mymap(mode, key, value)
  vim.keymap.set(mode, key, value, { silent = true, remap = true })
end

local root_files = {
  '.git',
}

mymap('n', '<A-S-return>', '<CMD>RunJust<CR>')
mymap('n', '<Space>rr', '<CMD>RunJust<CR>')

vim.lsp.start {
  name = 'cpp',
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  cmd = { 'clangd' },
  root_markers = { '.clangd', 'compile_commands.json' },
  filetypes = { 'c', 'cpp' },
  capabilities = require('user.lsp').make_client_capabilities(),
}

local dap = require('dap')
dap.adapters.gdb = {
  type = 'executable',
  command = 'gdb',
  args = { '--interpreter=dap', '--eval-command', 'set print pretty on' },
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'gdb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtBeginningOfMainSubprogram = false,
  },
  {
    name = 'Select and attach to process',
    type = 'gdb',
    request = 'attach',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    pid = function()
      local name = vim.fn.input('Executable name (filter): ')
      return require('dap.utils').pick_process { filter = name }
    end,
    cwd = '${workspaceFolder}',
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'gdb',
    request = 'attach',
    target = 'localhost:1234',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
  },
}

mymap('n', '<Space>du', '<CMD>lua require"dapui".open()<CR>')
mymap('n', '<Space>db', '<CMD>DapToggleBreakpoint<CR>')
mymap('n', '<Space>dd', '<CMD>DapContinue<CR>')
mymap('n', '<Space>dO', '<CMD>DapStepOut<CR>')
mymap('n', '<Space>di', '<CMD>DapStepInto<CR>')
mymap('n', '<Space>do', '<CMD>DapStepOver<CR>')
mymap('n', '<Space>dC', '<CMD>DapClearBreakpoints<CR>')
mymap('n', '<Space>dR', '<CMD>DapRestartFrame<CR>')
mymap('n', '<Space>dP', '<CMD>DapPause<CR>')

-- -- dap.configurations.cpp = dap.configurations.c
-- -- dap.configurations.rust = dap.configurations.c
