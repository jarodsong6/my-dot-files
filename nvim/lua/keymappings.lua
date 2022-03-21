local opts_ns = { noremap=true, silent=true }
local opts_n  = { noremap=true, }

vim.g.mapleader = ','

-- convinient convenient
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<Leader>x', ':xa<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<Leader>q', ':qa!<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<Leader>e', ':e ', opts_n)
vim.api.nvim_set_keymap('n', '<Leader>v', ':vsplit ', opts_n)
vim.api.nvim_set_keymap('n', '<Leader>c', ':close<CR>', opts_ns)
vim.cmd [[autocmd BufReadPost quickfix nnoremap <buffer> j :cn<CR>]]
vim.cmd [[autocmd BufReadPost quickfix nnoremap <buffer> k :cp<CR>]]


-- vim-fugitive
vim.api.nvim_set_keymap('n', '<Leader>gb', ':Git blame<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<Leader>gs', ':Git<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<Leader>gd', ':Git diff<CR>', opts_ns)

-- nvim-tree
vim.api.nvim_set_keymap('n', '<Leader>f', ':NeoTreeReveal<CR>', opts_ns)

-- Telescope
vim.api.nvim_set_keymap("n", "<Leader>o", "<CMD>Telescope find_files no_ignore=true hidden=true<CR>", opts_ns)
vim.api.nvim_set_keymap("n", "<Leader>h", "<CMD>Telescope oldfiles<CR>", opts_ns)
vim.api.nvim_set_keymap('n', '<Leader>s', '<CMD>Telescope current_buffer_fuzzy_find<CR>', opts_ns)
vim.api.nvim_set_keymap("n", "<Leader>a", "<CMD>lua require('fzf-lua').grep()<CR>", opts_n)
vim.api.nvim_set_keymap('n', '<space>ca', '<CMD>Telescope lsp_code_actions<CR>', opts_ns)
vim.api.nvim_set_keymap('v', '<space>ca', '<CMD>Telescope lsp_range_code_actions<CR>', opts_ns)
vim.api.nvim_set_keymap("n", "<Leader>ld", "<CMD>Telescope diagnostics<CR>", opts_ns)
vim.api.nvim_set_keymap('n', 'gr', '<CMD>Telescope lsp_references<CR>', opts_ns)
vim.api.nvim_set_keymap("n", "gs", "<CMD>Telescope grep_string<CR>", opts_ns)

-- hop.nvim
vim.api.nvim_set_keymap("n", ";w", ":HopWord<CR>", opts_ns)
vim.api.nvim_set_keymap("v", ";w", "<CMD>HopWord<CR>", opts_ns)
vim.api.nvim_set_keymap("n", ";j", ":HopLine<CR>", opts_ns)
vim.api.nvim_set_keymap("v", ";j", "<CMD>HopLine<CR>", opts_ns)

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
vim.api.nvim_set_keymap('n', '<space>e', '<CMD>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '[d', '<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', ']d', '<CMD>lua vim.lsp.diagnostic.goto_next()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<space>q', '<CMD>lua vim.lsp.diagnostic.set_loclist()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<space>f', '<CMD>lua vim.lsp.buf.formatting()<CR>', opts_ns)

-- nvim-dap
vim.api.nvim_set_keymap('n', '<Leader>b', '<CMD>lua require("dap").toggle_breakpoint()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<Leader>do', '<CMD>lua require("dap").step_over()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<Leader>dt', '<CMD>lua require("dap").step_out()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<Leader>di', '<CMD>lua require("dap").step_into()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<Leader>dc', '<CMD>lua require("dap").continue()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<Leader>dr', '<CMD>lua require("dap").repl.open()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<Leader>dh', '<CMD>lua require("dap.ui.widgets").hover()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<Leader>ds', '<CMD>lua require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes)<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<Leader>df', '<CMD>lua require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames)<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<Leader>db', '<CMD>lua require"telescope".extensions.dap.list_breakpoints{}<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<Leader>dju', '<CMD>lua require"jdtls".test_class()<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<Leader>djt', '<CMD>lua require"jdtls".test_nearest_method()<CR>', opts_ns)

-- trouble.nvim
vim.api.nvim_set_keymap('n', '<Leader>td', '<CMD>TroubleToggle document_diagnostics<CR>', opts_ns)
vim.api.nvim_set_keymap('n', '<Leader>tw', '<CMD>TroubleToggle workspace_diagnostics<CR>', opts_ns)
