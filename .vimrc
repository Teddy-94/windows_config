set number
set scrolloff=6
set showmode
set cursorline
set laststatus=2
set showcmd
set nowrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set expandtab
set noswapfile
set nobackup

syntax on
vnoremap y ygv<esc>
vnoremap p P
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap J mzJ`z

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap > >gv
vnoremap < <gv

nnoremap <C-l> :noh<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap L $
nnoremap H ^
