" Encodings!
set fileencodings=utf-8
set encoding=utf-8
scriptencoding utf-8

" vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-expand-region'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'moll/vim-bbye'
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Languages
Plug 'vim-ruby/vim-ruby'
Plug 'sunaku/vim-ruby-minitest'
Plug 'tpope/vim-bundler', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'lilydjwg/colorizer', { 'for': ['css', 'sass', 'scss', 'less', 'html', 'xhtml', 'javascript', 'javascript.jsx'] }
Plug 'tpope/vim-markdown'
Plug 'honza/dockerfile.vim'

" Complete engines
Plug 'Shougo/deoplete.nvim'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

call plug#end()

let mapleader = ","

syntax on
set termguicolors
set showcmd
set showmatch
set noshowmode
set ruler
set cursorline
set number
set formatoptions+=o
set expandtab
set shiftwidth=2
set tabstop=2
set laststatus=2
set wildmenu
set lazyredraw

set noerrorbells
set modeline
set esckeys
set linespace=0
set nojoinspaces
set nostartofline

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault
set magic
nnoremap <leader><space> :nohlsearch<CR>

" Grep search
nnoremap <leader>a :Ag

" Colorscheme specific settings
let g:gruvbox_italic=1
set background=dark
let g:gruvbox_contrast_dark = "hard"

" Color
" colorscheme monokai
colorscheme gruvbox

" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['mri','rubocop']

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 2
let g:airline_detect_spell=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline_detect_modified=1
let g:airline_theme= 'luna'

" Deoplete
let g:deoplete#enable_at_startup = 1

" Nerdtree
map <C-n> :NERDTreeToggle<CR>

" Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
nnoremap <space> za

" Spellchecking
noremap <Leader>ss :setlocal spell! <Bar> echo &spell?'Spellchecking is on':'Spellchecking is off'<CR>

" Selections
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Buffers
:nnoremap <Leader>q :Bdelete<CR>

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list

" Hightlights whitespaces and tabs
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

" Strip trailing whitespaces
autocmd BufWritePre * :call StripTrailingWhitespace()
function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    if &filetype == 'mail'
" Preserve space after e-mail signature separator
      %s/\(^--\)\@<!\s\+$//e
    else
      %s/\s\+$//e
    endif
    normal 'yz<Enter>
    normal `z
  endif
endfunction
