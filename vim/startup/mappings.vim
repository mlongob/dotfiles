" Mappings

"Kill the arrow keys to force practice with hjkl
no <up> <Nop>
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
ino <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>

" Map jk to ESC for easy hand-positioning
ino jk <esc>

"" F-Keys Mapping
" Toggle paste mode
set pastetoggle=<F2>

" toggle hlsearch
nmap <silent> <F3> :set nohlsearch!<CR>
imap <silent> <F3> <c-o>:set nohlsearch!<CR>

" Toggle Syintax Highlighting
nnoremap <F4> :call ToggleSyntax()<CR>

" Switch between conventional/relative numbering
nnoremap <F5> :call ToggleNumbering()<CR>

" Expand Tab Toggle
nn <F6> :set expandtab!<CR>

" Toggle Gundlo
nnoremap <F7> :GundoToggle<CR>

" Toggle TabBar
nnoremap <F8> :TagbarToggle<CR>

" Toggle Gitgutter
nnoremap <F9> :GitGutterToggle<CR>

" YouCompleteMe mappings
nnoremap <F12> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" Open Nerdtree in new tab
nn <Leader>h :tabnew %:h<CR>

" Tab handling shortcuts
nn <C-Tab> :tabnext<CR>
nn <C-S-Tab> :tabprevious<CR>
no <C-S-Tab> :tabprevious<CR>
no <C-Tab> :tabnext<CR>
ino <C-S-Tab> <ESC>:tabprevious<CR>
ino <C-Tab> <ESC>:tabnext<CR>

" Open and source .vimrc and startup scripts
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>em :vsplit ~/.vim/startup/mappings.vim<cr>
nnoremap <leader>es :vsplit ~/.vim/startup/settings.vim<cr>
nnoremap <leader>ep :vsplit ~/.vim/startup/plugins.vim<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>sm :source ~/.vim/startup/mappings.vim<cr>
nnoremap <leader>ss :source ~/.vim/startup/settings.vim<cr>

"Nerd Tree
nnoremap <leader>nt :NERDTreeToggle<cr>

" Clang format wrapper
map <leader>cf :pyf /bb/bigstorq4/scrpbuild/devtools/bin/clang-format.py<CR>
imap <leader>cf <ESC>:pyf /bb/bigstorq4/scrpbuild/devtools/bin/clang-format.py<CR>i
map <leader>sf :silent !toolkit-remote nylxdev2 /bb/bigstorq4/scrpbuild/devtools/bin/scrp_code_format.py %<CR>:e<CR>:redraw!<CR>

" Paste with shift+ins
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
