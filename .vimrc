"
" @Author	:	Wen.Su
" 
" @Time		: 	2015/10
"
" @Desc		:	basic settings of my vim resource
"
" @TODO		: 	AutoUpdate, Hotkey, ColorScheme, plugin about preprocessor, syntax check
" 				auto Completion, etc



""""""""""""""""""""""""""""""
" @Basic
""""""""""""""""""""""""""""""
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" Allow backspace in insert mode 
set backspace=indent,eol,start
" Enable filetype plugins TODO
filetype plugin on
filetype indent on
" Show the cursor all the time
set ruler
" Disable cursor blink
set gcr=a:blinkon0
" Autoread when a file is changed from the outside
set autoread
" No sounds
set visualbell
" Show current mode/cmd at the bottome
set showcmd 

" Other
set history=500


""""""""""""""""""""""""""""""
" @Swap Files
""""""""""""""""""""""""""""""
if 1
set noswapfile
set nobackup
set nowb
endif

""""""""""""""""""""""""""""""
" @Indentation 
""""""""""""""""""""""""""""""
set autoindent
set smartindent
set cindent
set smarttab
set tabstop=4
if 0
set shiftwidth=2
set softtabstop=2
set expandtab
endif 
" Display tabs and trailing blank visually
"set list listchars=tab:\ \ ,trail:·
" Wrap lines and wrapping at proper position
set wrap
set linebreak


""""""""""""""""""""""""""""""
" @Completion
""""""""""""""""""""""""""""""
set wildmode=list:longest
" Enable Ctrl-n, Ctrl-p to scroll through matches
set wildmenu
" Stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~,*.swp
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

""""""""""""""""""""""""""""""
" @scrolling 
""""""""""""""""""""""""""""""
" Start scrolling when we're 8 lines away from margins
set scrolloff=8
set sidescrolloff=15
set sidescroll=1


""""""""""""""""""""""""""""""
" @Search
""""""""""""""""""""""""""""""
set incsearch
set hlsearch
" Ignore Case when searching
set ignorecase
" Unless we type a capital 
set smartcase

""""""""""""""""""""""""""""""
" @ColorScheme 
" https://code.google.com/p/vimcolorschemetest/
"
" 1. Download name_scheme.vim
" 2. mv name_scheme.vim ~/.vim/colors/
" 3. colorscheme name_scheme   #put in ~/.vimrc
" 4. :colorscheme name_scheme
""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
if 0
" TODO
set t_Co=256

" Use the unix as the standard file type
set ffs=unix,mac,dos
set encoding=utf8

colorscheme colorful256
endif


""""""""""""""""""""""""""""""
" @Persistent Undo 
""""""""""""""""""""""""""""""
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif
""""""""""""""""""""""""""""""
" @HOTKEY
""""""""""""""""""""""""""""""
" TODO
" Fast saving
nmap <leader>w :w!<cr>
" Fast quit
nmap <leader>q :q!<cr>
" Remap 0 to first non-blank char.
map 0 ^

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif
