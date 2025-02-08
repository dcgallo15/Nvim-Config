let g:airline_theme='minimalist' "Airline colors
let g:airline_symbols_ascii=0
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_section_c='%t'
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#whitespace#mixed_indent_algo=1

let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
if g:airline_theme == 'badwolf'
  for colors in values(a:palette.inactive)
    let colors[3] = 245
  endfor
endif
endfunction
