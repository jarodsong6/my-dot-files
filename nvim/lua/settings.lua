vim.opt.number        = true                            --- Shows current line number
vim.opt.wrap          = true                            --- Wrap long lines
vim.opt.viminfo       = "'1000"                         --- Increase the size of file history
vim.opt.encoding      = "utf-8"                         --- The encoding displayed
vim.opt.fileencodings = "utf-8,euc-jp,iso-2022-jp,sjis" --- The encoding displayed
vim.opt.incsearch     = true                            --- Start searching before pressing enter
vim.opt.smartcase     = true
vim.opt.hlsearch      = true
vim.opt.ignorecase    = true
vim.opt.autoread      = true
vim.opt.binary        = true
vim.opt.smarttab      = true                   --- Makes tabbing smarter will realize you have 2 vs 4
vim.opt.smartindent   = true                   --- Makes indenting smart
vim.opt.autoindent    = true                   --- Good auto indent
vim.opt.expandtab     = true
vim.opt.tabstop       = 2                      --- Insert 2 spaces for a tab
vim.opt.softtabstop   = 2                      --- Insert 2 spaces for a tab
vim.opt.shiftwidth    = 2                      --- Change a number of space characeters inseted for indentation
vim.opt.termguicolors = true                   --- Correct terminal colors
vim.opt.hidden        = true                   --- Required to keep multiple buffers open multiple buffers
vim.opt.cmdheight     = 2                      --- Give more space for displaying messages
vim.opt.updatetime    = 300                    --- Faster completion
vim.opt.shortmess     = vim.o.shortmess .. 'c' --- Don't pass messages to |ins-completion-menu|
vim.opt.signcolumn    = "number"               --- Add extra sign column next to line number
vim.opt.list          = true
vim.opt.completeopt   = "menuone,noinsert,noselect"
vim.opt.timeoutlen    = 200
vim.opt.jumpoptions   = "stack"
vim.opt.mouse         = ""
vim.opt.breakindent   = true

vim.o.foldcolumn      = '1' -- '0' is not bad
vim.o.foldlevel       = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart  = 99
vim.o.foldenable      = true

vim.opt.listchars     = {
  tab = '│ ',
  trail = '~',
  extends = '>',
  precedes = '<'
}

vim.cmd.colorscheme "catppuccin"

vim.cmd('filetype plugin indent on') --- Enables plugin & indent
vim.cmd([[
augroup MyColors
  autocmd!
  autocmd VimEnter * highlight vertsplit guifg=bg guibg=bg
  autocmd VimEnter * highlight FloatBorder guifg=fg_white
augroup END
]]) --- hide vertical bar

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
]]) --- hide vertical bar

-- preservim/tagbar
vim.g.tagbar_ctags_bin = '/opt/homebrew/bin/ctags'

-- vim-illuminate
vim.cmd([[
augroup illuminate_augroup
  autocmd!
  autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
augroup END
]])

-- diagnostic
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, border='single'})]]
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    -- try_lint without arguments runs the linters defined in `linters_by_ft`
    -- for the current filetype
    require("lint").try_lint()
  end,
})

-- format on save
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp", { clear = true }),
  callback = function(args)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = args.buf,
      callback = function()
        vim.lsp.buf.format {async = false, id = args.data.client_id }
      end,
    })
  end
})
