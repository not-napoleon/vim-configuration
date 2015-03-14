call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/sideways.vim'              " Move items around in lists
Plug 'SirVer/ultisnips'                      " Snippets and such
Plug 'Valloric/YouCompleteMe',
    \{ 'do': './install.sh --clang-completer' }
Plug 'altercation/vim-colors-solarized'      " Solarized color scheme
Plug 'bling/vim-airline'                     " Improved status line
Plug 'elzr/vim-json'                         " Json highliting and other fun
Plug 'godlygeek/tabular'                     " Align text as needed
Plug 'gregsexton/MatchTag'                   " Tag pairing? I guess?
Plug 'haya14busa/incsearch.vim'              " Better incremental search
Plug 'kien/ctrlp.vim'                        " Fuzzy match file opener
Plug 'klen/python-mode'                      " All manner of python stuff
Plug 'lepture/vim-jinja'                     " Jinja highlighting
Plug 'mattn/gist-vim'                        " Post gists direct from vim! amazing!
Plug 'mattn/webapi-vim'                      " Required by gist-vim
Plug 'ntpeters/vim-better-whitespace'        " Trailing Whitespace highlite & trim
Plug 'scrooloose/syntastic'                  " Flag syntax errors
Plug 'scrooloose/nerdtree'                   " Filesystem broswer
Plug 'tomtom/tcomment_vim'                   " Block commenting
Plug 'tpope/vim-fugitive'                    " Git integration
Plug 'tpope/vim-repeat'                      " Enable dot repeat for plugins
Plug 'tpope/vim-speeddating'                 " Increment/decrement dates
Plug 'tpope/vim-surround'                    " Handle paired markers
Plug 'tpope/vim-unimpaired'                  " Paired short-cuts with braces
Plug 'vim-scripts/text-object-left-and-right' " Text objects for LHS/RHS of expressions
Plug 'vim-scripts/TaskList.vim'              " Work with todo tags

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
set laststatus=2 " Always show status line
set noshowmode " Rely on airline's modified status marker
let g:airline_theme = 'dark'
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#virtualenv#enabled = 0

" Shorten mode names
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

if !exists("*WeirdEncoding")
    function! WeirdEncoding()
        " Show file type and encoding, but only if they're not default
        return printf('%s%s',
              \ (&fenc ==? 'utf-8') ? '' : &fenc,
              \ (&ff ==? 'unix') ? '' : '['.&ff.']')
    endfunction
endif

" let g:airline_section_a                      " (mode, paste, iminsert)
" let g:airline_section_b                      " (hunks, branch)
" let g:airline_section_c'                     " (bufferline or filename)
" let g:airline_section_gutter                 " (readonly, csv)
let g:airline_section_x = ''                   " (tagbar, filetype, virtualenv)
let g:airline_section_y = '%{WeirdEncoding()}' " (fileencoding, fileformat)
let g:airline_section_z = 'c:%c %p%%'          " (percentage, line number, column number)
" let g:airline_section_warning                " (syntastic, whitespace)


" *********
" Nerd Tree
" *********
map <C-n> :NERDTreeToggle<CR>


" *********
" Python Mode
" *********

" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pylint_show_rate = 0
let g:pymode_indent = 0
let g:pymode_folding = 1
let g:pymode_motion = 1

" I like the syntastic plugin's presentation of errors better
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0

" I'm using YCM for completion
let g:pymode_rope_completion = 0

" let g:pymode_lint_onfly = 1
" let g:pymode_lint_cwindow = 0

" *********
" Syntastic config
" *********

" Syntastic checker plugins

let g:syntastic_aggregate_errors = 1

let g:syntastic_python_checkers=['flake8', 'pylint']
" Always populate error list
let g:syntastic_always_populate_loc_list = 1


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
" FILETYPE SPECIFIC STUFF
" *********

" Perl
autocmd FileType perl set smartindent
let perl_extended_vars=1 " Highlite advanced perl vars inside strings (hash refs)

" Python
" autocmd FileType python compiler pylint

" Trey's python stuff
" set adkeeper python style
" note: recommendation is to do this in a ~/.vim/after/ftplugin file
autocmd FileType python setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
let python_highlight_all=1
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" uglify chars past the 80 col limit
au BufWinEnter *.py,*.pyw let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
let g:pyflakes_use_quickfix = 0
" map <leader>j :RopeGotoDefinition<CR>
" map <leader>r :RopeRename<CR>

" C# and Mono
autocmd FileType cs setlocal noexpandtab

" Jinja & Less
au BufRead,BufNewFile *.j2 set filetype=jinja
au BufRead,BufNewFile *.less set filetype=less

" Restructured  text
autocmd FileType rst setlocal textwidth=78 spell spelllang=en_us
