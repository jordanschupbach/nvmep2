local root_files = {
  '.git',
}

vim.lsp.start {
  name = 'ruby',
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  cmd = { 'ruby-lsp' },
  filetypes = { 'ruby', 'eruby' },
  root_markers = { 'Gemfile', '.git' },
  init_options = {
    formatter = 'auto',
  },
  reuse_client = function(client, config)
    config.cmd_cwd = config.root_dir
    return client.config.cmd_cwd == config.cmd_cwd
  end,
}
