" .vimrc
" Mario Longobardi

" ============================================================================
"  vim-plug
" ============================================================================
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

call plug#end()

" ============================================================================
"  Settings
" ============================================================================
set nocompatible
scriptencoding utf-8
set encoding=utf-8

" UI
set number
set relativenumber
set cursorline
set laststatus=2
set ruler
set showcmd
set showmode
set scrolloff=5
set splitbelow
set splitright
set nowrap

" Search
set incsearch
set hlsearch
set smartcase
set wrapscan

" Indentation
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab

" Editing
set backspace=indent,eol,start
set showmatch
set mouse=a

" Files
set autoread
set autowrite
set noswapfile
set nobackup
set nowritebackup
if has("persistent_undo")
    set undofile
    set undodir=~/.vim/undo
endif

" Completion
set wildmenu
set wildmode=list:longest,full
set wildignore=*/tmp/*,*.swp,*.o,*.pyc,*.jpg,*.gif,*.png,*.a,*.so

" History
set history=1000

" Misc
set noexrc
set secure
set noerrorbells
set novisualbell

" ============================================================================
"  Colors
" ============================================================================
set termguicolors
syntax enable
colorscheme catppuccin_mocha

" Simple statusline (no plugin needed)
set statusline=%f\ %m%r%h%w\ %y\ [%{&ff}]%=%l/%L\ col\ %c\ %p%%

" ============================================================================
"  Functions
" ============================================================================
function! TrimWhitespace()
    %s/\s\+$//e
    ''
endfunction

function! ToggleSyntax()
    if exists("g:syntax_on")
        syntax off
    else
        syntax enable
    endif
endfunction

" ============================================================================
"  Autocommands
" ============================================================================
" Jump to last cursor position when reopening a file
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif

" Filetype-specific settings
autocmd FileType html,htmldjango setlocal textwidth=0 matchpairs+=<:> softtabstop=2 shiftwidth=2
autocmd FileType make setlocal noexpandtab shiftwidth=8
autocmd FileType xsd,xml setlocal textwidth=0

" ============================================================================
"  Mappings
" ============================================================================
let mapleader = "\\"

" jk to exit insert mode
inoremap jk <Esc>

" Disable arrow keys — use hjkl
noremap  <Up>    <Nop>
noremap  <Down>  <Nop>
noremap  <Left>  <Nop>
noremap  <Right> <Nop>
inoremap <Up>    <Nop>
inoremap <Down>  <Nop>
inoremap <Left>  <Nop>
inoremap <Right> <Nop>

" Save
nnoremap <leader>w :w<CR>

" Toggle hlsearch
nmap <silent> <F2> :set nohlsearch!<CR>
imap <silent> <F2> <C-o>:set nohlsearch!<CR>

" Toggle paste mode
set pastetoggle=<F3>

" Toggle syntax highlighting
nnoremap <F4> :call ToggleSyntax()<CR>

" Toggle relative numbers
nnoremap <F5> :set relativenumber!<CR>

" Tab navigation
nnoremap <C-Tab>   :tabnext<CR>
nnoremap <C-S-Tab> :tabprevious<CR>
inoremap <C-Tab>   <Esc>:tabnext<CR>
inoremap <C-S-Tab> <Esc>:tabprevious<CR>

" Edit/reload vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" fzf
nnoremap <C-p>      :Files<CR>
nnoremap <leader>b  :Buffers<CR>
nnoremap <leader>rg :Rg<CR>

" Trim trailing whitespace
nnoremap <leader>tw :call TrimWhitespace()<CR>

" ============================================================================
"  Plugin config
" ============================================================================

" gitgutter
let g:gitgutter_max_signs = 1000

" vim-tmux-navigator — don't use default mappings, keep C-l for clear
let g:tmux_navigator_no_mappings = 1
nnoremap <C-h> :TmuxNavigateLeft<CR>
nnoremap <C-j> :TmuxNavigateDown<CR>
nnoremap <C-k> :TmuxNavigateUp<CR>
nnoremap <C-l> :TmuxNavigateRight<CR>

" ============================================================================
"  Local overrides
" ============================================================================
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
