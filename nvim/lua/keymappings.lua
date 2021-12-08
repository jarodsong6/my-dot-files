local opts_ns = { noremap=true, silent=true }
local opts_n  = { noremap=true, }

vim.g.mapleader = ','

-- convinient convenient
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<Leader>x', ':xa<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<Leader>q', ':qa!<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<Leader>e', ':e ', opts_n)
vim.api.nvim_set_keymap('n', '<Leader>v', ':vsplit ', opts_n)
vim.api.nvim_set_keymap('n', '<Leader>s', ':split ', opts_n)

-- Automatically clears search highlight when cursor is moved
vim.api.nvim_set_keymap('n', '<CR>', ':noh<CR>', opts_ns)

-- vim-fugitive
vim.api.nvim_set_keymap('n', '<Leader>gb', ':Git blame<CR>', opts_ns)

-- nvim-tree
vim.api.nvim_set_keymap('n', '<Leader>f', ':NvimTreeToggle<CR>', opts_ns)

-- Telescope
vim.api.nvim_set_keymap("n", "<Leader>o", "<CMD>Telescope find_files<CR>", opts_ns)
vim.api.nvim_set_keymap("n", "<Leader>h", "<CMD>Telescope oldfiles<CR>", opts_ns)
vim.api.nvim_set_keymap("n", "<Leader>a", ":Rg ", opts_n)

-- hop.nvim
vim.api.nvim_set_keymap("n", ";w", ":HopWord<CR>", opts_ns)
vim.api.nvim_set_keymap("v", ";w", "<CMD>HopWord<CR>", opts_ns)
vim.api.nvim_set_keymap("n", ";j", ":HopLine<CR>", opts_ns)
vim.api.nvim_set_keymap("v", ";j", "<CMD>HopLine<CR>", opts_ns)

-- any-jump
vim.api.nvim_set_keymap("n", "<Leader>j", ":AnyJump<CR>", opts_ns)
vim.api.nvim_set_keymap("n", "<Leader>j", ":AnyJumpVisual<CR>", opts_ns)

-- tagbar
vim.api.nvim_set_keymap("n", "<Leader>m", ":TagbarToggle<CR>", opts_ns)

-- lsp nav
vim.api.nvim_set_keymap('n', 'gD', '<CMD>lua vim.lsp.buf.declaration()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', 'gd', '<CMD>lua vim.lsp.buf.definition()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', 'K', '<CMD>lua vim.lsp.buf.hover()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', 'gi', '<CMD>lua vim.lsp.buf.implementation()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<C-k>', '<CMD>lua vim.lsp.buf.signature_help()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<space>wa', '<CMD>lua vim.lsp.buf.add_workspace_folder()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<space>wr', '<CMD>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<space>wl', '<CMD>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<space>D', '<CMD>lua vim.lsp.buf.type_definition()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<space>rn', '<CMD>lua vim.lsp.buf.rename()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<space>ca', '<CMD>lua vim.lsp.buf.code_action()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', 'gr', '<CMD>lua vim.lsp.buf.references()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<space>e', '<CMD>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '[d', '<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', ']d', '<CMD>lua vim.lsp.diagnostic.goto_next()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<space>q', '<CMD>lua vim.lsp.diagnostic.set_loclist()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<space>f', '<CMD>lua vim.lsp.buf.formatting()<CR>', opts_ns)
