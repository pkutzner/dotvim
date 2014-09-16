" vim:set ts=2 sts=2 sw=2 expandtab:

autocmd!

"call pathogen#incubate()
"call pathogen#runtime_append_all_bundles()
execute pathogen#infect()
execute pathogen#helptags()

set nocompatible
" allow unsaved background buffers and remember marks/undo for them
set hidden
" remember more commands and search history
set history=10000
" Don't set a byte-order mark as it can mess with some editors
set nobomb
" Set permanent UTF-8 file encoding
setglobal fileencoding=utf-8
" Set encoding to UTF-8
set encoding=utf-8
" Set terminal encoding to UTF-8
set termencoding=utf-8
" Align '<' and '>' to a rounded multiple of 'shiftwidth'
set shiftround
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
set showmatch
" Number of tenths of a second to show paren match
set matchtime=3
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
set cursorline
" highlight current column
set cursorcolumn
set cmdheight=1
set switchbuf=useopen
set showtabline=0
set winwidth=79
" this makes RVM work inside vim. I have no idea why.
set shell=bash
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
" keep more context when scrolling off the end of a buffer or line
set scrolloff=3
set sidescrolloff=3
" Don't make backups at all
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" display incomplete commands
set showcmd
" Enable syntax highlighting
syntax on
" Enable file detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu
" Set personal leader key to ','
let mapleader=","
let g:mapleader=","
let maplocalleader="\\"
" Fix slow O inserts
:set timeout timeoutlen=1000 ttimeoutlen=100
" set notimeout
" set ttimeout
" set ttimeoutlen=10
" Normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone.
let g:sh_noisk=1
" None of these are valid word dividers, so make them not be
set isk+=_,$,@,%,#,-,?,&
" Modelines (comments that set vim options on a per-file basis)
"set modeline
"set modelines=3
set modelines=0
" Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable

" Insert only one space when joining lines that contain sentence-terminating
" punctuation like '.'.
set nojoinspaces
" If a file is changed outside of vim, automatically reload it without asking
set autoread
" Indent comments
set cindent
" See 'cinkeys'; this stops '#' from indenting
set cinkeys=0{,0},:,!^F,o,O,e
" Allow backspace to delete previous characters
set bs=2
" Allows left/right keys to wrap across lines
set whichwrap=<,>,[,],h,l
" Enable line numbering, taking up to 6 characters
set number
" Don't number a word-wrapped line
set cpoptions-=n
" Add angle brackets to pair-matching
set matchpairs+=<:>
" Turn off line-wrapping
set nowrap
" Set default file format for new files
set fileformat=unix
" Support all three newline formats
set fileformats=unix,dos,mac
" Show title in xterm
set title
set noswapfile
set swapsync=fsync
" Don't redraw while executing macros
set lazyredraw
set complete=.,w,b,u,t,i,d
set completeopt=longest,menuone,preview
set ttyfast
set diffopt=filler,iwhite
set nostartofline
" Disable annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" Shorten command-line text and other info tokens (see :help shortmess)
set shortmess=atI
" Show Vim mode
set showmode
set showcmd
" Use same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:☠,extends:#,nbsp:.
" Disable showing certain whitespace chars in certain files
if has('autocmd')
    autocmd filetype html,xml set listchars=-tab:>.
endif
" Hide buffer when not in window (to prevent relogin with FTP edit)
set bufhidden=hide
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set dictionary=/usr/share/dict/words
set spellfile=~/.vim/custom-dictionary.utf-8.add
set synmaxcol=800

" Enable plugins
filetype plugin on

" Set colors/colorscheme
"set t_Co=256
if &t_Co >= 256 || has("gui_running")
    set background=dark
"    colorscheme grb256
    colorscheme solarized
endif

" Cursorline {{{
"   Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline nocursorcolumn
    au WinEnter,InsertLeave * set cursorline cursorcolumn
augroup END
" }}}

" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

" Highlight trailing whitespace
highlight WhitespaceEOL ctermbg=DarkYellow guibg=DarkYellow
match WhitespaceEOL /\s\+$/

" Remove windows ^M - when the encodings get messed up
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Set format options
" t - autowrap textwidth
" c - autowrap comments to textwidth
" r - autoinsert comment leader with <Enter>
" q - allow formatting of comments with :gq
" l - don't format already long lines
set formatoptions=t,c,r,o,q,l

" Syntax highlighting
if v:version >= 600
    " Vim 6+
    " Increase highlighting accuracy
    syn sync fromstart
else
    syn sync minlines=1000
endif

