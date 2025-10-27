-- Ensure you have `nvim-lspconfig` installed
local lspconfig = require('lspconfig')

-- Configure Bash Language Server
lspconfig.bashls.setup {
  cmd = { 'bash-language-server', 'start' }, -- Command to start the server
  filetypes = { 'sh', 'bash' }, -- Specify the file types
  root_dir = lspconfig.util.root_pattern('.git', vim.fn.getcwd()), -- Define root directory
  settings = {}, -- Add any specific settings if needed
}
