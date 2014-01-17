execute pathogen#infect()
syntax on
filetype plugin indent on


" Basic options {{{
let mapleader=','

vnoremap < <gv
vnoremap > >gv
noremap % v%

func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

scriptencoding utf-8
set encoding=utf-8              " setup the encoding to UTF-8
set ls=2                        " status line always visible

"let &t_Co=256
set background=dark
"colors jellybeans
colorscheme Tomorrow-Night
set cursorline                  " highlight the line under the cursor
set number

" }}}

" active mouse on terminal
set mouse=a

" Turn off swap files

set noswapfile
set nobackup
set nowb

"  Searching {{{

set incsearch                   " incremental searching
set showmatch                   " show pairs match
set hlsearch                    " highlight search results
set smartcase                   " smart case ignore
set ignorecase                  " ignore case letters

"  }}}

" Tabs, space and wrapping {{{

set expandtab                  " spaces instead of tabs
set tabstop=2                  " a tab = two spaces
set shiftwidth=2               " number of spaces two auto-indent
set softtabstop=2              " a soft-tab of two spaces
set autoindent                 " set on the auto-indent

" }}}

" PLUGINS Setup {{{ ===========================================================
" Airline {{{

set noshowmode
let g:airline_theme='tomorrow'
let g:airline_enable_branch=1
"let g:airline_powerline_fonts=2
let g:airline_detect_whitespace=1
let g:airline#extensions#hunks#non_zero_only = 1

" let g:airline#extensions#tabline#enabled = 2
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#buffer_min_count = 1

" }}}

map <silent><C-r> :NERDTreeToggle <CR>
vmap <silent><C-r> :NERDTreeToggle <CR>

" CoffeeScript {{{

map <Leader>rw :CoffeeWatch vert<CR>

" }}}

" END PLUGINS SETUP }}}

" FILETYPES  {{{  ==============================================================

" JSON {{{

autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.json set ft=json


vmap <leader>s :sort u<CR>
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

" }}}

" PYTHON {{{

au FileType python setlocal foldlevel=1000

" }}}

" MARKDOWN {{{

" markdown filetype file
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
autocmd FileType markdown NeoBundleSource vim-markdown

" }}}

" END FILETYPES }}}

if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

let g:tagbar_type_typescript = {
    \ 'ctagstype' : 'typescript',
    \ 'kinds' : [
        \ 'c:classes',
        \ 'n:modules',
        \ 'f:functions',
        \ 'v:variables',
        \ 'v:varlambdas',
        \ 'm:members',
        \ 'i:interfaces',
        \ 'e:enums',
    \ ]
\ }
