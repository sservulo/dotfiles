" Load buffers not currently being shown
set hidden
" Show line numbers
set number
" Show relative line numbers to the current one
set relativenumber
" Enable mouse
set mouse=a
" Enable preview in split panel
set inccommand=split

" Plugins
call plug#begin()
" Theme
Plug 'tomasr/molokai'
" Fuzzy file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Language support
Plug 'sheerun/vim-polyglot'
" Status bar
Plug 'vim-airline/vim-airline'
call plug#end()

colorscheme molokai
set background=dark

" --------------  Shortcuts --------------
" File finder
nnoremap <c-p> :GFiles<cr>
" Folder wide term search
nnoremap <c-f> :Rg<space>

