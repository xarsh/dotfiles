" Auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END


"******************
"" NeoBundle core
"******************
if has('vim_starting')
  set nocompatible

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone --depth 1 https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'


"******************
" Plugins
"******************
" Color schemes
NeoBundle 'ywjno/vim-tomorrow-theme'
NeoBundle 'vim-scripts/pyte'

" Interface
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'scrooloose/nerdtree'

" Editor
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tomtom/tcomment_vim'

" Languages
NeoBundle 'itchyny/vim-haskell-indent'
NeoBundle 'tpope/vim-endwise'

" Misc
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/vimplenote-vim'

call neobundle#end()

filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


"******************
" UI
"******************
" Color scheme
colorscheme Tomorrow


"******************
" Editor config
"******************
" Encoding
set encoding=utf-8
scriptencoding utf-8
set bomb
set binary
set ttyfast

" Show linenumbers and cursor position
set number
set numberwidth=4
set ruler

" Enable syntax highlighting
syntax enable

" Tab, space and indent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Search setting
set ignorecase
set smartcase
set incsearch
set hlsearch
noremap <Esc><Esc> :nohlsearch<CR><Esc>

" Use clipboard for yank
set clipboard=unnamed,autoselect

" Fix backspace indent
set backspace=indent,eol,start

" Stop beeping
set visualbell t_vb=
set noerrorbells

" Prevent generating swp and backup files
set nobackup
set noswapfile

" Show current cursor line
set cursorline

" Status bar
set laststatus=2

" Automatically append closing characters
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>


"******************
" Editor config
"******************
" Change tabs
nnoremap <C-n> gt
nnoremap <C-p> gT

" Swap colon and semi-colon
noremap ; :
noremap : ;

" Toggle filetree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" Move cursor by display lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" ^ and $ is too far to type
noremap <Space>h  ^
noremap <Space>l  $

