require('which-key').setup {
  preset = 'classic',
  -- preset = 'helix'
}
local wk = require('which-key')
-- 󱪳󰟝󱕘 󱡶󱜚󱜙󱘎󱓞󱓟󱒉󱎯󱍊󱇪󱇫󱁾󱁕󱁊󱁉󰻈󰺛󰸘󰸗󰴻󰴺󰴭󰳆󰱐󰭎
-- 󰨡󰨆󰨊󰨈󰧲󰧱󰧰󰧊󰧑󰥨󰥩󰤑󰣙󰣘󰡴󰟁󰜏󰙨󰑣󰒪󰐅󰐁󰌢󰋸󰊢󰅎󰅏󰃤󰂒󰂓󰂖󰂚󰂞
-- 
-- ⭘
wk.add {
  { '<Space>a', group = 'Aerial', icon = '' },
  { '<Space>b', group = 'Buffers' },
  { '<Space>c', group = 'Code' },
  { '<Space>d', group = 'Debug', icon = '' },
  { '<Space>e', group = 'Errors', icon = '' },
  { '<Space>e', group = 'File', icon = '' },
  { '<Space>g', group = 'Git/go', icon = '' },
  { '<Space>h', group = 'Help', icon = '' },
  { '<Space>m', group = 'Make' },
  { '<Space>o', group = 'Open' },
  { '<Space>p', group = 'Project', icon = '' },
  { '<Space>r', group = 'Run', icon = '' },
  { '<Space>t', group = 'Tab' },
  { '<Space>u', group = 'Ui' },
  { '<Space>w', group = 'Window/Workspace', icon = '󱪳' },
  { '<Space>y', group = 'Snippet' },
  { '<Space>z', '<CMD>ZenMode<CR>', mode = 'n', icon = '' },
}
