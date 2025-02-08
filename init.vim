syntax on
syntax enable
filetype on
filetype plugin on
filetype plugin indent on

"Preferences
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set wrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set noshowmode
set signcolumn=yes
set nohlsearch
set ff=unix
set noacd
set laststatus=2
set modifiable
set termguicolors

"To Render Whitespace `:set list`
set nolist
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set listchars+=space:␣

"Changing cursor highlight on insert mode
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf.vim' "NOTE: both are needed for fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'mbbill/undotree' "F4
Plug 'scrooloose/nerdcommenter' " \cc to comment, \ci to uncomment
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive' "For 'Git ...' instead of !:git...
Plug 'mhinz/vim-signify' "To show changes in git
Plug 'airblade/vim-gitgutter' "For git
Plug 'godlygeek/tabular' "Run :Tab to use
Plug 'ryanoasis/vim-devicons' "for icons with NERDTREE & airline
Plug 'rhysd/vim-clang-format' "formatting c code
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " syntax highlighting
Plug 'mg979/vim-visual-multi' "Multi cursor mode
Plug 'dcgallo15/fAlbero' "My calculator plugin
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'lervag/vimtex' "Latex
"Color Schemes
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim'
Plug 'aktersnurra/no-clown-fiesta.nvim'
call plug#end()

source $HOME/.config/nvim/plug-config/tagbar.vim
source $HOME/.config/nvim/plug-config/nerdtree.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/airline.vim
luafile $HOME/.config/nvim/plug-config/treesitter.lua

colorscheme no-clown-fiesta
set background=dark

augroup highlight_keyword
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO\|FIXME\|WARNING\|NOTE\|Plug', -1)
augroup END

"Visual Multi Bindings
let g:VM_default_mappings = 0
let g:VM_maps = {}
let g:VM_mouse_mappings = 1
let g:VM_maps["Select Cursor Down"] = 'm<Down>'
let g:VM_maps["Select Cursor Up"]   = 'm<Up>'

"Undotree
nnoremap <F4> :UndotreeToggle<cr>

"Gitgutter
highlight GitGutterAdd ctermfg=Green
highlight GitGutterChange ctermfg=Yellow
highlight GitGutterDelete ctermfg=Red
let g:gitgutter_signs=1
let g:gitgutter_enabled = 1

"FZF
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
nnoremap<C-p> :Files<CR>
nnoremap <C-f> :Rg<CR>

"Comments
"\cc toggles comments on
"\ci toggles
let g:NERDCreateDefaultMappings=1

"Nice Spacing
nnoremap <S-Tab> :Tab /
vnoremap <S-Tab> :Tab /

"Shows errors
nnoremap <C-e> :CocList --normal --no-quit diagnostics<CR>

"C++ compile
autocmd BufNewFile,BufRead *.cpp nnoremap<F5> :!g++ % -std=c++2a -Wall -Wextra -pedantic -o a.out && ./a.out<CR>
autocmd BufNewFile,BufRead *.cpp nnoremap t<F5> :!shopt -s xpg_echo && echo "Compile time: " && time g++ % -std=c++2a -O3 -o a.out && echo "\\nRuntime: \\n" && time ./a.out && echo "\\n Binary info: \\n" && ls -l a.out <CR>
"C compile
autocmd BufNewFile,BufRead *.c nnoremap<F5> :!gcc % -std=c11 -Wall -Wextra -pedantic -o a.out && ./a.out<CR>
autocmd BufNewFile,BufRead *.c nnoremap t<F5> :!shopt -s xpg_echo && echo "Compile time: " && time gcc % -std=c++2a -O3 -o a.out && echo "\\nRuntime: \\n" && time ./a.out && echo "\\n Binary info: \\n" && ls -l a.out <CR>
"Python compile
autocmd BufNewFile,BufRead *.py nnoremap <F5> :!python3 %<CR>
autocmd BufNewFile,BufRead *.py nnoremap t<F5> :!time python3 %<CR>
"Lua compile
autocmd BufNewFile,BufRead *.lua nnoremap <F5> :!lua %<CR>
"Typescript compile
autocmd BufNewFile,BufRead *.ts nnoremap <F5> :!tsc<CR>
"Markdown
autocmd BufNewFile,BufRead *.md nnoremap <F5> :MarkdownPreviewToggle<CR>
"Latex
autocmd BufNewFile,BufRead *.tex nnoremap <F5> :!latexmk %<CR>
autocmd BufNewFile,BufRead *.latex nnoremap <F5> :!latexmk %<CR>
"Scripting run commands
autocmd BufNewFile,BufRead *.out,*sh map <F5> :w <CR> :!./%<CR>
"Make
autocmd BufNewFile,BufRead Makefile map<F5> :!make <CR>

