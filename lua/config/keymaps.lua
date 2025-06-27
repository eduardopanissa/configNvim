local scripts = require('config.scripts')

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set('n', '<leader>1',  scripts.toggleNumber, {noremap = false})

vim.keymap.set('n', '<leader>2',  scripts.toggleRelativeNumber, {noremap = false})

vim.keymap.set('n', '<leader>w', '<cmd>w | so %<CR>')

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>',{silent = true})

vim.keymap.set('n', '<S-w>', '<cmd>w<CR>',{silent = true, noremap = true})

vim.keymap.set({'n', 't'}, '<C-t>', scripts.toggleTerminal, { noremap = true, silent = true, desc = "Abrir terminal abaixo com dir atual" })

vim.keymap.set({'n'}, '<leader>i', scripts.pyTerm, { noremap = true, silent = true, desc = "Abrir terminal abaixo com dir atual e executa python no arquivo do buffer atual" })


