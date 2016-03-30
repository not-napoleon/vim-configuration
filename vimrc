" Notes and Information {{{1
" Missing documentation, installation notes, and other stuff I need to find
" but don't have a good place for belongs here.
"
" text-object-left-and-right {{{2
" There's no help file, so here's a dump of the readme:
" This is a mirror of http://www.vim.org/scripts/script.php?script_id=3511
"
" This simple script create text object for left and right of a statement. e.g
"
" stri|ng = "Hello World"
"
"
" | is where your cursor is, in command mode
" type ciL (change inner and L for the right hand sided)
"
" the line will become
"
" string = |
"
" similarily
"
" ciH, diH, yiH etc will change, delete, yank the left hand side of the
" statement
"
" this also works for ==, => as well
"
" Note if the line end with ',' or ';' it will be the boundary of the right
" hand side If there is a space before the separator (=, ==, =>) or after,
" they are so the the boundary

"
" Plugins {{{1
call plug#begin('~/.vim/plugged')

" Movements, gestures and commands {{{2
Plug 'AndrewRadev/sideways.vim'                 " Move items around in lists
Plug 'gregsexton/MatchTag'                      " Tag pairing? I guess?
Plug 'michaeljsmith/vim-indent-object'          " Indent level text objects
Plug 'tmhedberg/matchit'
Plug 'vim-scripts/text-object-left-and-right'   " Text objects for LHS/RHS of expressions
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-speeddating'                    " Increment/decrement dates
Plug 'tpope/vim-surround'                       " Handle paired markers
Plug 'tpope/vim-unimpaired'                     " Paired short-cuts with braces
Plug 'tomtom/tcomment_vim'                      " Block commenting

" Filetype Support {{{2
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'klen/python-mode', {'for': 'python'}
Plug 'lepture/vim-jinja', {'for': 'jinja'}
Plug 'rhysd/vim-clang-format', {'for': ['c', 'cpp']}
Plug 'vim-scripts/applescript.vim', {'for': 'applescript'}
Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}

" Interface Mods {{{2
Plug 'altercation/vim-colors-solarized'         " Solarized color scheme
Plug 'bling/vim-airline'                        " Improved status line
Plug 'majutsushi/tagbar'                        " Navigate by tagfile
Plug 'ntpeters/vim-better-whitespace'           " Trailing Whitespace highlite & trim
Plug 'whatyouhide/vim-lengthmatters'            " Highlite overly long lines
Plug 'haya14busa/incsearch.vim'                 " Better incremental search
Plug 'godlygeek/tabular'                        " Align text as needed
Plug 'scrooloose/syntastic'                     " Flag syntax errors

" External Systems {{{2
Plug 'jistr/vim-nerdtree-tabs'
Plug 'kien/ctrlp.vim'                           " Fuzzy match file opener
Plug 'mattn/gist-vim' | Plug 'mattn/webapi-vim' " Post gists direct from vim! amazing!
Plug 'mhinz/vim-startify'                       " Fancy start screen
Plug 'scrooloose/nerdtree'                      " Filesystem broswer
Plug 'tpope/vim-fugitive'                       " Git integration
Plug 'vim-scripts/a.vim'                        " Quickly switch between .c and .h files
Plug 'vim-scripts/vimwiki'                      " For note taking?

" Completion {{{2
Plug 'SirVer/ultisnips'                         " Snippets and such
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'not-napoleon/vim-byline'                  " Sign your work

" Meta {{{2
Plug 'embear/vim-localvimrc'                    " Support for project specific vim settings
Plug 'tpope/vim-repeat'                         " Enable dot repeat for plugins
Plug 'tpope/vim-dispatch'

" Other {{{2
Plug 'vimoutliner/vimoutliner'                  " For note taking
Plug 'vim-scripts/TaskList.vim'                 " Work with todo tags
Plug 'airblade/vim-rooter'                      " Automatically change to root directory

" In Development {{{2
Plug '~/code/vim-playlist'

call plug#end()

" Config Settings {{{1
set nocompatible " Who uses actual vi?

" Start with all folds open and default to a sane fold method.  Filetypes
" should override the fold method.
set foldmethod=indent
set foldlevel=99

set showcmd " Show what's been typed so far in command pending mode

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set number " Line Numbers!

set ffs="unix" " Show those ^M's when editing a windows file

" Live dangerously
set nobackup
set nowritebackup

" Put swap files all in one place, so I don't need to git-ignore them globally
" or in every project.
" The // causes vim to use the full path name for the swap file, to avoid
" name collisions.
set directory=$HOME/.vim/tmp//

