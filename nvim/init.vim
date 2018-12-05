" Start vim plug
call plug#begin('~/.config/nvim/plugged')

" General plugs
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Airline
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" Syntax highlighting
syntax on

" Wrap gitcommit file types at the appropriate length
filetype indent plugin on

