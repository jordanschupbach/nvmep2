require('which-key').setup {
  preset = 'classic',
  -- preset = 'helix'
}
local wk = require('which-key')
wk.add {
  { '<Space>a', group = 'Aerial' },
  { '<Space>b', group = 'Buffers' },
  { '<Space>c', group = 'Code' },
  { '<Space>g', group = 'Git/go' },
  { '<Space>m', group = 'Make' },
  { '<Space>o', group = 'Open' },
  { '<Space>p', group = 'Project' },
  { '<Space>t', group = 'Tab' },
  { '<Space>u', group = 'Ui' },
  { '<Space>w', group = 'Window/Workspace' },
  { '<Space>y', group = 'Snippet' },
}
