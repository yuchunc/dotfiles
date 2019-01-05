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

" Denite Config
call denite#custom#var('file/rec', 'command',
      \ ['rg', '--files', '--glob', '!.git'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
      \ ['--hidden', '--vimgrep', '--smart-case'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>',
      \ 'noremap')
call denite#custom#map('normal', '<Esc>', '<NOP>',
      \ 'noremap')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>',
      \ 'noremap')
call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>',
      \ 'noremap')
call denite#custom#map('normal', 'dw', '<denite:delete_word_after_caret>',
      \ 'noremap')

nnoremap <C-p> :<C-u>Denite file_rec<CR>
nnoremap <leader>s :<C-u>Denite buffer<CR>
nnoremap <leader><Space>s :<C-u>DeniteBufferDir buffer<CR>
nnoremap <leader>8 :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
nnoremap <leader>/ :<C-u>Denite grep:. -mode=normal<CR>
nnoremap <leader><Space>/ :<C-u>DeniteBufferDir grep:. -mode=normal<CR>
nnoremap <leader>d :<C-u>DeniteBufferDir file_rec<CR>
nnoremap <leader>r :<C-u>Denite -resume -cursor-pos=+1<CR>
nnoremap <leader>lr :<C-u>Denite references -mode=normal<CR>

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
