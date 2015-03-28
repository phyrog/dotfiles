"""""""""""""""""""""""""""""""""""""""""""
" .vimrc by Tom Gehrke (2012-2015)
"""""""""""""""""""""""""""""""""""""""""""

" Pathogen settings

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()


" General

set laststatus=2
set nocompatible
set encoding=utf-8
filetype plugin on
syntax on


" Display

set t_Co=256
colorscheme gruvbox
set background=dark
set number
set relativenumber
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set ruler
set showcmd
set autoindent
set so=7
set incsearch
set hlsearch
set cursorline

set noerrorbells
set novisualbell

set fillchars+=vert:\ 


" Input

set backspace=indent,eol,start
if has('mouse')
  set mouse=a
endif


" Autocmds

autocmd BufRead,BufNewFile *.launch set filetype=xml
autocmd BufRead,BufNewFile *.asd    set filetype=lisp
autocmd FileType lisp               set commentstring=;\ %s
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exec "normal! g`\"" |
      \ endif


" Mappings

noremap   <up>    <nop>
noremap   <down>  <nop>
noremap   <left>  <nop>
noremap   <right> <nop>

"  Normal Mode

nnoremap  j       gj
nnoremap  k       gk
nnoremap  <c-j>   ddp
nnoremap  <c-k>   ddkP

nmap      ;       gcc

"  Visual Mode

vmap      ;       gc

"  Input Mode



"  Terminal Mode

if has('nvim')
  tnoremap  <esc>   <c-\><c-n>
endif
