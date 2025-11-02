
vim.defer_fn(function()
  vim.lsp.start {
    {
      cmd = { 'phpactor', 'language-server' },
      filetypes = { 'php' },
      root_markers = { '.git', 'composer.json', '.phpactor.json', '.phpactor.yml' },
      workspace_required = true,
    }
  }
end, 1000)