if v:version >= 700
    if has('relativenumber')
        set relativenumber
        " Pressing <leader>rn will toggle/untoggle relative numbering
        map <leader>rn :setlocal relativenumber!<CR>:setlocal relativenumber?<CR>
    endif
endif

" Shortcut to indent entire file
nmap <F11> 1G=G
imap <F11> <ESC>1G=Ga

" Delete = Backspace
nmap <Del> <BS>
imap <Del> <BS>

" Rapidly toggle 'set list'
nmap <leader>l :set list!<CR>

" Shortcut to LustyJuggler
nmap <leader>L :LustyJuggler<CR>

" Quickly edit/reload .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Search forward (*) and backward (#) for current selection in visual mode
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Map <space> to / (search) and <ctrl><space> to ? (rev. search) in normal mode
map <space> /
map <c-space> ?

" Change CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" Return to last edit position when opening a file
if has ('autocmd')
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif

" Remember info about open buffers on close
set viminfo^=%

" Move a line of text using ALT+[j/k] or Command+[j/k] on Mac
nmap <M-j> mz:m+<CR>`z
nmap <M-k> mz:m-2<CR>`z
vmap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif

" Search and replace selected text using <leader>r
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Pressing <leader>ss (,ss) will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Clear highlighted searches
nmap <silent> <leader>/ :nohlsearch<CR>

