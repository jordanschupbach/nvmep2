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
-- valid colors are: `azure`, `blue`, `cyan`, `green`, `grey`, `orange`, `purple`, `red`, `yellow`
wk.add {
  { '<Space>a', group = 'Aerial', icon = '', color = 'cyan' },
  { '<Space>b', group = 'Buffers', icon = '' },
  { '<Space>c', group = 'Code', icon = '', color = 'orange' },
  { '<Space>d', group = 'Debug', icon = '', color = 'red' },
  { '<Space>e', group = 'Errors', icon = '', color = 'red' },
  { '<Space>f', group = 'File', icon = '', color = 'blue' },
  { '<Space>g', group = 'Git/go', icon = '', color = 'red' },
  { '<Space>h', group = 'Help', icon = '', color = 'purple' },
  { '<Space>m', group = 'Make', icon = '', color = 'yellow' },
  { '<Space>o', group = 'Open', icon = '', color = 'azure' },
  { '<Space>p', group = 'Project', icon = '', color = 'purple' },
  { '<Space>r', group = 'Run', icon = '', color = 'red' },
  { '<Space>t', group = 'Tab', icon = '' },
  { '<Space>u', group = 'Ui', icon = '', color = 'cyan' },
  { '<Space>w', group = 'Window/Workspace', icon = '', color = 'orange' },
  { '<Space>y', group = 'Snippet', icon = '', color = 'blue' },
  { '<Space>z', '<CMD>ZenMode<CR>', mode = 'n', icon = '', color = 'grey' },
  { '<Space><return>', '<CMD>Nuake<CR>', mode = 'n', icon = '', color = 'grey' },
  { '<Space><Space>', '<CMD>JustRun<CR>', mode = 'n', icon = '󱕘', color = 'orange' },
  { '<Space>j', '<CMD>JustSelect<CR>', mode = 'n', icon = '', color = 'orange' },
}
