"plugins {{{
call plug#begin()
    "status line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    "latex
    Plug 'lervag/vimtex'

    "snipets
    Plug 'sirver/ultisnips'

    "git integration
    Plug 'tpope/vim-fugitive'

    "more syntax highlight for c/c++
    Plug 'https://github.com/bfrg/vim-cpp-modern'

    "syntastic cheker
    "Plug 'vim-syntastic/syntastic'
    "Plug 'myint/syntastic-extras'

    "colorschemes
    Plug 'https://github.com/sainnhe/sonokai'
    Plug 'https://github.com/arcticicestudio/nord-vim.git'
    Plug 'https://github.com/morhetz/gruvbox.git'
call plug#end()
" }}}

"standard {{{
set nocompatible "no VI-compatible
syntax on
set number relativenumber
set cursorline "highlight current line
set showcmd "show typing command in the last line of the screen
set hidden "change file without writing current
set autochdir "switch to current file's parent directory.
set mouse=a "enable mouse
set novisualbell "disable blinking
set t_vb= "disable sounds
set wrap nolist "linebreak "not change the text but simply displays it on multiple lines when wrap
set path+=$PWD/** "for search
set path+=university/** "for search
set path+=uncode/** "for search
"set path=$PWD/**
set nobackup "disable backup files
set noswapfile "disable swap files
set ignorecase "ignore case when searching
set spelllang=en,ru,uk,en_us spell
set encoding=UTF-8
set wildmenu
"}}}

" indents {{{
set tabstop=4 "number of spaces that <Tab> in the file counts for
set shiftwidth=4
set smarttab "delete full indents with <backspace> in line start
set expandtab "use to spaces to insert a <Tab>
set autoindent "copy indent from current line
set backspace=indent,eol,start whichwrap+=<,>,[,]
autocmd BufWritePre * :%s/\s\+$//e "auto delete trailing spaces when write
"}}}

"diffent cursor among mods {{{
let &t_SI.="\e[5 q" "SI = режим вставки
let &t_SR.="\e[3 q" "SR = режим замены
let &t_EI.="\e[2 q" "EI = нормальный режим
"Где 1 - это мигающий прямоугольник
"2 - обычный прямоугольник
"3 - мигающее подчёркивание
"4 - просто подчёркивание
"5 - мигающая вертикальная черта
"6 - просто вертикальная черта
" }}}

" config airline {{{
"let g:airline_symbols_ascii = 1
"let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_section_a = airline#section#create(['mode', 'crypt', 'paste', 'iminsert'])
let g:airline_section_z = "%p%% \ln:%l/%L Col:%c" "Кастомная графа положения курсора


let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#formatter='default'

set noshowmode " No show the mode you are on the last line(have in airline)
set shortmess-=S "match number while searching

let g:airline_theme='nord'
"'distinguished'
" }}}

"config syntastic cheker {{{
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"Jset statusline+=%*
"let g:syntastec_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] } "disable checker by default
"let g:syntastic_check_on_wq = 0 "disable syntastic chek when wq
"let g:syntastic_enable_highlighting = 0 "disable highlighting
"}}}

" config vimtex{{{
let g:syntastic_tex_checkers = ['lacheck']
"}}}

"config ult snips{{{
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"}}}

" folding in vim files{{{
augroup filtetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}

"nnoremap {{{
nnoremap <space><space> :set nohlsearch!<CR>

nnoremap Y y$


nnoremap go o<Esc>
nnoremap gO O<Esc>

nnoremap <Up>       :resize -2<CR>
nnoremap <Down>     :resize +2<CR>
nnoremap <Right>    :vertical resize +2<CR>
nnoremap <Left>     :vertical resize -2<CR>

nnoremap <C-j>   <C-w>j
nnoremap <C-k>   <C-w>k
nnoremap <C-h>   <C-w>h
nnoremap <C-l>   <C-w>l

nnoremap \c :w !clang -std=c11 -lm -Wall -Wextra -Wpedantic -o test.out *.c <CR>
nnoremap \r :w !./test.out <CR>

nnoremap <C-c>  :SyntasticReset<CR>

"}}}

""{{{ inoremap
inoremap <silent>  jj  <esc>
inoremap <silent> ii  <esc>
inoremap {<CR> {<CR>}<C-o>O
inoremap (( ()<left>
inoremap [[ []<left>
inoremap {{ {}<left>

inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
""}}}

"abbreviate {{{
abbreviate mainv int main(void) {<CR>
       \<CR>return 0;<UP><space><space><space>

abbreviate maina int main(int argc, char **argv) {<CR>
        \<CR>return 0;<UP><space><space><space>
"}}}


if has('termguicolors')
    set termguicolors
endif

"let g:sonokai_transparent_background = 1
"let g:sonokai_disable_italic_comment = 1
"let g:sonokai_style = 'espresso'
"colorscheme sonokai

colorscheme nord
let g:nord_underline = 1
let g:nord_cursor_line_number_background = 1

"transparency
hi Normal guibg=NONE ctermbg=NONE

"hi spell error
"area dsjf
hi clear SpellBad
hi SpellBad cterm=underline
hi SpellBad gui=undercurl

"hi folding
hi clear Folded
hi Folded ctermbg=grey
hi Folded guifg=#6b859f
