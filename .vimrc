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
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
"set cindent
"set smartindent
"set ts=4
if 0
set shiftwidth=2
set softtabstop=2
endif 
" TODO Display tabs and trailing blank visually
" set list listchars=tab:\ \ 
" Wrap lines and wrapping at proper position
set wrap
set linebreak


""""""""""""""""""""""""""""""
" @Completion
""""""""""""""""""""""""""""""
set wildmode=list:longest
" Enable Ctrl-n, Ctrl-p to scroll matches via menu
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
" Incremental search. Start searching when typing char.
set incsearch
" Highlight search
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
if 0 " XXX
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
let mapleader =";"
" Fast saving
"nmap <leader>w :w!<cr>
nmap <leader>w :w<cr>
" Fast quit	
nmap <leader>q :q!<cr>
" Fast tabe
nmap <leader>t :tabe 
" Remap 0 to first non-blank char.
map 0 ^

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Enable highlighting of these keywords in all files. 
" \W\zs ensures that there is a word break in front of the match
if has('autocmd')
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|XXX\|???\|NOTE\|BUG\|HACK\)')
	autocmd Syntax * call matchadd('Debug', '\W\zs\(INFO\|IDEA\|WARN\)')
  endif
endif 
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <f9> :Tlist<CR>

let g:acp_completeOption = '.,t,i,b'

" For cscope
"
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=1
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	endif
	set csverb
endif

