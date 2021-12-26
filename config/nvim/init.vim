" set path+=**

" Tab and spaces
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

set relativenumber
set nu
" set nohlsearch
set nowrap

set incsearch
set scrolloff=8
set colorcolumn=90
set signcolumn=yes

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c


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


let NERDTreeWinSize = 20


"set clipboard=unnamedplus

" Copy paste yanked instead of deleted 
nmap ,p "0p
nmap ,P "0P



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


" ----------------------------------------------
"  Telescope
" ----------------------------------------------
"
let mapleader = " "
nmap <leader>l :Telescope file_browser<CR><ESC>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" nmap ,b :Telescope file_browser<CR><ESC>
" nmap ,l :Telescope find_files<CR><ESC>
" ----------------------------------------------
"  Plugins
" ----------------------------------------------

call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-fugitive'

  Plug 'rust-lang/rust.vim'
  Plug 'scrooloose/syntastic'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'hashivim/vim-terraform'
  Plug 'vim-airline/vim-airline'
  Plug 'dracula/vim', { 'name': 'dracula' }
  Plug 'gmarik/vundle'
  Plug 'dag/vim-fish'
  Plug 'neovim/nvim-lspconfig'
  Plug 'neovim/nvim-lsp'
  Plug 'preservim/tagbar'

  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'mhinz/vim-startify'

  Plug 'tpope/vim-commentary'
  Plug 'xiyaowong/nvim-transparent'
  Plug 'ellisonleao/glow.nvim'
call plug#end()



colorscheme dracula

set completeopt=menu,menuone,noselect

let g:transparent_enabled = v:true
