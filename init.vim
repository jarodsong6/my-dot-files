" air-line status
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
let g:airline_section_b = ''

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

call plug#begin('~/.vim/plugged')
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/tComment'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/gtags.vim'
Plug 'majutsushi/tagbar'
Plug 'flazz/vim-colorschemes'
Plug 'brookhong/DBGPavim'
Plug 'rking/ag.vim'
Plug 'vim-scripts/csv.vim'
Plug 'elzr/vim-json'
Plug 'vim-ruby/vim-ruby'
Plug 'osyo-manga/vim-monster'
Plug 'tpope/vim-rails'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'scrooloose/syntastic'
Plug 'kchmck/vim-coffee-script'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mattn/emmet-vim'
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Chiel92/vim-autoformat'
Plug 'ngmy/vim-rubocop'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" {{{
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting
  let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

  nnoremap <silent> <leader>o :Files<CR>
  nnoremap <silent> <leader>r :History<CR>
  nnoremap <silent> <leader>. :Lines<CR>
  nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
" }}}

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
syntax on
" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" change directory of the .swp file
set swapfile
set dir=~/tmp

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
nmap <leader>gs :!git status<cr>
nmap <leader>gd :!git diff<cr>
vmap <Leader>gb :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
"vsplit
nmap <leader>v :vsplit
"split
nmap <leader>s :split

"php lint
" nmap <leader>l :!php -l %<CR>
"ruby lint
nmap <leader>l :w !ruby -c %<CR>
"set break point
nmap <leader>b :Bp<CR>
"fast taglist toggle
nmap <leader>m :TagbarToggle<CR>
"csv.vim - Highlight the column on which the cursor is using
nmap <leader>h :HiColumn<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the WiLd menu
set wildmode=longest:full
set wildmenu

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" set encoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,sjis

" search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

set number

" CTRL-A increase as decimal
set nrformats=

" Show a status bar
set laststatus=2

" Disable mouse click to go to position
set mouse-=a

" tab
:set expandtab
:set tabstop=2
:set softtabstop=2
" indent
:set shiftwidth=2
:set autoindent

"color
set t_Co=256
:colorscheme solarized
set background=dark

"Show tab characters.Visual Whitespace.
set list listchars=tab:>_,trail:~,extends:>,precedes:<

" Use deoplete.
let g:deoplete#enable_at_startup = 1

"easymotion
let g:EasyMotion_leader_key = ';'
hi EasyMotionTarget2First ctermbg=none ctermfg=red
hi EasyMotionTarget2Second ctermbg=none ctermfg=red

"quickly add empty new line
nmap <CR> o<ESC>

"autoformat
noremap <F3> :Autoformat<CR>

"Gtags
map <C-j> :vsp <CR>:GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" matchit
runtime macros/matchit.vim

" toggle window size
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

"NERDTree
nmap <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0
let g:NERDTreeWinSize=50

" vim json
let g:vim_json_syntax_conceal = 0

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_ruby_checkers = ['rubocop']

" hight long lines
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
