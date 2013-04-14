"vimrc configuration file 

"Turn off compatibility with UNIX standard vi
set nocompatible

"Turn on syntax highlighting
syntax on

"Use pathogen for plugin management
execute pathogen#infect()
execute pathogen#helptags()

"Filetype detection
filetype on
			
"Allow for automatic handling of indention as well as use 'smart' indention
set autoindent

"Set the width of indention and the width of a tab to 4 spaces
set shiftwidth=4                                                         
set tabstop=4

"Don't show the matching (){}[] for files
set noshowmatch

"Always show the current position in the file at the bottom line.
set ruler

"Stop text wrapping
set nowrap

"Allow :/ search to search while typing
set incsearch

"Speed up Scrolling
set ttyfast

"Allow cursor to be moved to any position within the file
"set virtualedit=all

"Turn on programming language specific indention
filetype plugin indent on

"Enable spell checking
set spelllang=en_us
set nospell
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

"Add line numbers
set nu

"Auto Completion of Programming  Files
autocmd Filetype c set omnifunc=ccomplete#Complete
autocmd Filetype python set omnifunc=pythoncomplete#Complete
set completeopt=longest,menuone

"Auto Completion of C++ Files
filetype plugin on
set tags+=~/.vim/tags/cpp

"Make vim pretty
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

"NERDTree plugin options
let g:NERDTreeDirArrows=0

"LaTeX plugins
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat='pdf'