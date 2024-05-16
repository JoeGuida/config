local vim = vim
local Plug = vim.fn['plug#']

vim.g.mapleader='\\'
vim.g.maplocalleader='\\\\'

vim.call('plug#begin')

Plug ('nvim-telescope/telescope.nvim')
Plug ('nvim-lua/plenary.nvim')
Plug ('ramojus/mellifluous.nvim')

vim.call('plug#end')
vim.cmd('set number')
vim.cmd('set tabstop=4')
vim.cmd('set shiftwidth=4')
vim.cmd('set expandtab')
vim.cmd('colorscheme mellifluous')
vim.cmd('set guicursor=n-v-c-i:block')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})