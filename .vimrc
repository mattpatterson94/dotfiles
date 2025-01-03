let mapleader=" "
let maplocalleader="\\"
" Enable mouse usage eg. click to move cursor
set mouse=a
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
nnoremap <c-s> :w<CR> " normal mode: save
inoremap <c-s> <Esc>:w<CR>l " insert mode: escape to normal and save
vnoremap <c-s> <Esc>:w<CR> " visual mode: escape to normal and save

