" Enforce UTF 8 for the vim-devicons to work
if has("multi_byte")
	" Use UTF-8 without BOM
	set encoding=UTF-8 nobomb
	set termencoding=utf-8
endif

" If using gvim, (https://vim.fandom.com/wiki/Setting_the_font_in_the_GUI)
" them detect if this setting is there and set the font accordingly
" otherwise this is likely not needed for console ViM as that is determined by
" the terminal emulator (e.g. iTerm)
if has ("guifont")
	set guifont=InputMonoCondensed\ Nerd\ Font\ 16
endif

" https://github.com/sonph/onehalf/tree/master/vim#true-colors
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors

	" Set 256 color terminal support
	set t_Co=256
endif

function! MyHighlights() abort
	" Highlight current line
	highlight clear CursorLine
	highlight CursorLine cterm=underline term=underline gui=underline guibg=NONE
	" Highlight words to avoid
	highlight TechWordsToAvoid ctermbg=#e45649 ctermfg=#dcdfe4 guibg=#e45649 guifg=#dcdfe4

	" highlight Normal     cterm=NONE ctermbg=17              gui=NONE guibg=#00005f
	" highlight NonText    cterm=NONE ctermbg=17              gui=NONE guibg=#00005f
endfunction

" https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
augroup MyColors
	autocmd!
	autocmd ColorScheme * call MyHighlights()
augroup END

" set the color scheme to Seti UI
" set background=dark
" silent! colorscheme seti

" set the color scheme to One Half (dark)
silent! colorscheme onehalfdark
" silent! colorscheme onehalflight

" ########## INVISIBLES ##########
" How many columns of whitespace is a \t is worth
set tabstop=4
" Use 4 spaces for soft tab
set softtabstop=4
" How many columns of whitespace is a 'level of indentation' is worth
set shiftwidth=4
" Tabs over spaces
set noexpandtab
" insert tabs on the start of a line according to shiftwidth, not tabstop
set smarttab
" https://github.com/nvie/vimrc/blob/master/vimrc#L40-L81
" use multiple of shiftwidth when indenting with '<' and '>'
set shiftround
" always set autoindenting on
set autoindent
" copy the previous indentation on autoindenting
set copyindent
" Backspace through everything in INSERT mode
set backspace=indent,eol,start
" Show 'invisible' characters
set list!
" Set tab to show plus on first character and dash on subsequent
set listchars=tab:+-
" Set trailing whitespace to show bull character
set listchars+=trail:·
" Character to show in the first column, when 'wrap'
" is off and there is text preceding the character
" visible in the first column
set listchars+=precedes:→
" Set characters that extend off-screen to ellipses
set listchars+=extends:…
" set non-breaking space to underscore
set listchars+=nbsp:_
" set end of line as return character
set listchars+=eol:¬
" ########## INVISIBLES ##########

" ########## DISPLAY ##########
" Enable line numbers
set number
" Enable cursorline
set cursorline
" Switch from block-cursor to vertical-line-cursor when going into/out of
" Change the shape of the cursor according to the current mode.
" Only works in iTerm with or without tmux.
" See http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
if !empty($TMUX)
  " Inside a tmux session.
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  " Not inside a tmux session.
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Color the column when you reach 80 characters
" http://stackoverflow.com/a/3765575/1536779
set colorcolumn=80
" change the terminal's title
set title
" Set up :terminal display size
set termwinsize=12x0
" Enable mouse drag on window splits
set mouse=a
" Always split below
set splitbelow
" ########## DISPLAY: END ##########

" ########## FORMATTING ##########
" http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
" Note that this may lead to a bunch of screen lines being taken up by only a
" single "real" line, so commands like j and k which move on real lines will
" skip over a lot of screen lines. You can use gj and gk to move by screen
" lines.
set wrap
set linebreak
set textwidth=0
set wrapmargin=0
" When wrapping paragraphs, don't end lines with 1-letter words (looks stupid)
set formatoptions+=1
" don't start new lines w/ comment leader on pressing 'o'
set formatoptions-=o
" Wrap lines at 80 characters
" set textwidth=80
" ########## FORMATTING: END ##########

" Start scrolling three lines before the horizontal window border
" set scrolloff=3
" Keep scrolling in the middle of the window
set scrolloff=999

" ########## STATUS LINE ##########
if has("cmdline_info")
	" Show the cursor line and column number
	set ruler
	" Show partial commands in status line
	set showcmd
	" Show whether in insert or replace mode
	set showmode
endif

if has('statusline')
	" Always show status line even if there is only 1 window
	set laststatus=2
	" Filename
	set statusline=%<%f
	" Options
	set statusline+=%w%h%m%r
	" Current dir
	set statusline+=\ [%{getcwd()}]
	" Right aligned file nav info
	set statusline+=%=%-14.(%l,%c%V%)\ %p%%
	" use a status bar that is 2 rows high
	" set cmdheight=2
endif
" ########## STATUS LINE: END ##########
