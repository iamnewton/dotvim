" Disable Vi compatibility
set nocompatible

" vim-plug already includes this
" (https://github.com/junegunn/vim-plug/tree/fc2813ef4484c7a5c080021ceaa6d1f70390d920#usage)
" explanataion: https://vi.stackexchange.com/a/10125
" filetype plugin indent on

" vim-plug already includes this
" (https://github.com/junegunn/vim-plug/tree/fc2813ef4484c7a5c080021ceaa6d1f70390d920#usage)
" https://alvinalexander.com/linux/vi-vim-editor-syntax-highlighting/
" syntax on

" Set ViM's :terminal to use the login shell as it appears ViM by default sets
" it to use non-interactive shell
" https://stackoverflow.com/a/9092644/1536779
set shell=bash\ -l

" When you make a change to a file tracked by git, the diff markers should appear
" automatically. The delay is governed by vim's updatetime option; the default
" value is 4000, i.e. 4 seconds, but reducing it to around 100ms. Note
" updatetime also controls the delay before vim writes its swap file (see
" :help updatetime).
set updatetime=100

" set eol formats
set fileformats="unix,dos,mac"

" Optimize for fast terminal connections
set ttyfast

" normal OS clipboard interaction
" commenting out for now as it makes it difficult to yank and paste
" as you yank into the pasteboard, thus removing what you wanted to paste
" Just use "* register to use Mac OSX clipboard
" set clipboard=unnamed

" don't beep
set visualbell
set noerrorbells

" hide buffers instead of closing them this means that the current buffer can
" be put to background without being written; and that marks and undo history
" are preserved
set hidden
" reveal already opened files from the quickfix window instead of opening new
" buffers
set switchbuf=useopen

" do not keep backup files
set nobackup
" store backup files (in case backup is ever turned on)
if isdirectory($HOME . "/.vim/backups")
	set backupdir=$HOME/.vim/backups
endif

" do not write annoying intermediate swap files, who did ever restore from swap
" files anyway?
set noswapfile
" store swap files (in case swapfile is ever turned on)
if isdirectory($HOME . "/.vim/swaps")
	set directory=$HOME/.vim/swaps
endif

" remember more commands and search history
set history=1000
" use many muchos levels of undo
set undolevels=1000
if v:version >= 730
	" keep a persistent backup file
	set undofile
	if !isdirectory($HOME . "/.vim/undo")
		call mkdir($HOME . "/.vim/undo", "p")
	endif
	set undodir=$HOME/.vim/undo
endif

" read/write a .viminfo file, don't store more than 80 lines of registers
set viminfo='20,\"80
set viminfo+=n$HOME/.vim/.viminfo

" ########## WILDMENU ##########
if has("wildmenu")
	" Show a list of possible completions
	set wildmenu
	" Tab autocomplete longest possible part of a string, then list
	" set wildmode=longest,list
	" a part of Thoughtbot's dotfiles
	" https://github.com/thoughtbot/dotfiles/blob/master/vimrc#L98
	set wildmode=list:longest,list:full
	if has ("wildignore")
		set wildignore+=*.a,*.pyc,*.o,*.orig
		set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png
		set wildignore+=.DS_Store,.git,.hg,.svn
		set wildignore+=*~,*.sw?,*.tmp
	endif
endif
" ########## WILDMENU: END ##########
