let mapleader = ","
set textwidth=0
set number
set tabstop=4
set autoindent
set cursorline
set display=lastline
set nowrap
syntax on

let delimitMate_expand_cr = 1
let g:syntastic_auto_loc_list=0


"Tagbar
let g:tagbar_ctags_bin='/usr/local/bin/ctags'  " Proper Ctags locations
let g:tagbar_width=26                          " Default is 40, seems too wide
nmap <F8> :TagbarToggle<CR>

"Bindings
let g:user_zen_next_key = '<c-n>'
let g:user_zen_expandabbr_key = '<c-e>'
let g:ctrlp_map = '<c-p>'
nnoremap <F5> :GundoToggle<CR>
nmap <silent> <C-D> :NERDTreeToggle<CR>

"Zen Coding Indents
  let g:user_zen_settings = {
  \  'html' : {
  \    'indentation' : '	'
  \  },
  \}

" Easier split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Writing Mode
func! WordProcessorMode()
  setlocal formatoptions=1
  setlocal noexpandtab
  map j gj
  map k gk
  nnoremap j gj
  nnoremap k gk
  vnoremap j gj
  vnoremap k gk
  setlocal spell spelllang=en_gb
  set thesaurus+=/Users/jfree/.vim/thesaurus/mthesaur.txt
  set complete+=s
  set formatprg=par
  setlocal wrap
  set tw=80
  setlocal linebreak
  set gfn=Cousine:h13
  set nonumber
  set linespace=5
  set background=light
  set laststatus=2
  set nocursorline
  set spellsuggest=best,10
endfu
com! WP call WordProcessorMode()


set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree.git'
Bundle 'Syntastic'
Bundle 'goldfeld/vim-seek.git'
Bundle 'kien/ctrlp.vim.git'
Bundle 'majutsushi/tagbar.git'
Bundle 'tsaleh/vim-matchit.git'
Bundle 'gregsexton/MatchTag'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'tpope/vim-surround.git'
Bundle 'vim-scripts/AutoComplPop.git'
Bundle 'mattn/zencoding-vim.git'
Bundle 'airblade/vim-gitgutter.git'
Bundle 'ap/vim-css-color.git'
Bundle 'sjl/gundo.vim.git'
Bundle 'vim-scripts/php.vim-html-enhanced.git'
Bundle 'mileszs/ack.vim'
Bundle 'Raimondi/delimitMate.git'

 filetype plugin indent on     " required!

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0