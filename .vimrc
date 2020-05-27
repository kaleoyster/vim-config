let mapleader = " "
syntax on
filetype plugin indent on
set number relativenumber

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/autoload/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-pandoc/vim-pandoc'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'tpope/vim-fugitive'
Plug 'tmhedberg/SimpylFold'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'kien/ctrlp.vim'

" List ends here. Plugins become visible to Vim after this call
call plug#end()

" basic:
	set nocompatible
	filetype plugin on
	filetype plugin indent on
	syntax on
	set encoding=utf-8
	set tabstop=4
	set shiftwidth=4
	set expandtab
    set clipboard=unnamed

" Enable autocompletion
	set wildmode=longest,list,full
	""inoremap { {}<left>
	""inoremap ' ''<left>
	""inoremap [ []<left>
	""inoremap " ""<left>

" Tab navigation like firefox
	nnoremap <C-S-tab>   :tabprevious<CR>
	nnoremap <C-tab>     :tabnext<CR>
	nnoremap <C-t>       :tabnew<CR>
	inoremap <C-tab>     <Esc> :tabnext<CR>
	inoremap <C-t>       <Esc> :tabnew<CR>
	inoremap <C-S-tab>   <Esc> :tabprevious<CR>


"set splitbelow
    "set splitright
    "split navigations

    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

" Enable folding
    set foldmethod=indent
    set foldlevel=87
    nnoremap <space> za
    au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
    
    let g:SimpylFold_docstring_preview=1

" Make python code look pretty
    let python_highlight_all=1

" Vimwiki configurations
	let g:vimwiki_global_ext = 0
	let g:vimwiki_list = [{'path':'~/vimwiki', 'syntax':'markdown', 'ext':'.md'}]

" Vim airline configurations
	let g:airline#extension#tabline#enabled=1
	let g:airline#extension#tabline#left_sep=' '
	let g:airline#extension#tabline#left_alt_sep='|'

" PDF opener
	:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
	:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78
