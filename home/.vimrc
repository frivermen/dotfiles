call plug#begin('~/.vim/plugged')
" sxhkd syntax
"Plug 'kovetskiy/sxhkd-vim'
" colorscheme
Plug 'morhetz/gruvbox'
" latex
Plug 'lervag/vimtex'
call plug#end()

" latex
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0

" colorscheme
colorscheme gruvbox
set bg=dark
set colorcolumn=81
highlight ColorColumn ctermbg=darkgray 
let g:python_recommended_style = 0
au FileType python setlocal tabstop=2 shiftwidth=2 noexpandtab

" vim
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set smartindent
set number
set hlsearch
set incsearch
syntax on

" mappings
" map <C-l> :VimtexCompile<CR>
