local scripts = require('config.scripts')

vim.g.mapleader = " "
vim.o.number = true
vim.wo.relativenumber = false


vim.keymap.set('n', '<leader>1',  scripts.toggleNumber, {noremap = false})

vim.keymap.set('n', '<leader>2',  scripts.toggleRelativeNumber, {noremap = false})

vim.keymap.set('n', '<leader>w', '<cmd>w | so%<CR>')

vim.keymap.set({'n', 't'}, '<C-t>', scripts.toggleTerminal, { noremap = true, silent = true, desc = "Abrir terminal abaixo com dir atual" })
 
