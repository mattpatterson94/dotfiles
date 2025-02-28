let mapleader=" "
let maplocalleader="\\"
" Enable mouse usage eg. click to move cursor
set mouse=a
" handle indentation automatically
set autoindent
" indent automatically based on filetype
filetype plugin indent on
" use spaces for indenting
set expandtab
" number of spaces when indenting with tab
set tabstop=2
" number of spaces when indenting with >>, <<
set shiftwidth=2
" Print line number
set number
" Relative line numbers
set relativenumber
" use system clipboard
set clipboard+=unnamed
" Map key chord `jk` to <Esc>.
inoremap jk <Esc>
" Syntax highlighting
syntax on
" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" keymaps
" normal mode: save
nnoremap <c-s> :w<CR> 
" insert mode: escape to normal and save
inoremap <c-s> <Esc>:w<CR>l 
" visual mode: escape to normal and save
vnoremap <c-s> <Esc>:w<CR> 

" Map rebase keys
augroup my_git_rebase
  autocmd!
  autocmd FileType gitrebase nnoremap <buffer> <C-p> :Pick<cr>
  autocmd FileType gitrebase nnoremap <buffer> <C-d> :Drop<cr>
  autocmd FileType gitrebase nnoremap <buffer> <C-f> :Fixup<cr>
  autocmd FileType gitrebase nnoremap <buffer> <C-r> :Reword<cr>
  autocmd FileType gitrebase nnoremap <buffer> <C-e> :Edit<cr>
augroup END
