" Preamble {{{
" vim: set foldlevel=0:
" .vimrc
" Author: Mark Tozzi
" Source: https://github.com/not-napoleon/vim-configuration/blob/master/vimrc
"
" In addition to the plugins listed below, parts of this file have been lifted
" from various coworkers, friends  and internet sources over the years.  A
" partial list follows:
"
" [1] https://github.com/DanielleSucher/dotfiles/blob/master/vim/vimrc
" [2] https://github.com/jonafato/dotfiles/blob/master/vimrc
" [3] https://github.com/johnbenjaminlewis/dotfiles/blob/master/.vimrc
" [4] https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
" [5] http://stackoverflow.com/a/1270689
" [6] http://vim.wikia.com/wiki/List_loaded_scripts
" [7] https://stackoverflow.com/a/9527384/529459
"
" To the best of my knowledge, all sources are used with permission.
"
" Original parts of this file are free to use under the MIT license
" (https://opensource.org/licenses/MIT)
"
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
Plug 'easymotion/vim-easymotion'                " Fast in document movement
Plug 'gregsexton/MatchTag'                      " Tag pairing? I guess?
Plug 'michaeljsmith/vim-indent-object'          " Indent level text objects
Plug 'tmhedberg/matchit'
Plug 'tomtom/tcomment_vim'                      " Block commenting
Plug 'tpope/vim-speeddating'                    " Increment/decrement dates
Plug 'tpope/vim-surround'                       " Handle paired markers
Plug 'tpope/vim-unimpaired'                     " Paired short-cuts with braces
Plug 'vim-scripts/text-object-left-and-right'   " Text objects for LHS/RHS of expressions

" Filetype Support {{{2
Plug 'cespare/vim-toml'
Plug 'dag/vim-fish', {'for': 'fish'}
Plug 'derekwyatt/vim-scala', {'for': 'scala'}
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'klen/python-mode', {'for': 'python'}
Plug 'lepture/vim-jinja', {'for': 'jinja'}
Plug 'rhysd/vim-clang-format', {'for': ['c', 'cpp']}
Plug 'rust-lang/rust.vim'
Plug 'vim-scripts/applescript.vim', {'for': 'applescript'}
Plug 'rdolgushin/groovy.vim', {'for': 'groovy'}
Plug 'vim-scripts/groovyindent-unix', {'for': 'groovy'}

" Interface Mods {{{2
Plug 'bling/vim-airline'                        " Improved status line
Plug 'embear/vim-foldsearch'
Plug 'godlygeek/tabular'                        " Align text as needed
Plug 'haya14busa/incsearch.vim'                 " Better incremental search
Plug 'lfv89/vim-interestingwords'               " Arbitrary highlights
Plug 'majutsushi/tagbar'                        " Navigate by tagfile
Plug 'mbbill/undotree'                          " Visualize vim's undo tree
Plug 'ntpeters/vim-better-whitespace'           " Trailing Whitespace highlite & trim
Plug 'scrooloose/syntastic'                     " Flag syntax errors
Plug 'whatyouhide/vim-lengthmatters'            " Highlite overly long lines
Plug 'diepm/vim-rest-console'                   " Use vim as elasticsearch client

" Colorschemes {{{2
Plug 'altercation/vim-colors-solarized'         " Solarized color scheme
Plug 'blueshirts/darcula'
Plug 'freeo/vim-kalisi'
Plug 'jscappini/material.vim'
Plug 'michalbachowski/vim-wombat256mod'
Plug 'romainl/Apprentice'
Plug 'vim-scripts/Perfect-Dark'
Plug 'vim-scripts/moria'
Plug 'xero/blaquemagick.vim'
Plug 'xero/sourcerer.vim'
Plug 'TroyFletcher/vim-colors-synthwave/'

" External Systems {{{2
Plug 'jistr/vim-nerdtree-tabs'
Plug 'kien/ctrlp.vim'                           " Fuzzy match file opener
Plug 'mattn/gist-vim' | Plug 'mattn/webapi-vim' " Post gists direct from vim! amazing!
Plug 'mhinz/vim-startify'                       " Fancy start screen
Plug 'scrooloose/nerdtree'                      " Filesystem broswer
Plug 'tpope/vim-fugitive'                       " Git integration
Plug 'tpope/vim-rhubarb'                        " Github extention for fugitive

" Wiki Tools {{{2
Plug 'mmai/wikilink'


" Completion {{{2
Plug 'SirVer/ultisnips'                         " Snippets and such
Plug 'honza/vim-snippets'                       " Actual snippets
Plug 'not-napoleon/vim-byline'                  " Sign your work
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'tpope/vim-abolish'                        " Better abbreviations

