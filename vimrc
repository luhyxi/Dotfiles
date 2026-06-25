" ------------------------------------------
"                  MISC
" ------------------------------------------

let mapleader = ","
let maplocalleader = ","

let g:clipboard = {
  \   'name': 'wl-clipboard',
  \   'copy':  { '+': 'wl-copy',               '*': 'wl-copy' },
  \   'paste': { '+': 'wl-paste --no-newline',  '*': 'wl-paste --no-newline' },
  \   'cache_enabled': 1,
  \ }

set clipboard=unnamedplus

set nocompatible
filetype plugin on
syntax on
filetype indent on

set mouse=a
set number
set relativenumber
set updatetime=1000
set ruler
set backspace=indent,eol,start

set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set scrolloff=3

set showcmd
set wildmenu

set incsearch
set hlsearch
set ignorecase

" ------------------------------------------
"                 PLUGINS
" ------------------------------------------
call plug#begin()

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'tpope/vim-sensible'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'tomasiser/vim-code-dark'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'vimwiki/vimwiki'
Plug 'airblade/vim-gitgutter'

call plug#end()

" ------------------------------------------
"                   LSP
" ------------------------------------------
if executable('csharp-ls')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'csharp-ls',
                \ 'cmd': {server_info->['csharp-ls']},
                \ 'allowlist': ['cs'],
                \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" ------------------------------------------
"                 VIM-WIKI
" ------------------------------------------

let g:vimwiki_list = [{'syntax':'markdown',
            \  'path': '~/Documents/wiki',
            \  'ext':'md'}]

augroup DiaryTemplate
    autocmd!
    autocmd BufNewFile *diary/*.md 0r! ~/Documents/wiki/diary.py '%'
augroup END

" ------------------------------------------
"                AUTOSAVE
" ------------------------------------------
augroup autosave
    autocmd!
    autocmd BufRead * if &filetype == "" | setlocal ft=text | endif
    autocmd FileType * autocmd CursorHold,CursorHoldI <buffer> if &readonly == 0 && filereadable(bufname('%')) | silent write | endif
augroup END

" Use persistent history
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile

" ------------------------------------------
"                REMAPS 
" ------------------------------------------
noremap  [1;5D b
noremap  [1;5C w
inoremap [1;5D <C-o>b
inoremap [1;5C <C-o>w

" ------------------------------------------
"                THEME
" ------------------------------------------
colorscheme codedark
