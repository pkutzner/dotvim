""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()
execute pathogen#helptags()

set history=1000            " Remember more commands and search history
set nobomb                  " Set no Byte Order Mark (messes with some editors)
set modelines=0             " Disable modelines
setglobal fileencoding=utf-8 " Set permanent utf-8 file encoding
set encoding=utf-8          " Set encoding to utf-8
set termencoding=utf-8     " Set terminal encoding to utf-8
set fileencodings=utf-8,iso-8859-15 " set file encoding preference order
set shiftround
set matchtime=3             " Number of tenths of seconds to show paren match

set cindent                 " Indent Comments
set cinkeys=0{,0},:,!^F,o,O,e   " See "cinkeys"; this stops "#" from indenting
set nocompatible            " Use Vim settins, as opposed to vi settings
set bs=2                    " set backspace to be able to delete previous characters
set backspace=indent,eol,start
set whichwrap=<,>,[,],h,l   " Allows left/right keys to wrap across lines
set number                  " Enable line numbering, taking up to 6 characters
set cpoptions-=n            " Don't number a word-wrapped line
set matchpairs+=<:>         " Add angle brackets to pair-matching
set nowrap                   " Turn off word-wrapping
set cursorline              " Highlight current line
set cursorcolumn            " Highlight current column
set nojoinspaces            " One space after a "." rather than two
set fileformat=unix         " Set default file format for new files
set fileformats=unix,dos,mac " Support all three newline formats
set encoding=utf-8
set isk+=_,$,@,%,#,-,?,&    " none of these are valid word dividers, so make them not be
set title                   " Show title in xterm
set showmatch               " Show matching brackets
set nobackup                " Don't create backup files
"set backup                  " keep a backup file
"set backupdir=~/.vim/tmp/backup// " Backup directory
"set undodir=~/.vim/tmp/undo//     " Undo directory
"set directory=~/.vim/tmp/swap//   " Swap directory
"set backupcopy=auto