" Meta {{{2
Plug 'embear/vim-localvimrc'                    " Support for project specific vim settings
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'                         " Enable dot repeat for plugins

" Other {{{2
Plug 'airblade/vim-rooter'                      " Automatically change to root directory

" In Development {{{2

call plug#end()

" Config Settings {{{1
if !has("nvim")
    set ttyfast         " Send more characters for redraws
    set ttymouse=xterm2
" else
"     " TODO check if the virtual envs exist, and if not create them
"     let g:python_host_prog=$HOME . "/.virtualenvs/neovim/bin/python2"
"     let g:python3_host_prog=$HOME . "/.virtualenvs/neovim-python3/bin/python3"
endif

" Start with all folds open and default to a sane fold method.  Filetypes
" should override the fold method.
set foldmethod=indent
set foldlevel=99

set showcmd " Show what's been typed so far in command pending mode

" Good default tab settings. Projects can use localvimrc to override this for
" their native conventions, if they differ.
set softtabstop=4
set shiftwidth=4
set expandtab

set number " Line Numbers!

set fileformats="unix" " Show those ^M's when editing a windows file

" Live dangerously
set nobackup
set nowritebackup

" Put swap files all in one place, so I don't need to git-ignore them globally
" or in every project.
" The // causes vim to use the full path name for the swap file, to avoid
" name collisions.
"
" Auto directory creation from [4] above

set undodir=$HOME/.vim/tmp/undo//     " undo files
set backupdir=$HOME/.vim/tmp/backup// " backups
set directory=$HOME/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif


" See also the incsearch plugin settings
" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase
" show the `best match so far' as search strings are typed:
set incsearch

set backspace=indent,eol,start " Make backspace not suck

set mouse=a " Enable mouse use in all modes

filetype plugin indent on
syntax enable

" Space bar toggles folds.  This is life changing. [3]
nnoremap <Space> za
vnoremap <Space> za
" Make zO recursively open whatever top level fold we're in, no matter where
" the cursor happens to be.
nnoremap zO zCzO

" Use jk to exit insert mode
inoremap jk <esc>
inoremap kj <esc>

" equalize windows when vim is resized [4]
autocmd VimResized * exe "normal! \<c-w>="

set t_Co=256
colorscheme synthwave
set background=dark

" Format options:
" Wrap lines to textwidth in comments while typing, by default.  Non-code file
" types should override this.  Given this, code file types should set
" textwidth to the comment width and g:lengthmatters_start_at_column for
" highlighting too long lines (and plugin config should unset
" g:lengthmatters_use_textwidth)
set formatoptions=croq


" Show whitespace characters with neat unicode [4]
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set nowrap
" nolist is necessary because list breaks linebreak, because of course it
" does. See http://vimcasts.org/episodes/soft-wrapping-text/
command! -nargs=* Wrap set wrap linebreak nolist
set showbreak=…

" Upper case current word.  This is inspired by a mapping by Steve Losh,
" adapted slightly to how I like to work [4]
inoremap <c-u> <esc>gUiwea
nnoremap <c-u> gUiwe

" Plugin Configuration {{{1
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

" let g:airline_section_a                        " (mode, paste, iminsert)
" let g:airline_section_b                        " (hunks, branch)
" let g:airline_section_c'                       " (bufferline or filename)
" let g:airline_section_gutter                   " (readonly, csv)
let g:airline_section_x = 'fo:%{&formatoptions}' " (tagbar, filetype, virtualenv)
"let g:airline_section_y                         " (fileencoding, fileformat)
let g:airline_section_z = 'c:%c %p%%'            " (percentage, line number, column number)
" let g:airline_section_warning                  " (syntastic, whitespace)


" Byline {{{2
let g:bylineName='Tozzi'
iab MT <C-R>=BylineInsert()<cr>

" Clang Fomatter {{{2
" Enable clang format with gq command
let g:clang_format#auto_formatexpr = 1

" Read project style files
let g:clang_format#detect_style_file = 1

" CtrlP {{{2
let g:ctrlp_reuse_window='startify'  " Let ctrlp reuse the startify window

" Coc {{{2

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"Easy Motion {{{2

" Replace f, F, t, T with their easy motion variants for normal and visual
nmap f <Plug>(easymotion-fl)
xmap f <Plug>(easymotion-fl)

nmap F <Plug>(easymotion-Fl)
xmap F <Plug>(easymotion-Fl)

nmap t <Plug>(easymotion-tl)
xmap t <Plug>(easymotion-tl)

