" vim-plug (https://github.com/junegunn/vim-plug) settings 
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'flazz/vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'elzr/vim-json'
Plug 'tpope/vim-endwise'
Plug 'scrooloose/syntastic'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'raimondi/delimitmate'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sgur/vim-editorconfig'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'romainl/vim-cool'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
noswapfile
filetype plugin indent on
syntax on
" Sets how many lines of history VIM has to remember
set history=1000

" Set to auto read when a file is changed from the outside
set autoread

" prevent vim from adding that stupid empty line at the end of every file
set noeol
set binary

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
" ~/.vimrc
nmap <leader>w :w!<cr>
" Fast save and quit
nmap <leader>x :xa!<cr>
" Fast quit
nmap <leader>q :qa!<cr>
" Fast git
nmap <leader>gs :!git status<cr>
nmap <leader>gd :!git diff<cr>
vmap <Leader>gb :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
"edit
nmap <leader>e :e 
"vsplit
nmap <leader>v :vsplit 
"split
nmap <leader>s :split 

"php lint
" nmap <leader>l :!php -l %<CR>
"set break point
nmap <leader>b :Bp<CR>
"fast taglist toggle
nmap <leader>m :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" backspace key {
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
"}

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

" CTRL-A increase as decimal
set nrformats=

" Disable mouse click to go to position
set mouse-=a

" tab {
set expandtab
set tabstop=4
set softtabstop=4
"}

" indent {
set shiftwidth=4
set autoindent
"}

" color {
set t_Co=256
:colorscheme solarized
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
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
      \ }
      \ }
"}

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
nmap <leader>a :Rg 
"}

" NERDTree {
nmap <Leader>f :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0
let g:NERDTreeWinSize=50
let NERDTreeShowHidden=1
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeHighlightCursorline = 0
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
"}

" supertab {
let g:SuperTabDefaultCompletionType = '<C-n>'
"}

" vim-cool {
let g:CoolTotalMatches = 1
"}