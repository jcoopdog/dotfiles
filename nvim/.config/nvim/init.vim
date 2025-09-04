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
set listchars=eol:↴,tab:│·,space:·,extends:>,precedes:<,trail:~
set list
set termguicolors
set nowrap
set mousescroll=ver:3,hor:0
set spelllang=en_us
"set colorcolumn=100
set inccommand=split
lua vim.diagnostic.config({ virtual_text = true })

autocmd! colorscheme oxocarbon InvertCmpColors

set background=dark
colorscheme oxocarbon
"TransparentEnable

nnoremap <silent> <leader>h <cmd>nohlsearch<cr>
nnoremap <leader>q <cmd>close<cr>
nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>wa <cmd>wall<cr>
nnoremap <leader>l <C-w>d
nnoremap <leader>j <C-d>
nnoremap <leader>k <C-u>
nnoremap <leader>rn :IncRename 
nnoremap <silent> - <cmd>Oil<cr>
nnoremap U <C-r>
nnoremap Y y$
nnoremap <silent> <Tab> <cmd>tabnext<cr>
nnoremap <silent> <S-Tab> <cmd>tabprev<cr>
nnoremap <S-cr> o<Esc>
inoremap <S-cr> <Esc>o
vnoremap <Tab> >
vnoremap <S-Tab> <

command! Q q
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

"I am a vibe coder, but only when trying to bind something funny in neovim
lua << EOF
vim.keymap.set("i", "<C-j>", function()
  local targets = { ['"'] = true, ["'"] = true, ["]"] = true, ["}"] = true, [")"] = true }
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()

  for i = col + 1, #line do
    local char = line:sub(i, i)
    if targets[char] then
      vim.api.nvim_win_set_cursor(0, { row, i })
      return
    end
  end
end, { noremap = true, desc = "Jump to next paired char in insert mode" })
EOF
