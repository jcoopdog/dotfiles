let mapleader = " "
lua require("config.lazy")

highlight RedundantWhitespace ctermbg=cyan guibg=cyan
match RedundantWhitespace /\s\+$\| \+\ze\t/
set incsearch
set number
set relativenumber
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set listchars=eol:↴,tab:│·,space:·,extends:>,precedes:<,trail:~
set list
set termguicolors
set nowrap
set mousescroll=ver:3,hor:0
set colorcolumn=100
lua vim.diagnostic.config({ virtual_text = true })


set background=dark
colorscheme oxocarbon
InvertCmpColors
"TransparentEnable


nnoremap <silent> <leader>h <cmd>nohlsearch<cr>
nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>wa <cmd>wall<cr>
nnoremap <leader>l <C-w>d
nnoremap <leader>j <C-d>
nnoremap <leader>k <C-u>
nnoremap <silent> - <cmd>Oil<cr>
nnoremap U <C-r>
nnoremap Y y$
nnoremap <silent> <Tab> <cmd>tabnext<cr>
nnoremap <silent> <S-Tab> <cmd>tabprev<cr>
nnoremap <S-cr> o<Esc>
inoremap <S-cr> <Esc>o
vnoremap <Tab> >
vnoremap <S-Tab> <

command! Q q!
command! Wq wq
command! W w

" force myself to use hjkl

set mouse=
" no arrow keys either
" Normal mode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" Insert mode
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Visual mode
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>

