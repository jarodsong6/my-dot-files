syntax on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on

" Set to auto read when a file is changed from the outside
set autoread

" change directory of the .swp file
set swapfile
set dir=~/tmp

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
"php lint
nmap <leader>l :!php -l %<CR>
"set break point
nmap <leader>b :Bp<CR>
"fast taglist toggle
nmap <leader>f :TlistToggle<CR>

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
set fileencodings=euc-jp,utf-8,iso-2022-jp,sjis

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

" Show a status bar
set laststatus=2

" tab
:set expandtab
:set tabstop=4
:set softtabstop=4
" indent
:set shiftwidth=4
:set autoindent  

" auto completiong
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 20
let g:neocomplcache_auto_completion_start_length = 2
let g:neocomplcache_manual_completion_start_length = 3
let g:neocomplcache_min_keyword_length = 4
let g:neocomplcache_min_syntax_length = 4
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_quick_match = 0
let g:neocomplcache_enable_camel_case_completion = 0
let g:neocomplcache_enable_underbar_completion = 0

let g:neocomplcache_plugin_disable = {
  \ 'syntax_complete' : 1, 
  \ }

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"color
set t_Co=256
hi Normal ctermbg=White ctermfg=Black
:colorscheme jelleybeans
"set background=dark

"Show tab characters.Visual Whitespace.
set list listchars=tab:>_,trail:~,extends:>,precedes:<

"easymotion
let g:EasyMotion_leader_key = ';'

"matchit
"source $VIMRUNTIME/macros/matchit.vim
":let b:match_words = '<:>,<div.*>:</div>'
":let b:match_words .= ',{\s*if\>:{\s*elseif\>:{\s*else\>:{\s*/if\>,{\s*foreach\>:{\s*foreachelse\>:{\s*/foreach\>'

"fuzzyfinder
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_file_exclude = '\v\~$|\.(o|exe|bak|swp|gif|jpg|png)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:fuf_mrufile_exclude = '\v\~$|\.bak$|\.swp|\.howm$|\.(gif|jpg|png)$'
let g:fuf_mrufile_maxItem = 10000
let g:fuf_enumeratingLimit = 20
nnoremap <silent> efb :FufBuffer!<CR>
nnoremap <silent> eff :FufFile!<CR>
nnoremap <silent> efm :FufMruFile!<CR>
autocmd FileType fuf nmap <C-c> <ESC>

"Gtags
map <C-j> :vsp <CR>:GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>

"" unite.vim
" prefix
nnoremap [unite] <Nop>
nmap <Leader>f [unite]
"settings
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_file_rec_max_cache_files=500
"key mapping
nnoremap <silent> [unite]f :<C-u>Unite -no-split file_mru buffer file_rec/async<CR>
nnoremap <silent> [unite]y :<C-u>Unite -no-split history/yank<CR>
nnoremap <silent> [unite]r :<C-u>Unite -no-split -buffer-name=register register<CR>

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

"" Neobundle
if has('vim_starting')
  set nocompatible

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'gmarik/vundle'
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-scripts/tComment'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'vim-scripts/gtags.vim'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

let vimproc_updcmd = has('win64') ?
      \ 'tools\\update-dll-mingw 64' : 'tools\\update-dll-mingw 32'
execute "NeoBundle 'Shougo/vimproc.vim'," . string({
      \ 'build' : {
      \     'windows' : vimproc_updcmd,
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ })
