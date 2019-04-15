" Start vim plug
call plug#begin('~/.config/nvim/plugged')

" General plugs
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/denite.nvim'
Plug 'tpope/vim-fugitive'

call plug#end()

" General Window
syntax on

set hidden
set number
set showtabline=2
" set winwidth=100

" disable sound on errors
set noerrorbells

" change indent from <TAB> to 2 spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" set no swap file
set noswapfile
set shortmess=IaA    " Disable initial message + some other short form

" remove tailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Wrap gitcommit file types at the appropriate length
filetype indent plugin on

" Toggle searh highlighting
set hlsearch
nnoremap <CR> :silent! nohlsearch<CR>

" NERDTree - go to file
nnoremap <leader>r :NERDTreeFind<CR>

" Status line config
" Check https://github.com/itchyny/lightline.vim for more details
set noshowmode

let g:lightline = {
      \   'colorscheme': 'wombat',
      \   'active': {
      \     'left': [ [ 'mode', 'paste' ],
      \               [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \   },
      \   'component_function': {
      \     'gitbranch': 'fugitive#head',
      \     'readonly': 'LightlineReadonly',
      \   },
      \ }

function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

" Commenting mapping
map <Leader><Leader> <Leader>c<space>

