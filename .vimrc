" Reload pathogen
set nocompatible
call pathogen#infect()
syntax on
filetype plugin indent on

" Force vim to 256 colors mode
set t_Co=256

" Set unnamed clipboard for tmux
set clipboard=unnamed

" Sets line numbers
set number

" Directional keys operate on display lines
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" Visual change indent re-selects visual box
vnoremap < <gv
vnoremap > >gv

" ctrl a, e go to beginning, end of line
map <C-a> 0
map <C-e> $

" <leader>b go to last buffer
map <leader>b <C-^>

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "
let g:mapleader = " "

" leader ; adds a semi-colon to the end of a line
map <leader>; A;<Esc>

" Enable filetype plugins
filetype plugin on
filetype indent on

" Save on focus lost
:au FocusLost * :wa

" Trim whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving
nmap <leader>w :w!<cr>

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" leader s starts a substitution
nmap <leader>s :%s/

" leader cs clears search highlight
map <leader>cs :noh<cr>

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Get them fonts
set gfn=Operator\ Mono\ SSm:h16
" do this: defaults write org.vim.MacVim AppleSmoothFixedFontsSizeThreshold 8

" set gfn=Menlo:h15

" Add a bit extra margin to the left
set foldcolumn=1

" Enable syntax highlighting
syntax enable

try
    colorscheme solarized
catch
endtry

set background=dark

" Set line number color
"highlight LineNr guifg=#666666

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Expand %% to cwd. Helpful when :e
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" File extension handlers
au BufNewFile,BufRead *.es6 set ft=javascript

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using Command+[jk] on mac
nmap <D-j> mz:m+<cr>`z
nmap <D-k> mz:m-2<cr>`z
vmap <D-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <D-k> :m'<-2<cr>`>my`<mzgv`yo`z

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
" Delete trailing white space on save, except .md
autocmd BufWrite *.*!md :call DeleteTrailingWS()

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction


" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

let g:colors_name="desert"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

" show hidden files
let g:ctrlp_show_hidden = 1

let g:ctrlp_map = '<c-f>'
map <leader>p :CtrlP<cr>
"map <leader>P :CtrlPClearAllCaches<cr>:CtrlP<cr>
map <leader>P :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|\.git\|PhantomJS'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
map \ :NERDTreeToggle<cr>
map <leader>r :NERDTreeFind<cr>

" Path setup
set runtimepath^=~/.vim/bundle/ag

"""
" => Emmet
"""
map <leader>e <C-Y>,
imap <C-E> <C-Y>,

" Ag
map <leader>ff :Ag<space>

"""
" => Syntastic
"""
" " prefer local eslint
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let g:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

" " prefer local jscs
" let s:jscs_path = system('PATH=$(npm bin):$PATH && which jscs')
" let g:syntastic_javascript_jscs_exec = substitute(s:jscs_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_error_symbol='🙀'
let g:syntastic_warning_symbol='👀'

"""
" => Airline
"""
let g:airline_theme = 'solarized'

"""
" => vim-commentary for commenting
"""
vmap <leader>/ gc
nmap <leader>/ gcc

" CLIENT SETTINGS
nnoremap <silent> <leader>F :CtrlPClearAllCaches<cr>:CtrlPCurWD<cr>
map <leader>f :CtrlP<cr>
