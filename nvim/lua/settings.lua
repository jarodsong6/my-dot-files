vim.o.number        = true                                --- Shows current line number
vim.o.wrap          = true                                --- Wrap long lines
vim.o.viminfo       = "'1000"                             --- Increase the size of file history
vim.o.encoding      = "utf-8"                             --- The encoding displayed
vim.o.fileencodings = "utf-8,euc-jp,iso-2022-jp,sjis"     --- The encoding displayed
vim.o.incsearch     = true                                --- Start searching before pressing enter
vim.o.smartcase     = true
vim.o.hlsearch      = true
vim.o.ignorecase    = true
vim.o.autoread      = true
vim.o.binary        = true
vim.o.smarttab      = true                                --- Makes tabbing smarter will realize you have 2 vs 4
vim.o.smartindent   = true                                --- Makes indenting smart
vim.o.autoindent    = true                                --- Good auto indent
vim.o.expandtab     = true
vim.o.tabstop       = 2                                   --- Insert 2 spaces for a tab
vim.o.softtabstop   = 2                                   --- Insert 2 spaces for a tab
vim.o.shiftwidth    = 2                                   --- Change a number of space characeters inseted for indentation
vim.o.termguicolors = true                                --- Correct terminal colors
vim.o.hidden        = true                                --- Required to keep multiple buffers open multiple buffers
vim.o.cmdheight     = 2                                   --- Give more space for displaying messages
vim.o.updatetime    = 300                                 --- Faster completion
vim.o.shortmess     = vim.o.shortmess .. 'c'              --- Don't pass messages to |ins-completion-menu|
vim.o.signcolumn    = "number"                            --- Add extra sign column next to line number
vim.o.list          = true
vim.o.completeopt   = "menuone,noinsert,noselect"

vim.opt.listchars = {
  tab = '│ ',
  trail = '~',
  extends = '>',
  precedes = '<'
}

vim.cmd('colorscheme seoul256')

vim.cmd('filetype plugin indent on')                        --- Enables plugin & indent
vim.cmd([[
augroup MyColors
autocmd!
autocmd VimEnter * highlight vertsplit guifg=bg guibg=bg
augroup end
]])                                                         --- hide vertical bar

-- toggle window size
vim.api.nvim_set_keymap("n", "<Leader>t", ":call ToggleWindowSize()<CR>", { noremap = true, silent = true })
vim.g.CurWinMax = 0
vim.cmd([[
function! ToggleWindowSize()
    if g:CurWinMax
        let g:CurWinMax = 0
        execute "wincmd ="
    else
        let g:CurWinMax = 1
        execute "wincmd |"
        execute "wincmd _"
    endif
endfunction
]])                                                         --- hide vertical bar

-- diagnostic
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
