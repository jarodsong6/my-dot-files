" vim-plug (https://github.com/junegunn/vim-plug) settings 
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'easymotion/vim-easymotion'
Plug 'preservim/tagbar'
Plug 'itchyny/lightline.vim'
Plug 'elzr/vim-json'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-slash'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'rakr/vim-one'
Plug 'pangloss/vim-javascript'
Plug 'RRethy/vim-illuminate'
Plug 'pechorin/any-jump.vim'
Plug 'mhinz/vim-signify'
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set wrap
noswapfile
syntax on
" Sets how many lines of history VIM has to remember
set history=1000

" Set to auto read when a file is changed from the outside
set autoread

" prevent vim from adding that stupid empty line at the end of every file
set noeol
set binary

" auto source config file after every change
autocmd BufWritePost init.vim source %

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let g:mapleader = ","
" ~/.vimrc
nnoremap <leader>w :w<cr>
" Fast save and quit
nnoremap <leader>x :xa<cr>
" Fast quit
nnoremap <leader>q :qa!<cr>
" Fast git
vnoremap <Leader>gb :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
"edit
nnoremap <leader>e :e 
"vsplit
nnoremap <leader>v :vsplit 
"split
nnoremap <leader>s :split 

"fast taglist toggle
nnoremap <leader>m :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" encoding {
set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,sjis
"}

" search {
set hlsearch
set incsearch
set ignorecase
set smartcase
"}

" indent, tab {
set autoindent
set smartindent
set smarttab
set expandtab

set tabstop=4
set softtabstop=4
set shiftwidth=4

filetype plugin indent on
"}

" color {
set termguicolors
colorscheme one
set background=dark
"}

" show tab, space, etc {
set list listchars=tab:>_,trail:~,extends:>,precedes:<
"}

" toggle window size {
nnoremap <Leader>t :call ToggleWindowSize()<cr>
let g:CurWinMax = 0
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
"}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline {
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
      \ }
      \ }
"}

" any-jump {
let g:any_jump_window_width_ratio  = 0.8
let g:any_jump_window_height_ratio = 0.9
"}

" highlight {
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl
"}

" easymotion {
let g:EasyMotion_leader_key = ';'
hi EasyMotionTarget2First ctermbg=none ctermfg=red
hi EasyMotionTarget2Second ctermbg=none ctermfg=red
autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable
"}

" fzf {
let g:fzf_nvim_statusline = 0 " disable statusline overwriting
let g:fzf_action = {
\ 'ctrl-t': 'tab split',
\ 'ctrl-s': 'split',
\ 'ctrl-v': 'vsplit' }

" ripgrep with fzf:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <silent> <leader>o :Files<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>. :Lines<CR>
nnoremap <leader>a :Rg 
"}

"" NERDTree {
"let g:NERDTreeDirArrows=0
"let g:NERDTreeWinSize=50
"let NERDTreeShowHidden=1
"let g:NERDTreeLimitedSyntax = 1
"let g:NERDTreeHighlightCursorline = 0
""}

" vim json {
let g:vim_json_syntax_conceal = 0
"}


" supertab {
let g:SuperTabDefaultCompletionType = '<C-n>'
"}

" coc.nvim {
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" GoTo code navigation.
autocmd VimEnter * nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use <c-k> to trigger completion.
inoremap <silent><expr> <c-k> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nnoremap <leader>rn <Plug>(coc-rename)

" coc-explorer trigger
nnoremap <Leader>f :CocCommand explorer<CR>

"" coc snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

let g:snips_author = 'Jarod'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Make <tab> used for trigger completion, completion confirm, snippet expand and jump
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Extensions
let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-eslint',
    \ 'coc-explorer',
    \ 'coc-json',
    \ 'coc-python',
    \ 'coc-snippets',
    \ 'coc-tsserver',
    \ 'coc-go',
    \ 'coc-pairs',
    \ 'coc-flutter',
    \ 'coc-vimlsp'
  \ ]
"}

" tagbar {
let g:tagbar_ctags_bin = "/usr/local/bin/ctags"
"}


" any-jump {
" Disabling default any-jump keybindings
let g:any_jump_disable_default_keybindings = 1

" Normal mode: Jump to definition under cursore
nnoremap <leader>j :AnyJump<CR>

" Visual mode: jump to selected text in visual mode
xnoremap <leader>j :AnyJumpVisual<CR>
"}

" vim-go
" Auto formatting and importing
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1
"}