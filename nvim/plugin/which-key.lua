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
  { '<Space>a', group = 'Aerial', wk.Icon { icon = '', color = 'cyan' } },
  { '<Space>b', group = 'Buffers', wk.Icon { icon = '', color = 'azure' } },
  { '<Space>c', group = 'Code', wk.Icon { icon = '', color = 'orange' } },
  { '<Space>d', group = 'Debug', wk.Icon { icon = '', color = 'red' } },
  { '<Space>e', group = 'Errors', wk.Icon { icon = '', color = 'red' } },
  { '<Space>f', group = 'File', wk.Icon { icon = '', color = 'blue' } },
  { '<Space>g', group = 'Git/go', wk.Icon { icon = '', color = 'red' } },
  { '<Space>h', group = 'Help', wk.Icon { icon = '', color = 'purple' } },
  { '<Space>m', group = 'Make', wk.Icon { icon = '', color = 'yellow' } },
  { '<Space>o', group = 'Open', wk.Icon { icon = '', color = 'azure' } },
  { '<Space>p', group = 'Project', wk.Icon { icon = '', color = 'purple' } },
  { '<Space>r', group = 'Run', wk.Icon { icon = '', color = 'red' } },
  { '<Space>t', group = 'Tab', wk.Icon { icon = '', color = 'cyan' } },
  { '<Space>u', group = 'Ui', wk.Icon { icon = '', color = 'cyan' } },
  { '<Space>w', group = 'Window/Workspace', wk.Icon { icon = '', color = 'orange' } },
  { '<Space>y', group = 'Snippet', wk.Icon { icon = '', color = 'blue' } },
  { '<Space>z', '<CMD>ZenMode<CR>', mode = 'n', wk.Icon { icon = '', color = 'grey' } },
  { '<Space><return>', '<CMD>Nuake<CR>', mode = 'n', wk.Icon { icon = '', color = 'grey' } },
  { '<Space><Space>', '<CMD>JustRun<CR>', mode = 'n', wk.Icon { icon = '󱕘', color = 'orange' } },
  { '<Space>j', '<CMD>JustSelect<CR>', mode = 'n', wk.Icon { icon = '', color = 'orange' } },
}
