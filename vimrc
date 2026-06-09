let mapleader = ","
let maplocalleader = ","

set clipboard=unnamedplus,unnamed

set nocompatible
filetype plugin on
syntax on
filetype indent on

set mouse=a
set number
set relativenumber
set updatetime=100
set ruler
set backspace=indent,eol,start

" Tabs and indenting
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set scrolloff=3

" Command line completion options
set showcmd
set wildmenu

" searching
set incsearch
set hlsearch
set ignorecase

" Plugins
call plug#begin()

Plug 'prabirshrestha/vim-lsp'
Plug 'tpope/vim-sensible'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'tomasiser/vim-code-dark'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'vimwiki/vimwiki'
Plug 'airblade/vim-gitgutter'

call plug#end()

" LSP
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

" Vim-Wiki
let g:vimwiki_list = [{'syntax':'markdown',
            \  'path': '~/Documents/wiki',
            \  'ext':'md'}]

augroup DiaryTemplate
    autocmd!
    autocmd BufNewFile *diary/*.md 0r! ~/Documents/wiki/diary.py '%'
augroup END

" Theme
colorscheme codedark
