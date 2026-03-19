require('which-key').setup {
  preset = 'classic',
  -- preset = 'helix'
}
local wk = require('which-key')
wk.add {
  { '<Space>a', group = 'Aerial' },
}
