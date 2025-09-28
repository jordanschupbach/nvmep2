
local function mymap(mode, key, value)
  vim.keymap.set(mode, key, value, { silent = true, remap = true })
end

mymap({ "n", "x", "o" }, "s", function() require("flash").jump() end)
mymap({ "n", "x", "o" }, "S", function() require("flash").treesitter() end)
mymap("o", "r", function() require("flash").remote() end)
mymap({ "o", "x" }, "R", function() require("flash").treesitter_search() end)
-- mymap("c", "<c-s>", function() require("flash").toggle() end)