nmap T <Plug>(easymotion-Tl)
xmap T <Plug>(easymotion-Tl)

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
nmap /  <Plug>(incsearch-forward)
xmap /  <Plug>(incsearch-forward)

nmap ?  <Plug>(incsearch-backward)
xmap ?  <Plug>(incsearch-backward)

nmap g/ <Plug>(incsearch-stay)
xmap g/ <Plug>(incsearch-stay)


" Clear highlighting after finishing search
set hlsearch
let g:incsearch#auto_nohlsearch = 1
nmap n  <Plug>(incsearch-nohl-n)
xmap n  <Plug>(incsearch-nohl-n)

nmap N  <Plug>(incsearch-nohl-N)
xmap N  <Plug>(incsearch-nohl-N)

nmap *  <Plug>(incsearch-nohl-*)
xmap *  <Plug>(incsearch-nohl-*)

nmap #  <Plug>(incsearch-nohl-#)
xmap #  <Plug>(incsearch-nohl-#)

nmap g* <Plug>(incsearch-nohl-g*)
xmap g* <Plug>(incsearch-nohl-g*)

nmap g# <Plug>(incsearch-nohl-g#)
xmap g# <Plug>(incsearch-nohl-g#)

" lengthmatters {{{2
let g:lengthmatters_use_textwidth=0
let g:lengthmatters_start_at_column=140  " good default

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
let g:startify_list_order=[
            \ ['    Recent Sessions'], 'sessions',
            \ ['    Most recently used in dir'], 'dir',
            \ ['    Bookmarks'], 'bookmarks'
            \ ]
let g:startify_bookmarks=['~/.vim/vimrc']
let g:startify_session_persistence = 1
let g:startify_session_dir = '~/.vim/tmp/session'

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
let g:syntastic_json_checkers=['jsonlint']
"
" Disable syntastic java checking in favor of YCM
let g:syntastic_java_checkers = []

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


" Better Whitespace {{{2
" Automatically strip trailing whitespace on save for all filetypes.
" DISABLED FOR NOW TO NOT CLUTTER PRs
" augroup plugin_better_whitespace
"     autocmd BufWritePre * StripWhitespace
" augroup END

" let g:better_whitespace_filetypes_blacklist+=[]
" default blacklist: ['diff', 'gitcommit', 'unite', 'qf', 'help']

" Utility Functions {{{1

" reselect text just pasted with gp [1]
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'


" highlight duplicate lines from [5].  Useful for spotting refactoring
" candidates.
function! HighlightRepeats() range
  let lineCounts = {}
  let lineNum = a:firstline
  while lineNum <= a:lastline
    let lineText = getline(lineNum)
    if lineText != ""
      let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
    endif
    let lineNum = lineNum + 1
  endwhile
  exe 'syn clear Repeat'
  for lineText in keys(lineCounts)
    if lineCounts[lineText] >= 2
      exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
    endif
  endfor
endfunction

command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()


" Get currently loaded scripts in a buffer, via [6]
" Execute 'cmd' while redirecting output.
" Delete all lines that do not match regex 'filter' (if not empty).
" Delete any blank lines.
" Delete '<whitespace><number>:<whitespace>' from start of each line.
" Display result in a scratch buffer.
function! s:Filter_lines(cmd, filter)
    let save_more = &more
    set nomore
    redir => lines
    silent execute a:cmd
    redir END
    let &more = save_more
    new
    setlocal buftype=nofile bufhidden=hide noswapfile
    put =lines
    g/^\s*$/d
    %s/^\s*\d\+:\s*//e
    if !empty(a:filter)
        execute 'v/' . a:filter . '/d'
    endif
    0
endfunction
command! -nargs=? Scriptnames call s:Filter_lines('scriptnames', <q-args>)

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

" Timestamp to Date tools
command EpochToDate s/\(\d\{10\}\)\(\d\{3\}\)\?/\=strftime("%Y-%m-%d", str2nr(submatch(1)))/
command EpochToDatetime s/\(\d\{10\}\)\(\d\{3\}\)\?/\=strftime("%Y-%m-%d %H:%M:%S", str2nr(submatch(1)))/

" Filetype Specific Stuff {{{1

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
    autocmd FileType java setlocal textwidth=90
    autocmd FileType java let g:lengthmatters_start_at_column=140
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

" Asciidoc {{{2
augroup filetype_asciidoc
    autocmd!
    autocmd FileType asciidoc setlocal spell spelllang=en_us
    autocmd FileType asciidoc setlocal fo+=t textwidth=79
augroup END
