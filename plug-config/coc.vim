nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

"append result on current expression
nnoremap <Leader>cra <Plug>(coc-calc-result-append)
" replace result on current expression
nmap <Leader>cr <Plug>(coc-calc-result-replace)"

inoremap <silent><expr> <C-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

let g:coc_global_extensions = [
    \ 'coc-marketplace',
    \ 'coc-cmake',
    \ 'coc-ccls',
    \ 'coc-pairs',
    \ 'coc-prettier',
    \ 'coc-snippets',
    \ 'coc-vimlsp'
    \ ]

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"inoremap <silent><expr> <TAB>
"    \ pumvisible() ? coc#_select_confirm() :
    "\ coc#expandableOrJumpable() ?
    "\ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    "\ "\<TAB>" :
    "\ coc#refresh()
"let g:coc_snippet_next = '<tab>'

hi CocUnderline ctermfg=red gui=underline term=underline
hi CocErrorHighlight ctermfg=red  guifg=#c4384b gui=underline term=underline
hi CocWarningHighlight ctermfg=yellow guifg=#c4ab39 gui=underline term=underline
set pumheight=20

autocmd FileType cpp let b:coc_pairs_disabled=['<']
autocmd FileType c let b:coc_pairs_disabled=['<']
autocmd FileType py let b:coc_pairs_disabled=['<']
