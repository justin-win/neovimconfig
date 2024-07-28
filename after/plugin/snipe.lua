vim.cmd.packadd "snipe.nvim"
local snipe = require("snipe")
snipe.setup()
vim.keymap.set("n", "<A-b>", snipe.toggle_buffer_menu())

