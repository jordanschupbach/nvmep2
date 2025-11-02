-- local root_files = {
--   '.git',
-- }

vim.lsp.start {
  name = 'zls',
  cmd = { 'zls' },
  filetypes = { 'zig', 'zir' },
  root_markers = { 'zls.json', 'build.zig', '.git' },
  workspace_required = false,
}
