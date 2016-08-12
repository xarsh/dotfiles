" Auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

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
