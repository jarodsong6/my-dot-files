packadd hop.nvim

set number
" set mouse=a
" set clipboard=unnamedplus
set virtualedit=all

lua << EOF

local opts_ns = { noremap=true, silent=true }

vim.g.mapleader = ","

vim.g.maplocalleader = ","

vim.api.nvim_set_keymap('n', 'q', ':qa!<CR>', opts_ns)

require'hop'.setup()

vim.api.nvim_set_keymap("n", ";w", ":HopWord<CR>", opts_ns)
vim.api.nvim_set_keymap("v", ";w", "<CMD>HopWord<CR>", opts_ns)
vim.api.nvim_set_keymap("n", ";j", ":HopLine<CR>", opts_ns)
vim.api.nvim_set_keymap("v", ";j", "<CMD>HopLine<CR>", opts_ns)

EOF
