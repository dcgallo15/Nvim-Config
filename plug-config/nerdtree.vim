"If nerdtree only buffer quit
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Make it look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
let NERDTreeHijackNetrw = 1
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,*.d
let NERDTreeRespectWildIgnore=1
let NERDTreeStatusline="%{ getcwd() }"
nnoremap <C-b> :NERDTreeToggle<CR>

