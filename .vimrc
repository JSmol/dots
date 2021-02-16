map <F10> :! ~/competitive/run %<CR>
" map <F10> :! python % < test.in<CR>
" map<F10> :! npm run test<CR>

" colors and aesthetics "
hi CursorLineNr cterm=None
call plug#begin('~/.vim/plugged')
Plug 'dylanaraps/wal.vim'
call plug#end()
syntax enable
colorscheme wal

" nice stuff "
" set wrap is default "
set nowrap
set nobackup
set nowritebackup
set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set number relativenumber
set ai
set si

" fix shift O lag on some systems "
set timeout timeoutlen=5000 ttimeoutlen=100

" tabs "
map <C-t> :tabnew<Space>
map <C-n> :tabn<CR>

" panes "
map <C-\> :vsp<Space>
map <C-k> :wincmd k<CR>
map <C-j> :wincmd j<CR>
map <C-h> :wincmd h<CR>
map <C-l> :wincmd l<CR>

" random shorthands "
map <F4> :!pdflatex %<CR>
map <leader>v :tabnew ~/.vimrc<CR>
map <leader>n :tabnew ~/.config/nvim/init.vim<CR>
map <leader>fc :tabnew ~/.config/fish/config.fish<CR>

" competitive programming shortcuts "
map <leader>sk :! python3 ~/competitive/submit.py %<CR>
map <leader>tp :r ~/competitive/template.cc<CR>ggdd
map <leader>a :tabnew ~/competitive/algorithms<CR>
map <leader>i :tabnew test.in<CR>

