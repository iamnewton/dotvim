" Enforce UTF 8 for the vim-devicons to work
set encoding=UTF-8

" If using gvim, (https://vim.fandom.com/wiki/Setting_the_font_in_the_GUI)
" them detect if this setting is there and set the font accordingly
" otherwise this is likely not needed for console ViM as that is determined by
" the terminal emulator (e.g. iTerm)
if has ("guifont")
	set guifont=InputMonoCondensed\ Nerd\ Font\ 16
endif

" set the color scheme to Seti UI
set background=dark
silent! colorscheme seti

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has("termguicolors") && $TERM_PROGRAM ==# 'iTerm.app')
  set termguicolors
endif

" How many columns of whitespace is a \t is worth
set tabstop=4
" How many columns of whitespace is a 'level of indentation' is worth
set shiftwidth=4
" Tabs over spaces
set noexpandtab
" Enable line numbers
set number

" trying to start up the terminal on ViM start up
" and select the other window
" autocmd VimEnter * terminal

" Set up :terminal display size
set termwinsize=12x0   

" Enable mouse drag on window splits
set mouse=a            
" Always split below
set splitbelow         
