
set nocompatible
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'gorkunov/smartpairs.vim'
Plugin 'janko-m/vim-test'
Plugin 'junegunn/fzf.vim'
Plugin 'mfukar/robotframework-vim'
Plugin 'moll/vim-node' "Like vim-rails but for node
Plugin 'mzlogin/vim-markdown-toc'
Plugin 'prettier/vim-prettier'
Plugin 'rizzatti/dash.vim'
Plugin 'rking/ag.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'szw/vim-tags'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'shumphrey/fugitive-gitlab.vim'
Plugin 'tommcdo/vim-fubitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-rails'
"Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
"Plugin 'w0rp/ale'
Plugin 'elixir-editors/vim-elixir'
Plugin 'mhinz/vim-mix-format'

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
let test#ruby#rspec#executable = 'bundle exec rspec'

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

let g:mix_format_on_save = 1

" correct movement
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
noremap <down> <nop>
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

set rtp+=$BREW_FZF_PATH
let g:fzf_layout = { 'down': '~40%' }

let g:airline#extensions#ale#enabled = 1

" ALE
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre  *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'false'

" print spaces between brackets
" Prettier default: true
let g:prettier#config#bracket_spacing = 'true'

" put > on the last line instead of new line
" Prettier default: false
let g:prettier#config#jsx_bracket_same_line = 'false'
" none|es5|all
" Prettier default: none
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#config_precedence = 'prefer-file'

" show linenumber/char position
set ruler

" Highlight 
let &colorcolumn=join(range(80,100),",").join(range(120,999),",")
hi ColorColumn guibg=#262D51 ctermbg=233

vmap <leader>y :w !pbcopy<CR><CR>
vmap <leader>mnbe "tdma?describe<CR>obefore :each do<CR>end<CR><esc>k"tP'a
nnoremap <leader>os :vsplit<cr><C-j>:A<cr>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>ye <C-v>$y
nnoremap <leader>pn :split .project_notes.md<cr>
nnoremap <leader>e :Explore<cr>
nmap <c-p> :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>r :Tags<CR>

" Split long ruby line to multiple lines, https://vi.stackexchange.com/a/7819
command! SplitDot let _s=@/ <bar> s/\v\.\w+%(\([^)]+\)|\{[^}]+})*/\r\0/g <bar> let @/=_s <bar> keepjumps normal! ``=']']
nnoremap <Leader>sd :SplitDot<CR>
