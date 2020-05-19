" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

"---------------------------- BELOW Vundle.vim ----------------------------
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
Plugin 'preservim/nerdtree'
Plugin 'shougo/deol.nvim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"---------------------------- ABOVE Vundle.vim ----------------------------

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		    " Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
"set mouse=nv		" Enable mouse usage (normal & visual modes)
set ruler		    " show the cursor position all the time
set modeline		" set the first line of a file as modeline

" 判斷 c 的格式，在括號後會自動縮排
set cindent

" man 的參數是 -S，而且可以用 man -S 2:3 來限定 man 的查詢範圍
set keywordprg=man\ -S\ 2:3:3p:5:7:8

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if has("diff")
   " 設定超過的部份會自動換行，適合搭配顯示行號使用
   " (方便能看得出來是在同一行的東西，但是可能會有問題)
   " au VimEnter * windo set wrap
   " 設定各種差異時，標示的顏色
   " Add 代表新增的一行， Delete 代表刪除的一行，
   " Change 代表有差異的一行，Text 代表有差異的這一行中，具有差異的部份
   "hi diffAdd ctermfg=Green ctermbg=DarkGray guifg=Green
   "hi diffRemove ctermfg=Red ctermbg=DarkGray guifg=Red
   hi DiffAdd ctermfg=Grey ctermbg=DarkBlue guifg=Grey
   "hi DiffDelete ctermfg=Grey ctermbg=DarkRed guifg=Grey
   "hi DiffChange ctermfg=Black ctermbg=DarkGreen guifg=Black
   hi DiffChange ctermfg=Gray ctermbg=DarkMagenta guifg=Gray
   "hi DiffChange ctermfg=Black ctermbg=DarkMagenta guifg=Black
   "hi DiffText ctermfg=Black ctermbg=DarkCyan guifg=Black
endif

map :W :w
map :Q :q
map :vd :vertical diffsplit 

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set viminfo='100,<1000,s10,h	" read/write a .viminfo file
set noswapfile

"ever add"
set expandtab
set smarttab
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
"nnoremap <F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>
nnoremap <F2> :set list listchars=eol:¬,tab:▸\ ,trail:.<CR>

"ever add"
"inoremap ( ()<Esc>i"
"inoremap { {}<Esc>i"
"inoremap [ []<Esc>i"
"inoremap < <><Esc>i"
"inoremap " ""<Esc>i"
"inoremap ' ''<Esc>i"

"vim 在開啟檔案時，會依序嘗試這些編碼來顯示。
set fileencodings=utf8,big5,gbk,latin1
"設定 vim 的預設編碼
set fileencoding=utf8

set splitright
set splitbelow

"For NERDTreeToggle
"Ctrl + f 啟動/關閉 NERDTree
map <C-f> :NERDTreeToggle<CR>
"假如沒有檔案則關閉 NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"For Deol Shell
"nnoremap <F9> :vsp <bar> :Deol -edit -split="vertical"<CR>
nnoremap <F9> :vsp <bar> :Deol -split="vertical"<CR>
nnoremap <F8> :DeolEdit <CR>
tnoremap <ESC> <C-\><C-n>

"For ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" For Ack.Vim
" Need to install ack
" $ apt-get install ack-grep 
"
"Don't jump to the first result automatically
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" For ctrlp.vim and Ack.Vim, enhance them by sliversearch ag
" $ apt-get install silversearcher-ag
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " For Ack
  "let g:ackprg = 'ag --nogroup --nocolor --column'
  let g:ackprg = 'ag --vimgrep'
  map :ag :Ack
endif

set novisualbell
set visualbell t_vb=

set number
set relativenumber
set scrolloff=4
