let mapleader = " "
lua require("config.lazy")

"highlight RedundantWhitespace ctermbg=cyan guibg=cyan
"match RedundantWhitespace /\s\+$\| \+\ze\t/
set incsearch
set number
set relativenumber
set cursorline
set cursorlineopt=number
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set listchars=eol:↴,tab:│·,space:·,trail:~
set list
set termguicolors
set nowrap
set spelllang=en_us
"set colorcolumn=100
set inccommand=split
set mouse=nv
set mousemodel=extend
set mousescroll=ver:3,hor:0
set showtabline=0
"set winborder=single
lua vim.diagnostic.config({ virtual_text = true })

augroup RnuToggle
    autocmd!
    autocmd InsertEnter * set nornu
    autocmd InsertLeave * set rnu
augroup END

autocmd! colorscheme oxocarbon InvertCmpColors
autocmd! colorscheme retrobox highlight! CursorColumn guibg=#353535 ctermbg=grey
"autocmd! colorscheme retrobox IBLEnable

"set background=dark
colorscheme palenight
IBLEnable
"TransparentEnable

" am considering using standout for the line numbers
hi CursorLineNr gui=bold guifg=orange
hi @string gui=italic
hi @comment gui=italic
hi @lsp.type.enumMember gui=italic guifg=violet
hi link BiscuitColor @comment


nnoremap <silent> <leader>n <cmd>nohlsearch<cr>
nnoremap <leader>q <cmd>close<cr>
nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>a <cmd>wall<cr>
nnoremap <leader>b <C-^>
nmap     <leader>c gcc
vmap     <leader>c gc
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap <leader>H <C-W>H
nnoremap <leader>J <C-W>J
nnoremap <leader>K <C-W>K
nnoremap <leader>L <C-W>L
nnoremap <leader><leader> <C-w><C-w>
nnoremap <silent> <leader>d <cmd>lua vim.diagnostic.open_float()<cr>
nnoremap <leader>rn :IncRename 
nnoremap <silent> - <cmd>Oil<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fd <cmd>Telescope telescope-tabs list_tabs<cr>
nnoremap <leader>fl <cmd>Telescope oldfiles<cr>
nnoremap U <C-r>
nnoremap Y y$
nnoremap <silent> <Tab> <cmd>tabnext<cr>
nnoremap <silent> <S-Tab> <cmd>tabprev<cr>
nnoremap <S-cr> o<Esc>
"inoremap <S-cr> <Esc>o
vnoremap <Tab> >
vnoremap <S-Tab> <
"tnoremap <esc> <C-\><C-n>
nmap     s <C-S>

nnoremap <silent> <M-1> <cmd>tabn 1<cr>
nnoremap <silent> <M-2> <cmd>tabn 2<cr>
nnoremap <silent> <M-3> <cmd>tabn 3<cr>
nnoremap <silent> <M-4> <cmd>tabn 4<cr>
nnoremap <silent> <M-5> <cmd>tabn 5<cr>
nnoremap <silent> <M-6> <cmd>tabn 6<cr>
nnoremap <silent> <M-7> <cmd>tabn 7<cr>
nnoremap <silent> <M-8> <cmd>tabn 8<cr>
nnoremap <silent> <M-9> <cmd>tabn 9<cr>
nnoremap <silent> <M-0> <cmd>tabn 10<cr>

command! Q q
command! Wq wq
command! W w

"gentoo vim plugins
set rtp+=/usr/share/vim/vimfiles

noremap <C-c> <Nop>
noremap <F1> <Nop>

"weird lsp things (might move later)
lua << END

vim.lsp.config('*', {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.lsp.config.ols = {
    enable_format = false,
}

-- vim.lsp.config.kotlin_language_server = {
--     capabilities = require("cmp_nvim_lsp").default_capabilities(),
--     filetypes = { "kotlin" , "kt", "kts"},
-- }

END

" force myself to use hjkl
" no arrow keys either
" Normal mode
"nnoremap <Up> <Nop>
"nnoremap <Down> <Nop>
"nnoremap <Left> <Nop>
"nnoremap <Right> <Nop>
"
"" Insert mode
"inoremap <Up> <Nop>
"inoremap <Down> <Nop>
"inoremap <Left> <Nop>
"inoremap <Right> <Nop>
"
"" Visual mode
"vnoremap <Up> <Nop>
"vnoremap <Down> <Nop>
"vnoremap <Left> <Nop>
"vnoremap <Right> <Nop>
