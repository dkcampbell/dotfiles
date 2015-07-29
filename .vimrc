"vimrc configuration file

"Turn off compatibility with UNIX standard vi
set nocompatible

"Add line numbers
set number

"Turn on syntax highlighting
syntax on

"I give in. Spaces have won.
set expandtab

"Disable swap files
set nobackup
set noswapfile

"Set the width of indention and the width of a tab to 4 spaces
set shiftwidth=4
set tabstop=4

"Allow for automatic handling of indention as well as use 'smart' indention
set autoindent

"Display trailing whitespace
set list

"Make indentions always be multiple of shiftwidth (only for "<" and ">"
"commands
set shiftround

"Don't show the matching (){}[] for files
set noshowmatch

"Always show the current position in the file at the bottom line.
set ruler

"Stop text wrapping
set nowrap

"Show indicator for 80th column
set colorcolumn=80

"Allow :/ search to search while typing
set incsearch

"Ignore case if searching all lowercase only
set ignorecase
set smartcase

"Speed up Scrolling
set ttyfast

"Hide buffers instead of closing
set hidden

"Highlight line cursor is on
set cursorline

"Keybindings for window navigation
nn <C-h> <C-w>h
nn <C-j> <C-w>j
nn <C-k> <C-w>k
nn <C-l> <C-w>l

"Default spell checking options
set nospell
set spelllang=en_us
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

"Use Vundle for plugin management
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'SirVer/ultisnips'
if !has("win32")
    Plugin 'Valloric/YouCompleteMe'
endif
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'gmarik/Vundle.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-sensible.git'
Plugin 'vim-latex/vim-latex.git'
call vundle#end()

"Instructions for getting Vundle running on a new computer:
"git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"Start vim and run :PluginInstall

"Filetype detection
filetype plugin indent on

"Special settings for different filetypes
au Filetype c,h set filetype=c.doxygen
au Filetype cpp,hpp set filetype=cpp.doxygen
au Filetype cpp set sw=2 ts=2
au Filetype html set sw=2 ts=2
au BufNewFile,BufReadPost *.md set filetype=markdown set spell

"Make vim pretty
let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme solarized

"Make gVim tolerable on Windows
if has('gui_win32')
   set guifont=Consolas:h11
endif

"NERDTree plugin options
let g:NERDTreeDirArrows=0

"CtrlP plugin options
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"Gundo Configuration
map <Leader>u :GundoShow<CR>

"LaTeX plugins
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat='pdf'
