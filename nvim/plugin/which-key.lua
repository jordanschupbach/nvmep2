require('which-key').setup {
  preset = 'classic',
  -- preset = 'helix'
}
local wk = require('which-key')
-- 󱪳󰟝󱕘 󱡶󱜚󱜙󱘎󱓞󱓟󱒉󱎯󱍊󱇪󱇫󱁾󱁕󱁊󱁉󰻈󰺛󰸘󰸗󰴻󰴺󰴭󰳆󰱐󰭎
-- 󰨡󰨆󰨊󰨈󰧲󰧱󰧰󰧊󰧑󰥨󰥩󰤑󰣙󰣘󰡴󰟁󰜏󰙨󰑣󰒪󰐅󰐁󰌢󰋸󰊢󰅎󰅏󰃤󰂒󰂓󰂖󰂚󰂞
-- 
-- ⭘
-- 
-- 󰂒󰃇󰃤󰃠󰃠󰃝󰄰󰄯󰈝󰈪  

wk.add {
  { '<Space>a', group = 'Aerial', icon = '' },
  { '<Space>b', group = 'Buffers', icon = '' },
  { '<Space>c', group = 'Code', icon = '' },
  { '<Space>d', group = 'Debug', icon = '' },
  { '<Space>e', group = 'Errors', icon = '' },
  { '<Space>f', group = 'File', icon = '' },
  { '<Space>g', group = 'Git/go', icon = '' },
  { '<Space>h', group = 'Help', icon = '' },
  { '<Space>m', group = 'Make', icon = '' },
  { '<Space>o', group = 'Open', icon = '' },
  { '<Space>p', group = 'Project', icon = '' },
  { '<Space>r', group = 'Run', icon = '' },
  { '<Space>t', group = 'Tab', icon = '' },
  { '<Space>u', group = 'Ui', icon = '' },
  { '<Space>w', group = 'Window/Workspace', icon = '' },
  { '<Space>y', group = 'Snippet', icon = '' },
  { '<Space>z', '<CMD>ZenMode<CR>', mode = 'n', icon = '' },
  { '<Space><return>', '<CMD>Nuake<CR>', mode = 'n', icon = '' },
  { '<Space><Space>', '<CMD>JustRun<CR>', mode = 'n', icon = '󱕘' },
  { '<Space>j', '<CMD>JustSelect<CR>', mode = 'n', icon = '' },
}
