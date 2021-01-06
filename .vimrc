" colors and aesthetics "
hi CursorLineNr cterm=None
call plug#begin('~/.vim/plugged')
Plug 'dylanaraps/wal.vim'
Plug 'junegunn/goyo.vim'
call plug#end()
syntax enable
colorscheme wal

" nice stuff "
set nowrap
" set wrap 
set nobackup
set nowritebackup
set smarttab
set expandtab
set tabstop=2
set softtabstop=0
set shiftwidth=0
set number relativenumber
set ai
set si

" fix shift O lag "
set timeout timeoutlen=5000 ttimeoutlen=100

" tabs "
map <C-t> :tabnew<Space>
map <C-n> :tabn<CR>
map <C-p> :tabp<CR>

" panes "
map <C-\> :vsp<Space>
map <C-j> <C-w>w
map <C-k> <C-w>W

map <F10> :! ~/competitive/run %<CR>
" map <F10> :! python %<CR>

map <F4> :!pdflatex %<CR>

map <leader>sk :! python3 ~/competitive/submit.py %<CR>
map <leader>tp :r ~/competitive/template.cc<CR>ggdd
map <leader>a :tabnew ~/competitive/algorithms<CR>
map <leader>i :tabnew test.in<CR>

" set spelllang=en
" set spell
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
