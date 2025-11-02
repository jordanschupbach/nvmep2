vim.lsp.start {
  name = 'fortls',
  cmd = { 'fortls' },
  filetypes = { 'fortran' },
  root_dir = vim.fs.dirname(vim.fs.find({ '.git' }, { upward = true })[1]),
}
