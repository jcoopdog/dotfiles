lua require("config.lazy")

highlight RedundantWhitespace ctermbg=cyan guibg=cyan
match RedundantWhitespace /\s\+$\| \+\ze\t/
set number
set relativenumber
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set listchars=eol:↴,tab:│·,space:·
set list
set termguicolors
set nowrap
set mousescroll=ver:3,hor:0
let hlstate=0
nnoremap <F4> <cmd>nohlsearch<cr>
lua vim.diagnostic.config({ virtual_text = true })
"autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
set background=dark
colorscheme oxocarbon
"colorscheme wal
"TransparentEnable
nnoremap <Tab> <cmd>tabnext<cr>
nnoremap <S-Tab> <cmd>tabprev<cr>
nnoremap <S-cr> o<Esc>
inoremap <S-cr> <Esc>o
vnoremap <Tab> >
vnoremap <S-Tab> <

command! Q q!
command! Wq wq
command! W w

"Hyprlang LSP
"lua vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, { pattern = {"*.hl", "hypr*.conf"}, callback = function(event) vim.lsp.start { name = "hyprlang", cmd = {"hyprls"}, root_dir = vim.fn.getcwd(), } end })
"lua vim.filetype.add({ pattern = { [".*/hypr/.*%.conf"] = "hyprlang" }, })



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

