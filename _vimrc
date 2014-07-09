"             _
"      _   __(_)___ ___  __________
"     | | / / / __ `__ \/ ___/ ___/
"    _| |/ / / / / / / / /  / /__
"   (_)___/_/_/ /_/ /_/_/   \___/

" https://github.com/mross462/dotfiles
"
" Forked from: https://github.com/sontek/dotfiles 

"
" " ==========================================================
" Dependencies - Libraries/Applications outside of vim
" ==========================================================
" Pep8 - http://pypi.python.org/pypi/pep8
" Pyflakes
" Ack
" Rake & Ruby for command-t
" nose, django-nose

" ==========================================================
" Plugins included
" ==========================================================
" Pathogen
"     Better Management of VIM plugins
"
" GunDo
"     Visual Undo in vim with diff's to check the differences
"
" Pytest
"     Runs your Python tests in Vim.
"
" Commant-T
"     Allows easy search and opening of files within a given path
"
" Snipmate
"     Configurable snippets to avoid re-typing common comands
"
" PyFlakes
"     Underlines and displays errors with Python on-the-fly
"
" Fugitive
"    Interface with git from vim
"
" Git
"    Syntax highlighting for git config files
"
" Pydoc
"    Opens up pydoc within vim
"
" Surround
"    Allows you to surround text with open/close tags
"
" Py.test
"    Run py.test test's from within vim
"
" MakeGreen
"    Generic test runner that works with nose



"       ________            ____             _
"      /_  __/ /_  ___     / __ )____ ______(_)_________
"       / / / __ \/ _ \   / __  / __ `/ ___/ / ___/ ___/
"      / / / / / /  __/  / /_/ / /_/ (__  ) / /__(__  )
"     /_/ /_/ /_/\___/  /_____/\__,_/____/_/\___/____/
"
"   These are some basic settings that make vim easier to use without 
"   me having to think about what interface I'm on.

set nocompatible              " Don't be compatible with vi
let mapleader=","             " change the leader to be a comma vs slash
set mouse=a                   " Most computers these days have these,
                              " let's enable it

" Figure out which clipboard to use
set clipboard=unnamed  " Share X windows clipboard.

set encoding=utf-8 nobomb

set binary                    " Don’t add empty newlines at the end of files
set noeol                     "

command! W :w                 " Bind Cap W to write a file

"       ____        __  __
"      / __ \____ _/ /_/ /_  ____  ____ ____  ____
"     / /_/ / __ `/ __/ __ \/ __ \/ __ `/ _ \/ __ \
"    / ____/ /_/ / /_/ / / / /_/ / /_/ /  __/ / / /
"   /_/    \__,_/\__/_/ /_/\____/\__, /\___/_/ /_/
"                               /____/
"
"   A great plugin manager for vim:
"   https://github.com/tpope/vim-pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"       _    ________  ___   _____      __  __  _
"      | |  / /  _/  |/  /  / ___/___  / /_/ /_(_)___  ____ ______
"      | | / // // /|_/ /   \__ \/ _ \/ __/ __/ / __ \/ __ `/ ___/
"      | |/ // // /  / /   ___/ /  __/ /_/ /_/ / / / / /_/ (__  )
"      |___/___/_/  /_/   /____/\___/\__/\__/_/_/ /_/\__, /____/
"                                                   /____/
"   Settings that just make vim better.

syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.

" don't bell or blink
set noerrorbells
set vb t_vb=

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

set grepprg=ack         " replace the default grep program with ack

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Disable the colorcolumn when switching modes.  Make sure this is the
" first autocmd for the filetype here
"autocmd FileType * setlocal colorcolumn=0

""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6             " Keep a small completion window

""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces 
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default

" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.
set colorcolumn=79          " Show me the line before 80

"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,trail:-,precedes:<,extends:>
set list

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

