-- default settings
require('justice').setup {
  -- Defines how recipe modes are determined. For example, if a recipe has
  -- "download" in the name, or if it has "streaming" or "curl" in the comment,
  -- it will be considered a "streaming" recipe.
  -- (strings are interpreted as lua patterns, thus `-` needs to be escaped as `%-`)
  recipeModes = {
    streaming = { -- useful for progress bars (requires `snacks.nvim`)
      name = { 'download' },
      comment = { 'streaming', 'curl' }, -- comment contains "streaming" or "curl"
    },
    terminal = { -- useful for recipes with input
      name = {},
      comment = { 'input', 'terminal', 'fzf' },
    },
    quickfix = {
      name = { '%-qf$' }, -- name ending with "-qf"
      comment = { 'quickfix' },
    },
    ignore = { -- hides them from the nvim-justice selection window
      name = {},
      comment = {},
    },
  },
  window = {
    border = getBorder(), -- `vim.o.winborder` on nvim 0.11, otherwise "rounded"
    recipeCommentMaxLen = 35,
    keymaps = {
      next = '<Tab>',
      prev = '<S-Tab>',
      runRecipeUnderCursor = '<CR>',
      runFirstRecipe = '1',
      closeWin = { 'q', '<Esc>' },
      showRecipe = '<Space>',
      showVariables = '?',
      dontUseForQuickKey = { 'j', 'k', '-', '_' },
    },
    highlightGroups = {
      quickKey = 'Keyword',
      icons = 'Function',
    },
    icons = {
      just = '󰖷',
      streaming = 'ﲋ',
      quickfix = '',
      terminal = '',
      ignore = '󰈉',
      recipeParameters = '󰘎',
    },
  },
  terminal = {
    height = 10,
  },
}
