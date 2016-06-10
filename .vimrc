" Vimscript file settings  {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup end
" }}}

" Installing plugins using vundle  {{{
" Allow Vundle to manage my plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vunlde manage Vundle
Plugin 'gmarik/Vundle.vim'
" Nice status bar
Plugin 'bling/vim-airline'
" Undo tree
Plugin 'vim-scripts/Gundo'
" Solarized color scheme
Plugin 'altercation/vim-colors-solarized'
" Integrate ag in vim
Plugin 'rking/ag.vim'
" Fuzzy file searcher
Plugin 'kien/ctrlp.vim'
" Browse files inside vim
Plugin 'scrooloose/nerdtree'
" Syntax checking plugin
Plugin 'scrooloose/syntastic'
" Comment lines quickly
Plugin 'tpope/vim-commentary'
" Use tab for autocompletion
Plugin 'ervandew/supertab'
" Easily surround words
Plugin 'tpope/vim-surround'
" Autocomplete closing tags
Plugin 'docunext/closetag.vim'
" Manage all color-schemes
Plugin 'flazz/vim-colorschemes'

call vundle#end()
" }}}

" Set my leader key
let mapleader=","

" Colors
set background=dark
colorscheme solarized
set t_Co=256

" Enable syntax highlighting
syntax enable

" Space and tab settings {{{
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs
set smarttab
" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
" }}}

" Show line numbers
set number

" Load filetype specific indent files
filetype indent on
filetype plugin on

" Visual autocomplete for command menu
set wildmenu
" Tab-complete files up to longest unambiguous prefix
set wildmode=list:longest,full

" Highlight matching bracket
set showmatch

" Show 120 line limit
set colorcolumn=120

" Search settings {{{
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Search as soon as characters are entered
set incsearch
" Highlight search results
set hlsearch
" Turn off search highlight
nnoremap <silent> <leader><cr> :nohlsearch<cr>
" }}}

" Treat long lines as break lines
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk

" Since esc is very far away
inoremap jk <esc>

" Toggle gundo
nnoremap <leader>u :GundoToggle<cr>

" Open window split on right
nnoremap <leader>sl :rightbelow vnew<cr>

" Open ag.vim and search for word under cursor
nnoremap <leader>a :Ag<cr>

" Turn backup off
set noswapfile

" CtrlP settings {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" }}}

" Auto read a file if changed from outside
set autoread

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Airline settings {{{
" Always show the status line
set laststatus=2
" Show open buffers on top
let g:airline#extensions#tabline#enabled = 1
" Airline theme
let g:airline_theme = 'papercolor'
" }}}

" Managing Buffers {{{
" Switching between buffers
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bn :bn<cr>
" Delete currend buffer
nnoremap <leader>bd :bd<cr>
" Don't close buffers when you aren't displaying them
set hidden
" Fuzzy find buffers
nnoremap <leader>b<space> :CtrlPBuffer<cr>
"}}}

" Return to last edit position when opening files
augroup last_edit
  autocmd!
  autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif
augroup END

" Nerd tree functions {{{
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! ToggleFindNerd()
  if IsNERDTreeOpen()
    exec ':NERDTreeToggle'
  else
    exec ':NERDTreeFind'
  endif
endfunction

" If nerd tree is closed, find current file, if open, close it
nnoremap <silent> <leader>f <ESC>:call ToggleFindNerd()<CR>
nnoremap <silent> <leader>F <ESC>:NERDTreeToggle<CR>
" }}}

" Auto indentation
set ai
" Smart indentation
set si

" Show trailing whitespace
set list
" But only interesting whitespace
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" No annoying sound on errors
set noerrorbells
set vb t_vb=

" Let supertab use keyword completion
let g:SuperTabDefaultCompletionType = 'context'

" Prettify JSON
nnoremap <leader>gj :%!python -m json.tool<cr>

" Make it easier to edit my vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Make it easier to reload my vimrc
nnoremap <leader>sv :so $MYVIMRC<cr>