" Shortcuts using <leader> for spelling
" Next misspelled word
map <leader>sn ]s
" Prev. misspelled word
map <leader>sp [s
" Add word to dictionary
map <leader>sa zg
" Undo add word to dictionary
map <leader>su zug
" Search suggestions
map <leader>s? z=

" Map Ctrl-movement keys to window switching
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Switch to alternate file
map <C-Tab> :bnext<CR>
map <C-S-Tab> :bprevious<CR>

" Quick convert tabstops for a file
nmap <localleader>t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <localleader>T :set expandtab tabstop=8 shiftwidth=8 softtabstop=8<CR>
nmap <localleader>M :set noexpandtab tabstop=8 shiftwidth=8 softtabstop=8<CR>
nmap <localleader>m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

" Quick-toggle wrap-mode
nmap <localleader>w :setlocal wrap!<CR>:setlocal wrap?<CR>

" Quick-toggle line numbers
nmap <localleader>l :setlocal number!<CR>:setlocal number?<CR>

" Quock-toggle paste-mode
nmap <localleader>o :setlocal paste!<CR>:setlocal paste?<CR>

" Indentation specific for python
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``

" <leader>W strips all trailing whitespace from current file
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" Set filetype to 'text' for files ending in .txt
if has("autocmd")
    autocmd BufNewFile,BufRead *.txt setfiletype text
    autocmd FileType text,markdown,html setlocal wrap linebreak nolist showbreak=…
endif

" I'm a lazy typist, so reduce a 2-key combo to 1 key.
nnoremap ; :

" Useful if you've forgotten to sudo edit a file
command! W :execute ':silent w !sudo tee % >/dev/null' | :edit!

" Multi-purpose Tab key: Indent if at the beginning of a line, else do
" completion.
"function! InsertTabWrapper()
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"        return "\<TAB>"
"    else
"        return "\<C-n>"
"    endif
"endfunction
"inoremap <TAB> <C-r>=InsertTabWrapper()<CR>
"inoremap <S-TAB> <C-n>"

" Syntax highlight shell scripts as per POSIX.
" not the original Bourne shell which very few use.
let g:is_posix=1

function! DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
command! DiffSaved call DiffWithSaved()

" Invert scrollbind for all buffers
function! InvertScrollBindAll()
    if &scrollbind
        windo set noscrollbind
        echo "disable scrollbind"
    else
        windo set scrollbind
        echo "enable scrollbind"
    endif
endfunction
nnoremap <leader>sb :call InvertScrollBindAll()<CR>

" Invert diff for all buffers
function! InvertDiffAll()
    if &diff
        windo set nodiff
        echo "disable diff"
    else
        windo set diff
        echo "enable diff"
    endif
endfunction
nnoremap <leader>id :call InvertDiffAll()<CR>

" Invert cursor bind for all buffers
function! InvertCursorBindAll()
    if &cursorbind
        windo set nocursorbind
        echo "disable cursorbind"
    else
        windo set cursorbind
        echo "enable cursorbind"
    endif
endfunction
nnoremap <leader>cb :call InvertCursorBindAll()<CR>
nnoremap <leader>diff :call InvertScrollBindAll()<CR>:call InvertDiffAll()<CR>:call InvertCursorBindAll()<CR>

function! CloneAs( filespec, isSplit, startLnum, endLnum )
    if bufexists(a:filespec) && bufloaded(a:filespec)
        echo "File exists and is open: " . a:filespec
        return 0
    endif

    let l:save_eventignore = &eventignore
    set eventignore+=BufNewFile "Do not trigger template systems etc.; The appropriate event is BufRead, which we'll emit instead.
    try
        let l:filetype = &l:filetype
        let l:fileformat = &l:fileformat
        let l:fileencoding = &l:fileencoding
        let l:isEntireBuffer = (a:startLnum == 1 && a:endLnum == line('$'))
        let l:view = winsaveview()
        let l:contents = getline(a:startLnum, a:endLnum)

        execute (a:isSplit ? ' vsplit' : 'edit') a:filespec

        let &l:fileformat = l:fileformat
        let &l:fileencoding = l:fileencoding

        call setline(1, l:contents)

        if ! l:isEntireBuffer
            let l:view.lnum -= a:startLnum - 1
            let l:view.topline -= a:startLnum - 1
        endif
        silent! call winresetview(l:view)

        doautocmd BufRead

        if ! empty(l:filetype) && &l:filetype !=# l:filetype
            let &l:filetype = l:filetype
        endif

        return 1

    catch /^Vim\%((\a\+)\)\=:/
        return 0
    finally
        let &eventignore = l:save_eventignore
    endtry
endfunction
command! -bar -range=% -nargs=1 -complete=file CloneAs call CloneAs(<q-args>, 0, <line1>, <line2>)
command! -bar -range=% -nargs=1 -complete=file SCloneAs call CloneAs(<q-args>, 1, <line1>, <line2>)
"-----------------------------------------------------
" Reverse number row characters (e.g. Shift-Lock the
" number row).
"-----------------------------------------------------
function! ReverseNumberRow()
    inoremap ` ~
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
    inoremap = +
    inoremap ~ `
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
    inoremap + =
endfunction

function! RestoreNumberRow()
    iunmap `
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
    iunmap =
    iunmap ~
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
    iunmap +
endfunction

function! ToggleNumberRow()
    if !exists("g:NumberRow") || 0 == g:NumberRow
        let g:NumberRow = 1
        call ReverseNumberRow()
    else
        let g:NumberRow = 0
        call RestoreNumberRow()
    endif
endfunction

" <leader>tnr to toggle number row
nnoremap <leader>tnr :call ToggleNumberRow()<CR>

" Uppercase current word
"
" This mapping allows you to press <C-u> in insert mode to convert the current
" word to uppercase. It's handy when you're writing names of constants and
" don't want to use CapsLock.
"
" To use it, type the word in lowercase.  While your cursor is at the end of
" the word, press <C-u> to uppercase it, and then continue happily on your
" way.
"
" It works by exiting out of insert mode, recording the current cursor
" location in the z mark, using gUiw to uppercase inside the current word,
" moving back to the z mark, and entering insert mode again.
"
" NOTE: This will overwrite your z mark.  I never use it, but if you do,
" change it to something else.
inoremap <C-u> <esc>mzgUiw`za

" Emacs bindings in command mode
cnoremap <C-a> <home>
cnoremap <C-e> <end>

" Disable speeddating plugin key mappings.
" Speeddating remaps <C-a> in normal mode, but I
"  want to use it for emacs-style nav in normal mode
"  instead.
let g:speeddating_no_mappings=1

" Emacs bindings in normal mode
nnoremap <C-a> 0
nnoremap <C-e> $

" Rebind speeddating plugins to <C-i>
nmap <C-i>      <Plug>SpeedDatingUp
nmap <C-x>      <Plug>SpeedDatingDown
xmap <C-i>      <Plug>SpeedDatingUp
xmap <C-x>      <Plug>SpeedDatingDown
nmap d<C-i>     <Plug>SpeedDatingNowUTC
nmap d<C-x>     <Plug>SpeedDatingNowLocal

" Reformat line.
" I never use l as a macro register, but caveat emptor.
nnoremap ql ^vg_gq

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about overloading it.
nnoremap S i<CR><esc>^mwgk:silent! s/\v +$//<CR>:noh<CR>`w

" Keep cursor in place while joining lines
nnoremap J mzJ`z

" Directional keys
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" OpenChangedFiles COMMAND (Open a split for each dirty file in git)
function! OpenChangedFiles()
    only " Close all windows, unless they're modified
    let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
    let filenames = split(status, "\n")
    exec "edit " . filenames[0]
    for filename in filenames[1:]
        exec "sp " . filename
    endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    umenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$', "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . ""
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" ")
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . ""
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"UltiSnips config:
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-p>"
