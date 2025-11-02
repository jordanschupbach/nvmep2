-- local root_files = {
--   '.git',
-- }

-- vim.lsp.enable {
--   'phpactor',
-- }
--
-- vim.lsp.config('phpactor', {
--   cmd = { 'phpactor', 'language-server' },
--   filetypes = { 'php' },
--   root_markers = { '.git' },
--   workspace_required = true,
-- })

vim.lsp.start {
  name = 'phpactor',
  cmd = { 'phpactor', 'language-server' },
}
