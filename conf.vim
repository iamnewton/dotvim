" Automatically install ViM Plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" ########## Example .vimrc ##########
"
" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'
" ########## End: Example .vimrc ##########

" Seti UI color scheme
Plug 'trusktr/seti.vim'

" Syntax highlighter language pack
" Chosen because of its completeness for including most languages and it loads
" on demand, rather than on runtime
Plug 'sheerun/vim-polyglot'

" File system explorer
" Chosen over `netrw` because of the varous plugins to customize the side bar
" and there don't appear to be any good alternatives that are a bit more
" lightweight
Plug 'preservim/nerdtree'
" Adds syntax highlighting to NERDTree based on filetype; visually matches the
" colors of the vim-devicons to the file type
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Autocomplete with VSCode extension ecosystem
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Git wrapper
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Adds icons to plugins, e.g. NERDTree
" this has to come last after all supported plugins
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

" vim-plug already includes this
" (https://github.com/junegunn/vim-plug/tree/fc2813ef4484c7a5c080021ceaa6d1f70390d920#usage)
" explanataion: https://vi.stackexchange.com/a/10125
" filetype plugin indent on
 
" vim-plug already includes this
" (https://github.com/junegunn/vim-plug/tree/fc2813ef4484c7a5c080021ceaa6d1f70390d920#usage)
" https://alvinalexander.com/linux/vi-vim-editor-syntax-highlighting/
" syntax on

" ########## DISPLAY ##########
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
set termguicolors

" Enable line numbers
" Adding a ! at the end of this will toggle on each sourcing of the vimrc file
set number
" How many columns of whitespace is a \t is worth
set tabstop=4
" How many columns of whitespace is a 'level of indentation' is worth
set shiftwidth=4
" Tabs over spaces
set noexpandtab

" Set up :terminal display
set termwinsize=12x0   " Set terminal size
set splitbelow         " Always split below
set mouse=a            " Enable mouse drag on window splits
" ########## END: DISPLAY ##########

" ########## SEARCH ##########
" Enable incremental search
set incsearch  
" Enable highlight search
set hlsearch   
" ########## END: SEARCH ##########

" ########## GENERAL ##########
" ########## END: GENERAL ##########

" Set ViM's :terminal to use the login shell as it appears ViM by default sets
" it to use non-interactive shell
" https://stackoverflow.com/a/9092644/1536779
set shell=bash\ -l

" trying to start up the terminal on ViM start up
" and select the other window
" autocmd VimEnter * terminal

" ########## NERDTREE ##########
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror
" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

" show all hidden files in NERDTree
let NERDTreeShowHidden=1
" avoid crashes when calling vim-plug functions while the cursor is on the NERDTree window
let g:plug_window = 'noautocmd vertical topleft new'
" ########## END: NERDTREE ##########

" ########## NERDTREE SYNTAX HIGHLIGHT ##########
" has to be enabled to get file name and icons to match color
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
" ########## END: NERDTREE SYNTAX HIGHLIGHT ##########

" ########## NERDTREE GIT PLUGIN ##########
" ########## END: NERDTREE GIT PLUGIN ##########
"
" ########## COC.NVIM ##########
let g:coc_global_extensions = [ 'coc-css', 'coc-git', 'coc-highlight', 'coc-html', 'coc-json', 'coc-sh', 'coc-svg', 'coc-tsserver', 'coc-yaml' ]
" ########## END: COC.NVIM ##########

" ########## COC-HIGHLIGHT ##########
" enable highlight current symbol on CursorHold,
" not seeing the effects to this at this moment
autocmd CursorHold * silent call CocActionAsync('highlight')
" ########## END: COC-HIGHLIGHT ##########

" ########## KEY MAPPINGS ##########
" Insert date by pressing <F3>
nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" Map ctrl + k|j to move lines of code around
inoremap <C-k> <Esc>:m .-2<CR>==gi
inoremap <C-j> <Esc>:m .+1<CR>==gi
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv

" make coc.nvim format your code on <cr> 
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" use <tab> and <s-tab> to navigate the coc.nvim completion list
" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#use-tab-or-custom-key-for-trigger-completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" ########## END: KEY MAPPINGS ##########
