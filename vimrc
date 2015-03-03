call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/sideways.vim'                         " move items areound in lists
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'altercation/vim-colors-solarized'                 " solarized color scheme
Plug 'bling/vim-airline'                                " Improved status line
Plug 'elzr/vim-json'                                    " Json highliting and other fun
Plug 'godlygeek/tabular'                                " align text as needed
Plug 'gregsexton/MatchTag'                              " tag pairing? I guess?
Plug 'haya14busa/incsearch.vim'                         " Better incremental search
Plug 'lepture/vim-jinja'                                " Jinja highlighting
Plug 'mattn/gist-vim'                                   " post gists direct from vim! amazing!
Plug 'mattn/webapi-vim'                                 " Required by gist-vim
Plug 'scrooloose/syntastic'                             " Flag syntax errors
Plug 'tomtom/tcomment_vim'                              " block commenting
Plug 'tpope/vim-fugitive'                               " Git integration
Plug 'tpope/vim-surround'                               " Handle paired markers
Plug 'tpope/vim-unimpaired'                             " paired short-cuts with braces
Plug 'vim-scripts/TaskList.vim'                         " Work with todo tags

call plug#end()

set nocompatible " Who uses actual vi?

set foldmethod=indent
set foldlevel=99

set showcmd " Show what's been typed so far in command pending mode

" Apparently I think I still work for Trey
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Cursor Cross-hairs!
set cursorline
set cursorcolumn

set number " Line Numbers!

set ffs="unix" " Show those ^M's when editing a windows file

" Live dangerously
set nobackup
set nowritebackup

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase
" show the `best match so far' as search strings are typed:
set incsearch

set backspace=indent,eol,start " Make backspace not suck

set ttyfast " Send more characters for redraws

set mouse=a " Enable mouse use in all modes

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2


filetype plugin indent on
 
syntax enable

set background=dark
colorscheme solarized

" *********
" PLUGIN CONFIGURATION
" *********

" *********
" Airline config
" *********
" Status line settings

let g:airline_powerline_fonts = 1

set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=%=                           " right align
set statusline+=%r                           " are you read only?
set statusline+=[                            "
set statusline+=\ Line:                      "
set statusline+=%3l/                         " Line number with padding
set statusline+=%L                           " Total lines in the file
set statusline+=:%2c                         " column number
set statusline+=]

let g:airline_theme = 'dark'

set laststatus=2 " Always show status line

set noshowmode " Rely on airline's modified status marker

" *********
" Syntastic config
" *********

" Syntastic checker plugins
let g:airline#extensions#syntastic#enabled = 0

" (These get run in order, later ones only running if the eariler ones didn't
" produce errors.  So, given that, I put the less restrictive flake8 first
let g:syntastic_python_checkers=['flake8', 'pylint']

" *********
" Sideways macro & text object
" *********
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

" *********
" UTILITY FUNCTIONS
" *********

" Timestamp Sig
if !exists("*TimeStamp")
	fun TimeStamp()
		return "--MT (" . strftime("%d %b %Y %X") . ")"
	endfun
endif
iab MT <C-R>=TimeStamp()<cr>


" *********
" FILETYPE SPECIFIC STUFf
" *********

" Perl
autocmd FileType perl set smartindent
let perl_extended_vars=1 " Highlite advanced perl vars inside strings (hash refs)

" Python
" autocmd FileType python compiler pylint
let g:pylint_show_rate = 0
let g:pymode_indent = 0

" Trey's python stuff
" set adkeeper python style 
" note: recommendation is to do this in a ~/.vim/after/ftplugin file
autocmd FileType python setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
let python_highlight_all=1
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" " Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" uglify chars past the 80 col limit
au BufWinEnter *.py,*.pyw let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
let g:pyflakes_use_quickfix = 0
" map <leader>j :RopeGotoDefinition<CR>
" map <leader>r :RopeRename<CR>
" I like the pyflakes plugin's presentation of errors better
let g:pymode_lint = 0
" let g:pymode_lint_onfly = 1
" let g:pymode_lint_cwindow = 0

" C# and Mono
autocmd FileType cs setlocal noexpandtab

" Jinja & Less
au BufRead,BufNewFile *.j2 set filetype=jinja
au BufRead,BufNewFile *.less set filetype=less

" Restructured  text
autocmd FileType rst setlocal textwidth=78 spell spelllang=en_us
