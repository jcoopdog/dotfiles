let mapleader = " "
lua require("config.lazy")

"highlight RedundantWhitespace ctermbg=cyan guibg=cyan
"match RedundantWhitespace /\s\+$\| \+\ze\t/
set incsearch
set number
set relativenumber
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

autocmd! colorscheme oxocarbon InvertCmpColors
autocmd! colorscheme retrobox highlight! CursorColumn guibg=#353535 ctermbg=grey
"autocmd! colorscheme retrobox IBLEnable

set background=dark
colorscheme palenight
IBLEnable
"TransparentEnable

nnoremap <silent> <leader>n <cmd>nohlsearch<cr>
nnoremap <leader>q <cmd>close<cr>
nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>a <cmd>wall<cr>
nnoremap <leader>l <C-w>l
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>h <C-w>h
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
tnoremap <esc> <C-\><C-n>

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