" See also the incsearch plugin settings
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

" Space bar toggles folds.  This is life changing.
nnoremap <Space> za
vnoremap <Space> za
" Make zO recursively open whatever top level fold we're in, no matter where
" the cursor happens to be.
nnoremap zO zCzO

" Use jk to exit insert mode
inoremap jk <esc>
inoremap kj <esc>

set background=dark
colorscheme solarized

" PLUGIN CONFIGURATION {{{1

" Airline config {{{2
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

" let g:airline_section_a                      " (mode, paste, iminsert)
" let g:airline_section_b                      " (hunks, branch)
" let g:airline_section_c'                     " (bufferline or filename)
" let g:airline_section_gutter                 " (readonly, csv)
let g:airline_section_x = ''                   " (tagbar, filetype, virtualenv)
"let g:airline_section_y                       " (fileencoding, fileformat)
let g:airline_section_z = 'c:%c %p%%'          " (percentage, line number, column number)
" let g:airline_section_warning                " (syntastic, whitespace)

" Byline {{{2
let g:bylineName='Tozzi'
iab MT <C-R>=BylineInsert()<cr>

" Clang Fomatter {{{2
" Enable clang format with gq command
let g:clang_format#auto_formatexpr = 1

" Read project style files
let g:clang_format#detect_style_file = 1

" Fugitive {{{2
" Not fugitive specific, but this is the only place I care about diffopt,
" really
set diffopt=filler,vertical,context:10

" Gist {{{2
" Mac clipboard.  TODO: Detect OS and set based on that
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_show_privates=1
let g:gist_post_private = 1 " Default to private gists, because I'm paranoid

" Incsearch {{{2
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Clear highlighting after finishing search
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)


" JavaComplete2
augroup JavaComplete2
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
augroup END
let g:JavaComplete_ClosingBrace = 0
" valid choices are 'jarName' and 'packageName'
let g:JavaComplete_ImportSortType = 'packageName'
let g:JavaComplete_ImportOrder = ['com.', 'joptsimple.', 'kafka', 'org.',
            \ 'java.', 'javax.']

" localvimrc {{{2
let g:localvimrc_name = ['.vimrc', '.lvimrc']
let g:localvimrc_event = ['VimEnter']
" Don't load in sandbox mode - risky, so we'll ask before loading
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 1
let g:localvimrc_persistent = 1

let g:localvimrc_blacklist = $HOME . '/.vim/vimrc'

" Nerd Tree {{{2
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeRespectWildIgnore=1        " Use wildignore for nerdtree
let g:NERDTreeShowHidden=1               " Show hidden files

