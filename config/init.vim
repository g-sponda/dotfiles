set path+=**

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! CheckIfCurrentBufferIsFile()
  return strlen(expand('%')) > 0
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && CheckIfCurrentBufferIsFile() && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()

function! ToggleTree()
  if CheckIfCurrentBufferIsFile()
    if IsNERDTreeOpen()
      NERDTreeClose
    else
      NERDTreeFind
    endif
  else
    NERDTree
  endif
endfunction

nmap ,/ :call ToggleTree()<CR>


set modifiable
set tabstop=2
set shiftwidth=2
set expandtab


" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


" CoC Config

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


" use <c-space>for trigger completion
inoremap <silent><expr> <NUL> coc#refresh()

" use <c-space>for trigger completion
"inoremap <silent><expr> <c-space> coc#refresh()


inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"




let NERDTreeWinSize = 20
"set relativenumber

" turn hybrid line numbers on
:set number relativenumber
:set nu rnu

"set clipboard=unnamedplus

" Copy paste yanked instead of deleted 
nmap ,p "0p
nmap ,P "0P

nmap ,b :Telescope file_browser<CR><ESC>
nmap ,l :Telescope find_files<CR><ESC>

set noincsearch
set scrolloff=15

" Enable mouse
set mouse=a

" Enable syntax highlight
syntax enable
filetype plugin indent on

let g:rustfmt_autosave = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" Enable nerdtree
nmap ,t :NERDTreeToggle<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>


"nmap <C-S-t> :TagbarToggle<CR>
vmap <C-c> y

filetype off                  " required




" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Installed
"

Plugin 'preservim/nerdtree'
Plugin 'itchyny/lightline.vim'

Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/syntastic'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'hashivim/vim-terraform'
Plugin 'vim-airline/vim-airline'
Plugin 'tomasr/molokai'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'gmarik/vundle'
Plugin 'dag/vim-fish'
Plugin 'neovim/nvim-lspconfig'
Plugin 'neovim/nvim-lsp'
Plugin 'preservim/tagbar'

call vundle#end()            " required
filetype plugin indent on    " required

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mhinz/vim-startify'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'tpope/vim-commentary'
Plug 'xiyaowong/nvim-transparent'
Plug 'ellisonleao/glow.nvim'

" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'fannheyward/telescope-coc.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }


call plug#end()
colorscheme dracula


set completeopt=menu,menuone,noselect

let g:transparent_enabled = v:true