"       __ __              __  ___                  _
"      / //_/__  __  __   /  |/  /___ _____  ____  (_)___  ____ ______
"     / ,< / _ \/ / / /  / /|_/ / __ `/ __ \/ __ \/ / __ \/ __ `/ ___/
"    / /| /  __/ /_/ /  / /  / / /_/ / /_/ / /_/ / / / / / /_/ (__  )
"   /_/ |_\___/\__, /  /_/  /_/\__,_/ .___/ .___/_/_/ /_/\__, /____/
"             /____/               /_/   /_/            /____/
"
"   Keystrokes that make doing things easier

" Paste from clipboard
map <leader>p "+p

" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" sudo write this
cmap W! w !sudo tee % >/dev/null

" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" don't outdent hashes
inoremap # #

colorscheme harlequin

"""" Display
if has("gui_running")
    colorscheme desert
    " Remove menu bar
    set guioptions-=m

    " Remove toolbar
    set guioptions-=T
else
    colorscheme harlequin
endif


"       __
"      / /   ____ _____  ____ ___  ______ _____ ____
"     / /   / __ `/ __ \/ __ `/ / / / __ `/ __ `/ _ \
"    / /___/ /_/ / / / / /_/ / /_/ / /_/ / /_/ /  __/
"   /_____/\__,_/_/ /_/\__, /\__,_/\__,_/\__, /\___/
"                     /____/    /____/
"       _____                 _     _
"      / ___/____  ___  _____(_) __(_)____
"      \__ \/ __ \/ _ \/ ___/ / /_/ / ___/
"     ___/ / /_/ /  __/ /__/ / __/ / /__
"    /____/ .___/\___/\___/_/_/ /_/\___/
"        /_/
"       _____      __  __
"      / ___/___  / /_/ /_(_)___  ____ ______
"      \__ \/ _ \/ __/ __/ / __ \/ __ `/ ___/
"     ___/ /  __/ /_/ /_/ / / / / /_/ (__  )
"    /____/\___/\__/\__/_/_/ /_/\__, /____/
"                              /____/
"
"   To make the editing of specific types of files easier

autocmd FileType html,xhtml,xml,css,ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Python
"au BufRead *.py compiler nose
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au FileType coffee setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0

"   _    ________  ___   __________  __  _______
"   | |  / /  _/  |/  /  / ____/ __ \/  |/  /  _/
"   | | / // // /|_/ /  / /   / / / / /|_/ // /
"   | |/ // // /  / /  / /___/ /_/ / /  / // /
"   |___/___/_/  /_/   \____/_____/_/  /_/___/
"
"   I wrote a vim plugin for cdmi, you should check it out.
"   http://www.github.com/mross462/vim-cdmi
"   Here are the settings for it
let g:cdmi_version="1.0.1"
let g:cdmi_host="qa.mezeofile.com"
let g:cdmi_user="administrator"
let g:cdmi_adminpassword="wnxy68Z/CJYDIfDsJ9qoWg"
let g:cdmi_secure="True"

"       ,
"              / \,,_  .'|
"           ,{{| /}}}}/_.'            _____________________________________________
"          }}}}` '{{'  '.            /                                             \
"        {{{{{    _   ;, \          /            Ladies and Gentlemen,              \
"     ,}}}}}}    /o`\  ` ;)        |                                                |
"    {{{{{{   /           (        |                 this is ...                    |
"    }}}}}}   |            \       |                                                |
"   {{{{{{{{   \            \      |                                                |
"   }}}}}}}}}   '.__      _  |     |    _____             __             __  _      |
"   {{{{{{{{       /`._  (_\ /     |   / ___/__  ______  / /_____ ______/ /_(_)____ |
"    }}}}}}'      |    //___/   --=:   \__ \/ / / / __ \/ __/ __ `/ ___/ __/ / ___/ |
"   `{{{{`       |     '--'       |  ___/ / /_/ / / / / /_/ /_/ (__  ) /_/ / /__   |
"     }}}`                         | /____/\__, /_/ /_/\__/\__,_/____/\__/_/\___/   |
"                                  |      /____/                                    |
"                                  |                                               /
"                                   \_____________________________________________/

let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=['flake8','pyflakes','pep8','pylint']
let g:syntastic_javascript_checkers = ['jshint']