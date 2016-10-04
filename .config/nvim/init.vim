"""""""""""""""""""""""""""""""""""""""""""
" .vimrc by Tom Gehrke (2012-2015)
"""""""""""""""""""""""""""""""""""""""""""

" Plug settings

call plug#begin('~/.config/nvim/plugs')

Plug 'morhetz/gruvbox'
Plug 'neomake/neomake'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'kovisoft/paredit'
Plug 'Raimondi/delimitMate'
Plug 'yalesov/vim-emblem'

call plug#end()

" General

set laststatus=2
set nocompatible
set encoding=utf-8
filetype plugin on
syntax on


" Display

let g:gruvbox_contrast_dark="soft"

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

set iskeyword-=_
let mapleader=" "
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_markdown_enabled_makers = ['markdownlint']

" Input

set backspace=indent,eol,start
if has('mouse')
  set mouse=a
endif

set grepprg=rg\ --color=never


" Autocmds

autocmd BufRead,BufNewFile *.launch             set filetype=xml
autocmd BufRead,BufNewFile *.asd                set filetype=lisp
autocmd BufRead,BufNewFile *.{autobuild,orogen} set filetype=ruby
autocmd BufRead,BufNewFile *.{cls}              set filetype=tex
autocmd FileType lisp                           set commentstring=;\ %s
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exec "normal! g`\"" |
      \ endif
autocmd FileType latex
      \ let b:endwise_words = '\\begin{\zs[a-zA-Z0-9*]*\ze}' | " ignored
      \ let b:endwise_pattern = '\\begin{\zs[a-zA-Z0-9*]*\ze}' |
      \ let b:endwise_addition = '\\end{&}' |
      \ let b:endwise_syngroups = 'texBeginEndName'
autocmd! BufWritePost * Neomake


" Mappings

nmap <c-c><c-c> [[v)y<c-w>hpi<cr><esc><c-w>l
"  Movement
map   <up>    <nop>
map   <down>  <nop>
map   <left>  <nop>
map   <right> <nop>

"  Normal Mode
nnoremap  <c-p>   :FZF<cr>
"    Movement
nnoremap  j       gj
nnoremap  J       <s-down>
nnoremap  k       gk
nnoremap  K       <s-up>
"    Move lines
"      Move current line down by one
nnoremap  <c-j>   ddp
"      Move current line up by one
nnoremap  <c-k>   ddkP
"    Tab operations
"      Create a new tab
" nnoremap  tn      :tabnew<cr>
"      Split the current tab
" nnoremap  ts      :tab split<cr>
"      Close the current tab
" nnoremap  tc      :tabclose<cr>
"      Keep only the current tab
" nnoremap  to      :tabonly<cr>
"      Move to next tab
" nnoremap  <c-l>   gt
"      Move to previous tab
" nnoremap  <c-h>   gT
"    Buffer operations
"      Create a new vertical buffer
nnoremap  <c-b>v  :vsplit<cr>
"      Create a new horizontal buffer
nnoremap  <c-b>h  :split<cr>
"    Comments
nmap      ;       gcc

"  Visual Mode
"    Buffer operations
"      Yank and paste current selection into a new vertical buffer
vnoremap  bvy     y:vnew<cr>p
"      Yank and paste current selection into a new horizontal buffer
vnoremap  by      y:new<cr>p
"      Delete and paste current selection into a new vertical buffer
vnoremap  bvd     d:vnew<cr>p
"      Delete and paste current selection into a new horizontal buffer
vnoremap  bd      d:new<cr>p
"    Comments
vmap      ;       gc

"  Input Mode
"  Terminal Mode
"    General
if has('nvim')
"      Switch back to normal mode
  tnoremap  <esc>   <c-\><c-n>
endif