" Fix for editing user crontab file
set backupskip=/tmp/*,/private/tmp/*

" Make folders automatically if they don't already exist.
"if !isdirectory(expand(&undodir))
"    call mkdir(expand(&undodir), "p")
"endif
"if !isdirectory(expand(&backupdir))
"    call mkdir(expand(&backupdir), "p")
"endif
"if !isdirectory(expand(&directory))
"    call mkdir(expand(&directory), "p")
"endif

set noswapfile              " It's 2013, Vim.
set swapsync=fsync
set autoread                " Automatically re-read files that have been changed externally
set lazyredraw              " Don't redraw while executing macros

set undolevels=1000         " 1000 undo levels
"set complete=.,w,b,u,U,t,i,d " Lots of scanning on tab completion
set complete=.,w,b,u,t,i,d
set completeopt=longest,menuone,preview
set ttyfast

set diffopt=filler,iwhite

set nostartofline           " makes cursor col stay put while scrolling

"
" Disable annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"Turn on smart-indent
set smartindent
set expandtab
set smarttab
set tabstop=8
set shiftwidth=4
set softtabstop=4

" Shorten command-line text and other info tokens (see :help shortmess)
set shortmess=atI

"Turn on incremental search with ignore-case (except explicit caps)
set incsearch
set ignorecase
set smartcase

"Informative status-line
set laststatus=2
"set statusline=%F%m%r%h%w\ 
"set statusline+=[BUF=%n]\ 
"set statusline+=[FORMAT=%{&ff}]\ 
"if v:version >= 600
"    " show character encoding
"    set statusline+=[ENC=%{&encoding}]\ 
"endif
"set statusline+=[TYPE=%Y]\ 
"set statusline+=[ASCII=\%03.3b]\ 
"set statusline+=[HEX=0x\%02.2B]\ 
"set statusline+=[POS=%04l,%04v][%p%%]\ 
"set statusline+=[LEN=%L]

"Show vim mode
set showmode
set showcmd

"Use same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:☠

"Hide buffer when not in window (to prevent relogin with FTP edit)
set bufhidden=hide

"Have 1 lines of offset (or buffer) when scrolling
set scrolloff=5
set sidescrolloff=5

set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

"Added 2013-02-06
"set shell=/opt/local/bin/bash\ --login
set dictionary=/usr/share/dict/words
set spellfile=~/.vim/custom-dictionary.utf-8.add
set synmaxcol=800
set notimeout
set ttimeout
set ttimeoutlen=10

"Set colors / color scheme
set t_Co=256
colorscheme grb256
"let g:solarized_termcolors=256
"colorscheme solarized
"set background=dark
syntax enable
"let g:Powerline_theme='solarized256'
"let g:Powerline_colorscheme='solarized256'
"let g:solarized_degrade=1

"Cursorline {{{
" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END
" }}}

" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybindings and misc.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Options for bash-support plugin
let g:BASH_AuthorName   = 'Preston Kutzner'
let g:BASH_Email        = 'pkutzner@marketingresources.com'
let g:BASH_Company      = 'Marketing Resources, Inc.'

nore ; :

"Highlight trailing whitespace
highlight WhitespaceEOL ctermbg=DarkYellow guibg=DarkYellow
match WhitespaceEOL /\s\+$/

" Remove windows ^M - when the encodings get messed up
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

let mapleader = ","         " Make ',' personal leader key
let g:mapleader = ","
let maplocalleader = "\\"

nmap <leader>w :w!<cr>
nmap <leader>ww :w!!<cr>
nmap <leader>tw :. w! ~/.vimxfer<CR>
nmap <leader>tr :r ~/.vimxfer<CR>
nmap <leader>ta :. w! >>~/.vimxfer<CR>

filetype plugin on          " Enable plugins

if version >= 600
    " Vim 6 options
    set formatoptions=tcroql    " colo cduan
                                " t - autowrap textwidth
                                " c - autowrap comments to textwidth
                                " r - autoinsert comment leader with <Enter>
                                " q - allow formatting of comments with :gq
                                " l - don't format already long lines
    syn sync fromstart          " Increase highlighting accuracy
else
    set fo=tcroql
    syn sync minlines=1000
endif

if version >= 720
    set relativenumber
endif

"" vim 7 omnicompletion
" doesn't quite work
if has("autocmd") && exists("omnifunc")
    autocmd Filetype *
        if &omnifunc == "" |
            setlocal omnifunc=syntaxcomplete#Complete |
        endif
endif

if has("autocmd")
    au BufNewFile,BufReadPre *.gpg :set secure vimi= noswap noback nowriteback hist=0 binary
    au BufReadPost *.gpg :%!gpg -d 2>/dev/null
    au BufWritePre *.gpg :%!gpg -e -r 'pkutzner@gmail.com' 2>/dev/null
    au BufWritePost *.gpg u
endif

"Turn on spell checking with English dictionary
"set spell
"set spelllang=en
"set spellsuggest=9 "Only offer 9 spelling suggestions

filetype indent on "Indent depends on file type
:inoremap # X#

"Shortcut to indent entire file
nmap <F11> 1G=G
imap <F11> <ESC>1G=Ga

nmap <Del> <BS>
imap <Del> <BS>

"Shortcut to rapidly toggle 'set list'
nmap <leader>l :set list!<CR>

"Shortcut to LustyJuggler
nmap <leader>L :LustyJuggler<cr>

" Visual mode pressing * or # searches for the current selection
" Super useful!  From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Map <space> to / (search) and Ctrl-<space> to ? (backward search)
map <space> /
map <c-space> ?

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Remember info about open buffers on close
set viminfo^=%

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif

" Pressing <leader>ss (,ss) will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using leader
" Next misspelled word
map <leader>sn ]s
" Previous misspelled word
map <leader>sp [s
" Add word to dictionary
map <leader>sa zg
" Undo add word to dictionary
map <leader>su zug
" Search suggestions
map <leader>s? z=

"Map ctrl-movement keys to window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Switch to alternate file
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

"Map Opt-[key] to movement keys within wrapped lines.
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

"Custom tabstops
nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<cr>
nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<cr>
nmap \M :set noexpandtab tabstop=8 shiftwidth=8 softtabstop=8<cr>
nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<cr>

"Quick-toggle wrap-mode
nmap \w :setlocal wrap!<cr>:setlocal wrap?<cr>

"Toggle line numbers
nmap \l :setlocal number!<cr>

"Toggle paste mode
nmap \o :set paste!<cr>

autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,wile,with,try,except,finally,def,class
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``

function! ToggleBackground()
    if (g:solarized_style=="dark")
        let g:solarized_style="light"
        colorscheme solarized
    else
        let g:solarized_style="dark"
        colorscheme solarized
    endif
endfunction
command! Togbg call ToggleBackground()
nnoremap <F5> :call ToggleBackground()<CR>
inoremap <F5> <ESC>:call ToggleBackground()<CR>a
vnoremap <F5> <ESC>:call ToggleBackground()<CR>
nnoremap <F8> :setlocal noautoindent nocindent nosmartindent indentexpr= comments=<CR>

" Make ^e and ^y scroll 3 lines instead of one
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" <leader>W strips all trailing whitespace from current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

if has("autocmd")
    " Set File type to 'text' for files ending in .txt
    autocmd BufNewFile,BufRead *.txt setfiletype text
    autocmd FileType text,markdown,html setlocal wrap linebreak nolist showbreak=…
endif

" Useful when you've forgotten to sudo edit a file
"cmap w!! w !sudo tee % >/dev/null
"cmap w!! w !sudo dd of=%
command! W :execute ':silent w !sudo tee % >/dev/null' | :edit!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we are at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files/Backups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Instead of having to press 'ctrl-w h' to move the window to the left, just
" press ctrl-h
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l

" Syntax highlight shell scripts as per POSIX,
" not the original Bourne shell which very few use
let g:is_posix = 1

" InsertTime COMMAND (Insert the current time)
command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<c-r>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . ""
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . ""
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Diff with saved version of the file
function! DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call DiffWithSaved()

" Reverse number row characters
function! ReverseNumberRow()
    " Map each number to its  shift-key character
    inoremap 1 !
    inoremap 2 @
    inoremap 3 #
    inoremap 4 $
    inoremap 5 %
    inoremap 6 ^
    inoremap 7 &
    inoremap 8 *
    inoremap 9 (
    inoremap 0 )
    inoremap - _
    " and then the opposite
    inoremap ! 1
    inoremap @ 2
    inoremap # 3
    inoremap $ 4
    inoremap % 5
    inoremap ^ 6
    inoremap & 7
    inoremap * 8
    inoremap ( 9
    inoremap ) 0
    inoremap _ -
endfunction

" Reverse ReverseNumberRow chnages (back to normal)
function! NormalizeNumberRow()
    iunmap 1
    iunmap 2
    iunmap 3
    iunmap 4
    iunmap 5
    iunmap 6
    iunmap 7
    iunmap 8
    iunmap 9
    iunmap 0
    iunmap -
    "-------
    iunmap !
    iunmap @
    iunmap #
    iunmap $
    iunmap %
    iunmap ^
    iunmap &
    iunmap *
    iunmap (
    iunmap )
    iunmap _
endfunction

function! ToggleNumberRow()
    if !exists("g:NumberRow") || 0 == g:NumberRow
        let g:NumberRow = 1
        call ReverseNumberRow()
    else
        let g:NumberRow = 0
        call NormalizeNumberRow()
    endif
endfunction

" Call ToggleNumberRow
nnoremap <leader>tnr :call ToggleNumberRow()<CR>

" Toggle line numbers
nnoremap <leader>n :setlocal number!<CR>

" Uppercase word mapping
"
" This mapping allows you to press <c-u> in insert mode to convert the current
" word to uppercase.  It's handy when you're writing names of constants and
" don't want to use CapsLock.
"
" To use it, type the name of the constant in lowercase.  While your
" cursor is at the end of the word, press <c-u> to uppercase it, and then
" continue happily on your way.
"
" It works by exiting out of insert mode, recording the current cursor
" location in the z mark, using gUiw to uppercase inside the current word,
" moving back to the z mark, and entering insert mode again.
"
" Note that this will overwrite the contents of the z mark.  I never use it,
" but if you do, you'll probably want to use another mark.
inoremap <C-u> <esc>mzgUiw`za

" Panic button
nnoremap <f9> mzggg?G`z

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Reformat line.
" I never use l as a macro register anyway.
nnoremap ql ^vg_gq

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Directional keys {{{
" It's 2013.
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Easy buffer navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>v <C-w>v
" }}}
