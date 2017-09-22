
set nocompatible
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"Plugin 'godlygeek/tabular' " for text filtering and alignment
"Plugin 'groenewege/vim-less' " vim syntax for LESS (dynamic CSS)
Plugin 'janko-m/vim-test'
Plugin 'kien/ctrlp.vim'
Plugin 'mfukar/robotframework-vim'
Plugin 'moll/vim-node' "Like vim-rails but for node
"Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mxw/vim-jsx'
Plugin 'mzlogin/vim-markdown-toc'
Plugin 'othree/html5-syntax.vim' " For HTML5 syntax
Plugin 'othree/javascript-libraries-syntax.vim' " Syntax higlighting for JS libraries
Plugin 'pangloss/vim-javascript'
Plugin 'prettier/vim-prettier'
Plugin 'rizzatti/dash.vim'
Plugin 'rking/ag.vim'
Plugin 'rust-lang/rust.vim'
"Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'szw/vim-tags'
Plugin 'slim-template/vim-slim'
"Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rvm'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = ","
set number
set expandtab
set modeline
set tabstop=2
set shiftwidth=2
set smartindent
set autoindent
set backspace=2
set cursorline
set relativenumber

syntax on             " Enable syntax highlighting
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
colorscheme grb256

map <leader>ds <Plug>DashSearch

" vim-test mappings
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tv :TestVisit<CR>
nmap <silent> <leader>l :TestLast<CR>
let test#strategy = "dispatch"

" run tests with Dispatch
let g:rspec_command = "Dispatch rspec {spec}"

" vim-rails mappings
map <leader>a :A<CR> 

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" window settings
set winwidth=84
set winminwidth=30
set winheight=10
set winminheight=10
set winheight=999

 set wildignore+=*.o,*.png,*.PNG,*.JPG,*.jpg,*.jpeg,*.JPEG,*.gif,*.pdf,*.jar,*.scssc,coverage/**,tmp/**

" Vim 7.4 is really slow with Ruby files unless you set this.
set regexpengine=1

" ctrl-p config
"let g:ctrlp_match_window_bottom = 0
"let g:ctrlp_match_window_reversed = 0
"let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = {
\ 'dir': '\v[\/](doc|tmp|node_modules)$',
\ 'file': '\v\.(exe|so|dll)$'
\ }

" search stuff
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

set list
set listchars=tab:▸\ ,eol:¬

" correct movement
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" exit from insert mode
inoremap jj <ESC>

" save when losing focus
au FocusLost * :wa

" vim-jsx
let g:jsx_ext_required = 0

"autreload config
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" remove white space
autocmd FileType ruby,rb,yml,sh,py,feature,txt,md,js,jsx,coffee,slim,haml autocmd BufWritePre <buffer> :%s/\s\+$//e

:autocmd BufEnter * Rvm

vmap <leader>y :w !pbcopy<CR><CR>
vmap <leader>mnbe "tdma?describe<CR>obefore :each do<CR>end<CR><esc>k"tP'a
nnoremap <leader>os :vsplit<cr><C-j>:A<cr>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>ye <C-v>$y
nnoremap <leader>pn :split .project_notes.md<cr>
nnoremap <leader>e :Explore<cr>
