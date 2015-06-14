" Plugins and plugin configuration

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'gmarik/Vundle.vim'

" Undo/Redo Tree
Plugin 'sjl/gundo.vim'

" Smarter '.'
Plugin 'tpope/vim-repeat'

" Explorer for buffers
Plugin 'jlanzarotta/bufexplorer'

" Automatic space alignment
Plugin 'godlygeek/tabular'

" <p>Surrond</p>
Plugin 'tpope/vim-surround'

" Ctrl A/X increase/descrease on steroids
Plugin 'tpope/vim-speeddating'

" [ and ] mappings on steroids
Plugin 'tpope/vim-unimpaired'

" Dipatch build/test
Plugin 'tpope/vim-dispatch'
set makeprg=toolkit-remote\ nylxdev2\ gmake\ -j

" Fugitive Git Wrapper
Plugin 'tpope/vim-fugitive'

" Set directory to vim root
Plugin 'airblade/vim-rooter'

" Phabricator Arcanist Wrapper
Plugin 'phleet/vim-arcanist'

" Doxygen comments
Plugin 'DoxygenToolkit.vim'
let g:DoxygenToolkit_authorName="Mario Longobardi <mlongobardi2@bloomberg.net>"

" Clang format for C/C++/ObjC
"Plugin 'kana/vim-operator-user'
"Plugin 'rhysd/vim-clang-format'
" map to <Leader>cf in C++ code
"autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
"autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
"autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)

" Diff signs in gutter for Git index/working diffs
Plugin 'airblade/vim-gitgutter'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_max_signs = 1000

" Git Exploration plugin
Plugin 'gregsexton/gitv'

" NERDTree for silesystem exploation
Plugin 'scrooloose/nerdtree'
if g:platform == "AIX"
    let NERDTreeDirArrows=0
endif
let NERDTreeShowBookmarks=1

" ctrlP Plugin
Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" NERDCommenter for easy commenting
Plugin 'scrooloose/nerdcommenter'

" Airline for pretty status/tab lines
Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1 " git gutter
if g:platform == "Linux" || g:platform == "SunOS"
    " Use Patched fonts on Linux and Sun
    let g:airline_powerline_fonts = 1
endif

" Colorschemes
Plugin 'nanotech/jellybeans.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'endel/vim-github-colorscheme'
Plugin 'flazz/vim-colorschemes'

" Makes GVim colorscheme available in the terminal
"Plugin 'godlygeek/csapprox'

" Syntax checking
Plugin 'scrooloose/syntastic'

if g:platform != "AIX"
    let g:syntastic_error_symbol = '✗✗'
    let g:syntastic_style_error_symbol = '✠✠'
    let g:syntastic_warning_symbol = '∆∆'
    let g:syntastic_style_warning_symbol = '≈≈'
endif

" ListToggle for display of quickfix/location list
Plugin 'Valloric/ListToggle'

" Alternate for C/C++ Header/Source navigation
Plugin 'a.vim'

" Easymotion for superquick motions
Plugin 'Lokaltog/vim-easymotion'

" Easy Ctag explorer
Plugin 'majutsushi/tagbar'

" Tmux movement mappings
Plugin 'christoomey/vim-tmux-navigator'

" Linux-Only plug-ins
if g:platform == "Linux"
    " Autocompletion and semantic completion
    Plugin 'Valloric/YouCompleteMe'
    "let g:ycm_server_log_level = 'debug'
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_always_populate_location_list = 1
    let g:ycm_global_ycm_extra_conf = '~/.ycm_default_conf.py'

    " Show Location list output in airline
    Plugin 'asenac/vim-airline-loclist'
    let g:airline#extensions#loclist#enabled = 1

    " Nice airline-like bash prompt
    Plugin 'edkolev/promptline.vim'
    let g:promptline_theme = 'airline'

    " Nice airline-like tmux prompt
    "Plugin 'edkolev/tmuxline.vim'

    " Snippets
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    " Trigger configuration. Do not use <tab>.
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    let g:UltiSnipsEditSplit="vertical"
endif

"" Stuff I want to try
"Plugin 'tpope/vim-vinegar'
"Plugin 'jiangmiao/auto-pairs'
"Plugin 'xolox/vim-session'
"Plugin 'junegunn/vim-easy-align'
"Plugin 'rhysd/clever-f.vim'

call vundle#end()
filetype plugin indent on

" Configure Promptline Preset
if g:platform == "Linux"
    let g:promptline_preset = {
        \'a' : [ promptline#slices#host() ],
        \'b' : [ promptline#slices#user() ],
        \'c' : [ promptline#slices#vcs_branch(), promptline#slices#cwd() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}
endif

" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
