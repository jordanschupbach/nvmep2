local root_files = {
  '.git',
}

vim.lsp.start {
  name = 'sh',
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'sh', 'bash' },
  settings = {}, -- Add any specific settings if needed
}
