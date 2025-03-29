-- Telescope
vim.keymap.set("n", "t", function() vim.cmd("Telescope find_files") end)

-- Tree 
vim.keymap.set("n", "<Tab>", function() vim.cmd("NvimTreeFocus") end)

