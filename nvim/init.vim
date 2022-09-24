set guicursor=
set nohlsearch
set hidden
  set incsearch
  set signcolumn=yes
  set colorcolumn=80
  set cmdheight=2
  set updatetime=50


  set number relativenumber
  "syntax enable / on was fking the lsp error updating ASDFG
  set scrolloff=11 "keeps space when scrolling
  set backspace=indent,eol,start

  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set expandtab
  set autoindent
  set fileformat=unix
  set smartindent
  set list

  highlight BiscuitColor ctermfg=cyan


call plug#begin(stdpath('data') . '/plugged')

"5.0
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-path'

  "telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

  "Themes
  Plug 'gruvbox-community/gruvbox'
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

  Plug 'preservim/nerdtree'

  Plug 'airblade/vim-rooter'
  "git
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'mhinz/vim-signify'
  Plug 'junegunn/gv.vim'
  " web dev
  Plug 'ap/vim-css-color'

  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'code-biscuits/nvim-biscuits'


  " comments
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'

call plug#end()


source $HOME/.config/nvim/plug-config/signify.vim
" theme settings
luafile $HOME/.config/nvim/after/plugin/lualine.rc.lua

source $HOME/.config/nvim/plug-config/colors.vim
source $HOME/.config/nvim/after/plugin/cmpcomplete.rc.vim
source $HOME/.config/nvim/after/plugin/lspconfig.rc.vim
source $HOME/.config/nvim/after/plugin/lspsaga.rc.vim
source $HOME/.config/nvim/after/plugin/telescope.rc.vim
source $HOME/.config/nvim/after/plugin/treesitter.rc.vim
source $HOME/.config/nvim/after/plugin/web-devicons.rc.vim
luafile $HOME/.config/nvim/after/plugin/autopairs.rc.lua
luafile $HOME/.config/nvim/after/plugin/biscuits.rc.lua


" native lspconfig moved to after/plugin file

colorscheme tokyonight
set termguicolors


"leader key
let mapleader= "\<Space>"

" copy paste copy w y AND paste w p
set clipboard+=unnamedplus

"Splits ----------------------------------

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusting split sizes easier
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K

" Open terminal inside Vim
map <leader>tt :vnew term://bash<CR>

"tab by number and next & prev
map <leader>0 :bn<cr>
map <leader>9 :bp<cr>

"-----------------------------------------------"

" shortcut for executing python in vim
autocmd Filetype python nnoremap <buffer> <F5> :w<CR>:vert ter python3 "%"<CR>


"NERDTREE
nnoremap <leader>n :NERDTreeToggle<Cr>
noremap <leader>w :w<cr>


"hoping this helps w autocomplete html in js??? cntrl x cntrl o
set omnifunc=htmlcomplete#CompleteTags


" Toggle transparency
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi SignColumn guibg=NONE ctermbg=NONE
highlight Normal ctermbg=NONE guibg=NONE
let g:is_transparent = 1
function! Toggle_transparent()
    if g:is_transparent == 0
        highlight Normal ctermbg=NONE guibg=NONE
        highlight SignColumn ctermbg=NONE guibg=NONE
        let g:is_transparent = 1
    else
        set background=dark
        let g:is_transparent = 0
    endif
endfunction

nnoremap <silent> <C-l> :call Toggle_transparent()<CR>
