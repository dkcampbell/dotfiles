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
set smartindent

"Display trailing whitespace
set list

"Make indentions always be multiple of shiftwidth (only for "<" and ">"
"commands)
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

"Defaul spell checkmng options
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

"Enable mouse support
set mouse=a

"Use Vundle for plugin management
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
if has('python')
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    if !has("win32")
        Plugin 'dkcampbell/vap'
        Plugin 'Valloric/YouCompleteMe'
    endif
endif
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'plasticboy/vim-markdown'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-latex/vim-latex'
Plugin 'vimwiki/vimwiki'
call vundle#end()

"Instructions for getting Vundle running on a new computer:
"git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"Start vim and run :PluginInstall

"Filetype detection
filetype plugin indent on

"Special settings for different filetypes
au Filetype c,h set spell
au Filetype c,h set cindent
au Filetype cpp,hpp set spell
au Filetype cpp,hpp set cindent
au Filetype html set sw=2 ts=2
au Filetype css set sw=2 ts=2
au Filetype tex set spell
au BufNewFile,BufReadPost *.twig set filetype=jinja

"Shortcut to trim whitespace
map <Leader>tr :%s/\s\+$//<CR>

"Useful maps for putting semicolons at the end of a line
nmap ;; A;<Esc>
imap ;; <Esc>A;

"Make vim pretty
try
    set background=dark
    colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
    "Couldn't find solarized. You probably need to get Vundle running
endtry

"Make gVim tolerable on Windows
if has('gui_win32')
   set guifont=Consolas:h11
endif

"Gundo Configuration
map <Leader>u :GundoToggle<CR>

"Vim-LaTeX Configuration
set grepprg=grep\ -nH\ $*
let g:tex_flavor="latex"
let g:Tex_DefaultTargetFormat='pdf'

"Ultisnips Configuration
"Taken from https://github.com/Valloric/YouCompleteMe/issues/420
let g:UltiSnipsExpandTrigger = "<nop>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

"YouCompleteMe Configuration
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt=0
set completeopt-=preview

"Git-Gutter configuration
let g:gitgutter_sign_column_always=1

"Markdown configuration -- both general and for vim-markdown plugin
au Filetype markdown set spell
au Filetype markdown set conceallevel=2
au Filetype markdown set textwidth=78
au Filetype BufNewFile,BufReadPost *.md set filetype=markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1

"Vim-airline configuration
"For the fancy fonts to work properly clone this repository:
"https://github.com/powerline/fonts.git and run the install.sh script
let g:airline_powerline_fonts=1

"Vimwiki configuration
let wiki_1 = {}
let wiki_1.path = '~/Dropbox/vimwiki/wiki/'
let wiki_1.path_html = '~/Dropbox/vimwiki/html'
let g:vimwiki_list = [wiki_1]