set wildignore+=*.pyc,*/*.egg-info/*     " Python incidentals
set wildignore+=.git,.hg                 " Source control
set wildignore+=*.sw?                    " Swap files
set wildignore+=*.jpg,*.jpeg,*.gif,*.png " Images
set wildignore+=*.o                      " Object files
set wildignore+=*.class                  " Java class files


" Playlist {{{2
" Prototype configuration for my playlist plugin
map <F8> <Plug>(playlist-skip)
map <F7> <Plug>(playlist-pause)
map <leader>plq <Plug>(playlist-quit)
augroup filetype_playlist
    autocmd FileType playlist map <buffer> <F5> <Plug>(playlist-load-current)
augroup END

" Python Mode {{{2
" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pylint_show_rate = 0
let g:pymode_indent = 0
let g:pymode_folding = 1
let g:pymode_motion = 1
let g:pymode_indent = 1

" I like the syntastic plugin's presentation of errors better
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0

" I'm using YCM for completion
let g:pymode_rope_completion = 0

" let g:pymode_lint_onfly = 1
" let g:pymode_lint_cwindow = 0

" Startify {{{2
let g:startify_change_to_dir=0  " Don't change to the directory of the file being opened
let g:startify_change_to_vcs_root=1  " Always start from the root of the repository (if applicable)
let g:ctrlp_reuse_window='startify'  " Let ctrlp reuse the startify window
let g:startify_list_order=[
            \ ['    Recent Sessions'], 'sessions',
            \ ['    Most recently used in dir'], 'dir',
            \ ['    Bookmarks'], 'bookmarks'
            \ ]
let g:startify_bookmarks=['~/.vimrc']
let g:startify_session_persistence = 1

" Trigger NERDtree to reuse the startify window (works for Ctrl-P too)
autocmd User Startified setlocal buftype=

" Syntastic config {{{2
" Syntastic checker plugins

let g:syntastic_aggregate_errors = 1

" Note to self: make sure pylint is running in the venv, not the system pylint
" Also, there's a pylint plugin to play nicely with django, put this in a
" local vimrc to use it:
" let g:syntastic_python_pylint_args = '--load-plugins pylint_django'
let g:syntastic_python_checkers=['flake8', 'pylint']
let g:syntastic_java_checkers=['javac']

" Always populate error list
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" Sideways macro & text object {{{2
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

" Ultisnips config {{{2
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:ultisnips_python_style="sphinx"


" Vim Pad config {{{2
let g:pad#dir = "~/notes/"
let g:pad#default_format = "votl"  " Default to vim outliner...
let g:pad#search_backend = "ag"    " Use the silver searcher
" Title first line setting creates duplicate entries in the pad ls view...
" let g:pad#title_first_line = 1     " Use the first line of the file as a tilte
let g:pad#window_height = 20
let g:pad#open_in_split = 0

" Better Whitespace {{{2
" Automatically strip trailing whitespace on save for all filetypes.
augroup plugin_better_whitespace
    autocmd BufWritePre * StripWhitespace
augroup END

" let g:better_whitespace_filetypes_blacklist+=[]
" default blacklist: ['diff', 'gitcommit', 'unite', 'qf', 'help']

" YCM config {{{2
let g:ycm_seed_identifiers_with_syntax = 1 " Seed completion with keywords
let g:ycm_autoclose_preview_window_after_insertion = 1
" accpet ycm config files in my code directory
let g:ycm_extra_conf_globlist = ['~/code/*','!~/*']


" UTILITY FUNCTIONS {{{1
" TODO: this should be in vimwiki or markdown filetype plugin or something
" Custom folding expresion for anything using the = Header = format
" e.g. vimwiki.  See
" http://vimcasts.org/episodes/writing-a-custom-fold-expression/ and
" https://gist.github.com/anonymous/4149842
function! EqualHeaderFolding()
    let thisline = getline(v:lnum)
    " There must be a better way to do this...
    if match(thisline, "^======") >= 0
        return ">6"
    elseif match(thisline, "^=====") >= 0
        return ">5"
    elseif match(thisline, "^====") >= 0
        return ">4"
    elseif match(thisline, "^===") >= 0
        return ">3"
    elseif match(thisline, "^==") >= 0
        return ">2"
    elseif match(thisline, "^=") >= 0
        return ">1"
    else
        return "="
    endif
endfunction

" FILETYPE SPECIFIC STUFF {{{1

" Perl {{{2
augroup filetype_perl
    autocmd!
    autocmd FileType perl set smartindent
augroup END
let perl_extended_vars=1 " Highlite advanced perl vars inside strings (hash refs)

" Python {{{2
let python_highlight_all=1
let g:pyflakes_use_quickfix = 0

" Ruby {{{2
" For some reason, vim is unusably slow on ruby files
augroup filetype_ruby
    autocmd!
    autocmd FileType ruby setlocal regexpengine=1 nocursorline nocursorcolumn
augroup END

" Java {{{2
augroup filetype_java
    autocmd!
    autocmd FileType java setlocal foldmethod=syntax
    autocmd FileType java setlocal textwidth=120
augroup END

" C# and Mono {{{2
augroup filetype_cs
    autocmd!
    autocmd FileType cs setlocal noexpandtab
augroup END

" Restructured  text {{{2
augroup filetype_rst
    autocmd!
    autocmd FileType rst setlocal textwidth=78 spell spelllang=en_us
augroup END

" Markdown {{{2
augroup filetype_markdown
    autocmd!
    autocmd FileType markdown setlocal textwidth=78 spell spelllang=en_us
augroup END

" Tex/LaTeX files {{{2
augroup filetype_latex
    autocmd!
    autocmd FileType tex setlocal spell spelllang=en_us
augroup END

" Vimwiki {{{2
augroup filetype_vimwiki
    autocmd!
    autocmd FileType vimwiki setlocal spell spelllang=en_us foldmethod=expr foldexpr=EqualHeaderFolding()
augroup END

" Git commits {{{2
augroup filetype_gitcommit
    autocmd!
    autocmd FileType gitcommit setlocal spell spelllang=en_us
augroup END

" Applescript {{{2
augroup filetype_applescript
    autocmd!
    au BufRead,BufNewFile *.applescript set filetype=applescript
augroup END

" Vimscript {{{2
augroup filetype_vimscript
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Avro Schema Files {{{2
" Avro uses json, so just force these to json filetype
augroup filetype_avro
    autocmd!
    autocmd BufNewFile,BufRead *.avsc set filetype=json
augroup END
