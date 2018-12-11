" Start vim plug
call plug#begin('~/.config/nvim/plugged')

" General plugs
Plug '/usr/local/opt/fzf'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/denite.nvim'
Plug 'tpope/vim-fugitive'

call plug#end()

" General Window
syntax on
set nu
set hidden

" Wrap gitcommit file types at the appropriate length
filetype indent plugin on

" Denite Config
call denite#custom#var('file/rec', 'command',
      \ ['rg', '--files', '--glob', '!.git'])

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

" NERDTree Configs
map <leader>r :NERDTreeMirrorToggle<CR>
map <leader>r :NERDTreeFind<cr>

let NERDTreeChDirMode=2
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let g:NERDTreeWinSize=30
