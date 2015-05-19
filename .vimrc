execute pathogen#infect()
syntax on
filetype indent plugin on

" set python syntax highlighting for files ending in .wsgi
au BufNewFile,BufRead *.wsgi set filetype=python

" automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" call Flake8 when saving a python file
" Remember to install flake8 via pip
autocmd BufWritePost *.py call Flake8()

" Change highlight color for searches
hi Search cterm=NONE ctermfg=grey ctermbg=blue

" Set Flake8 to run on ctrl-c
autocmd FileType python map <buffer> <C-C> :call Flake8()<CR>

" Turn on line numbering
set number

" python Settings
" @see http://docs.python-guide.org/en/latest/dev/env/
set autoindent    " align the new line indent with the previous line
set expandtab     " insert spaces when hitting TABs
set shiftround    " round indent to multiple of 'shiftwidth'
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set tabstop=4     " a hard TAB displays as 4 columns
set textwidth=79  " lines longer than 79 columns will be broken

" make search case insensitive
set hlsearch
set ignorecase
set incsearch
set smartcase                                                                                                                           

" disable backup and swap files
" trigger too many events for file system watchers
set nobackup
set noswapfile
set nowritebackup

" Set the scrolling to keep 5 lines below / above the cursor
set scrolloff=5

" highlight characters past column 70 as a warning.
" lines will get wrapped at 79 characters
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python highlight Excess ctermbg=DarkRed ctermfg=White
    autocmd FileType python match Excess /\%75v.*/
    autocmd FileType python set nowrap
    augroup END

" toggles NerdTree with CTRL+n
map <C-n> :NERDTreeToggle<CR>

" bind Ctrl+<movement> keys to move around the windows, 
" instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