"MACROS
imap <Leader><Space> <Esc>/<++><Enter>"_c4l
"C Macros
autocmd BufNewFile,BufRead *.c imap ;f <++> <++>(<++>)<Space>{<Enter><Tab><++><Enter><Esc><Esc>3ki
autocmd BufNewFile,BufRead *.c imap ;m int main(int argc, char** argv) {<Enter><Tab><++><Enter><Esc><Esc>0i<Esc>4ki<leader><Space>
autocmd BufNewFile,BufRead *.c imap ;i #include <><Enter><++><Esc><Esc>k$i
autocmd BufNewFile,BufRead *.c imap ;l for(int i = 0;<++>;i++)<Space>{<Enter><++><Enter><Enter><++><Esc><Esc>5k0
"C++ Macros
autocmd BufNewFile,BufRead *.cpp imap ;f <++> <++>(<++>) <Enter><Backspace> <Esc><Esc>0i{<Enter><++><Enter><Esc><Esc>0i}<Enter><++><Esc>5ki
autocmd BufNewFile,BufRead *.cpp imap ;t template<><++><Esc><Esc>09li
autocmd BufNewFile,BufRead *.cpp imap ;c class <++> <Enter> <Esc><Esc>0i{<Enter><++><Enter><Esc><Esc>0i};<Enter><++><Esc>5ki
autocmd BufNewFile,BufRead *.cpp imap ;m int main() {<Enter><Tab><++><Enter><Esc><Esc>0i}<Esc>4ki
autocmd BufNewFile,BufRead *.cpp imap ;i #include <><Enter><++><Esc><Esc>k$i
autocmd BufNewFile,BufRead *.cpp imap ;l for(int i = 0;<++>;i++)<Space>{<Enter><++><Enter><Enter><++><Esc><Esc>5k0
"Python Macros
autocmd BufNewFile,BufRead *.py imap ;f def <++> (<++>):<Enter>><++><Esc><Esc>2k$i
autocmd BufNewFile,BufRead *.py imap ;m def main():<Enter><++><Enter><Enter><Backspace>if __name__ == "__main__":<Enter>main()<Esc><Esc>5k$i<Leader><Space>

"Splits
set splitbelow splitright

"For moving between splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"For changing split size
noremap <C-Left> :vertical resize +3<CR>
noremap <C-Right> :vertical resize -3<CR>
noremap <C-Up> :resize +3<CR>
noremap <C-Down> :resize -3<CR>

"For opening a console split
let $VIM_DIR=expand('%:p:h') "For cwd
nnoremap <C-T> :split term://bash<CR>:resize -10<CR>i cd $VIM_DIR && clear<CR>
nnoremap ;<C-T> :vsplit term://bash<CR>:resize -10<CR>i cd $VIM_DIR && clear<CR>

"Terminal Bindings
tnoremap <Esc> <C-\><C-n>
tnoremap <C-l> clear<CR>
"Closing the terminal
tnoremap <C-d> <C-\><C-n>:bd!<CR>
"Don't really need anymore:
tnoremap <C-q> <C-\><C-n>

"For swapping buffers
noremap <F12> :bn<CR>
noremap <F11> :bd<CR>

"Removes trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

