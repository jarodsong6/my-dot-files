call plug#begin('~/.vim/plugged')
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'flazz/vim-colorschemes'
Plug 'brookhong/DBGPavim'
Plug 'rking/ag.vim'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/csv.vim'
Plug 'elzr/vim-json'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'scrooloose/syntastic'
Plug 'leafgarland/typescript-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'raimondi/delimitmate'
Plug 'mattn/emmet-vim'
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips'
Plug 'ngmy/vim-rubocop'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
noswapfile
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

filetype plugin indent on
syntax on

" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread


" debugger
let g:dbgPavimBreakAtEntry = 1
let g:dbgPavimOnce = 1

" ~/.vimrc
nmap <leader>w :w!<cr>
" Fast save and quit
nmap <leader>x :xa!<cr>
" Fast quit
nmap <leader>q :qa!<cr>
" Fast git
vmap <Leader>gb :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
"edit
nmap <leader>e :edit 
"vsplit
nmap <leader>v :vsplit 
"split
nmap <leader>s :split 
"ag
nmap <leader>a :Ag 

"php lint
" nmap <leader>l :!php -l %<CR>
"ruby lint
nmap <leader>l :w !ruby -c %<CR>
"fast taglist toggle
nmap <leader>m :TagbarToggle<CR>
"csv.vim - Highlight the column on which the cursor is using
nmap <leader>h :HiColumn<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" encoding
set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,sjis

" search
set hlsearch
set incsearch
set ignorecase
set smartcase

" CTRL-A increase as decimal
set nrformats=

" Disable mouse click to go to position
set mouse-=a

" tab & indent {
" tab
:set expandtab
:set tabstop=2
:set softtabstop=2
" indent
:set shiftwidth=2
:set autoindent
"}

" colors {
set t_Co=256
:colorscheme solarized
set background=dark
"}

" Show tab characters.Visual Whitespace.
set list listchars=tab:>_,trail:~,extends:>,precedes:<

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
" easymotion {
let g:EasyMotion_leader_key = ';'
hi EasyMotionTarget2First ctermbg=none ctermfg=red
hi EasyMotionTarget2Second ctermbg=none ctermfg=red
"}

" fzf {
let g:fzf_nvim_statusline = 0 " disable statusline overwriting
let g:fzf_action = {
\ 'ctrl-t': 'tab split',
\ 'ctrl-s': 'split',
\ 'ctrl-v': 'vsplit' }

nnoremap <silent> <leader>o :Files<CR>
nnoremap <silent> <leader>r :History<CR>
nnoremap <silent> <leader>. :Lines<CR>
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
"}

" matchit {
runtime macros/matchit.vim
"}

" NERDTree {
nmap <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0
let g:NERDTreeWinSize=50
"}

" vim json {
let g:vim_json_syntax_conceal = 0
"}

" syntastic {
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_ruby_checkers = ['rubocop']
"}

" lightline {
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
      \ }
      \ }
"}

" deoplete.nvim {
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_refresh_always=0
let g:deoplete#file#enable_buffer_path=1

let g:deoplete#sources={}
let g:deoplete#sources._    = ['buffer', 'file', 'ultisnips']
let g:deoplete#sources.ruby = ['buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources.vim  = ['buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources.css  = ['buffer', 'member', 'file', 'omni', 'ultisnips']
let g:deoplete#sources.scss = ['buffer', 'member', 'file', 'omni', 'ultisnips']
let g:deoplete#sources.html = ['buffer', 'member', 'file', 'omni', 'ultisnips']
"}
