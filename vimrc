runtime bundle/vim-pathogen/autoload/pathogen.vim
" call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()
set foldmethod=indent
set foldlevel=99
set nocompatible
set showmode
set showcmd
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set ruler
set cursorline
set cursorcolumn
set number
set ffs="unix"
set nobackup
set nowritebackup
" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase
" show the `best match so far' as search strings are typed:
set incsearch
set backspace=indent,eol,start

" Send more characters for redraws
set ttyfast

" Enable mouse use in all modes
set mouse=a

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
"set statusline+=%=                           " right align remainder
"set statusline+=0x%-8B                       " character value
"set statusline+=%-14(%l,%c%V%)               " line, character
"set statusline+=%<%P                         " file position
set statusline+=%=                           " right align
set statusline+=%r                           " are you read only?
"set statusline+=\ \ \ \ %y                   " what the file type
set statusline+=[                            "
set statusline+=\ Line:                      "
set statusline+=%3l/                         " Line number with padding
set statusline+=%L                           " Total lines in the file
set statusline+=:%2c                         " column number
set statusline+=]

let g:airline_theme = 'dark'

" Always show status line
set laststatus=2

" Rely on airline's modified status marker
set noshowmode

" ********
" Easytags Config
" ********

let g:easytags_async = 1
let g:easytags_auto_highlight = 0


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

" Jinja & Less
au BufRead,BufNewFile *.j2 set filetype=htmljinja
au BufRead,BufNewFile *.less set filetype=less

