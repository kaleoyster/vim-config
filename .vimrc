let mapleader = " "
syntax on
filetype plugin indent on
set number relativenumber

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/autoload/plugged')

"Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vi-xmark', {'do': 'make'}
Plug 'junegunn/fzf', {'dir':'~/fzf/', 'do':'./install --all'}
Plug 'junegunn/fzf.vim'
Plug 'jreybert/vimagit'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-pandoc/vim-pandoc'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'tpope/vim-fugitive'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'kien/ctrlp.vim'
Plug 'rrethy/vim-hexokinase', {'do': 'make hexokinase'}
Plug 'plasticboy/vim-markdown'
Plug 'preservim/nerdtree'
Plug 'voldikss/vim-floaterm'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Basics
    set nocompatible
	filetype plugin on
	filetype plugin indent on
	syntax on
	set encoding=utf-8
	set tabstop=4
	set shiftwidth=4
	set expandtab
    set clipboard=unnamed

" Search down the subfolders
    set path+=**

" Display all matching on tab complete
    set wildmenu

" Enable autocompletion
	set wildmode=longest,list,full
	""inoremap { {}<left>
	""inoremap ' ''<left>
	""inoremap [ []<left>

" Tab navigation like firefox
	"nnoremap <C-e> :tabprevious<CR>
	"nnoremap <C-r> :tabnext<CR>
	nnoremap <C-t> :tabnew<CR>

" Floating
    nnoremap <C-s> :vsplit <CR>

" Fzf configuration
    nnoremap <C-]>  :BLines <CR>
    nnoremap <C-f>  :Files <CR>

" Fugitive configuration
   " nnoremap <C-D> :NERDTreeToggle <CR>
   
" NERDTree configuration
   nnoremap <leader>gs :Gstatus<CR>
   nnoremap <leader>gc :Git commit -v -q<CR>
   nnoremap <leader>ga :Gcommit --amend<CR>
   nnoremap <leader>gt :Gcommit -v -q %<CR>
   nnoremap <leader>gd :Gdiff<CR>
   nnoremap <leader>ge :Gedit<CR>
   nnoremap <leader>gr :Gread<CR>
   nnoremap <leader>gw :Gwrite<CR><CR>
   nnoremap <leader>gl :silent! Glog<CR>
   nnoremap <leader>gp :Ggrep<Space>
   nnoremap <leader>gm :Gmove<Space>
   nnoremap <leader>gb :Git branch<Space>
   nnoremap <leader>go :Git checkout<Space>
   nnoremap <leader>gps :Dispatch! git push<CR>
   nnoremap <leader>gpl :Dispatch! git pull<CR>
   
" set splitbelow
    "set splitright
    "split navigations
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

" Make python code look pretty
    let python_highlight_all=1

" Make markdown look pretty
    au BufNewFile, BufFilePre, BufRead *.md set filetype=markdown
    set syntax=markdown

" Vimwiki configurations
	let g:vimwiki_global_ext = 0
	let g:vimwiki_list = [{'path':'~/vimwiki', 'syntax':'markdown', 'ext':'.md'}]

    command! Diary VimwikiDiaryIndex
    augroup vimwikigroup
        autocmd!
        " automatically update links on read diary
        autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
    augroup end
" Vim airline configurations
	let g:airline#extensions#tabline#enabled=1
	let g:airline#extensions#tabline#left_sep=' '
	let g:airline#extensions#tabline#left_alt_sep='|'

" AirlineTheme Simple
    " let g:airline_theme='papercolor'
    let g:airline_theme='simple'

" Colorscheme
   colorscheme delek 

" Hexokinase
    " All possible values
    let g:Hexokinase_optInPatterns = [
    \    'full_hex',
    \    'triple_hex',
    \    'rgb',
    \    'rgba',
    \    'hsl',
    \    'hsla',
    \    'colour_names'
    \]

" PDF opener
	:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
	:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78
