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

" Color scheme
Plug 'trusktr/seti.vim'

" Syntax highlighter language pack
" Chosen because of its completeness for including most languages and it loads
" on demand, rather than on runtime
Plug 'sheerun/vim-polyglot'

" Fuzzy file finding, file management, project searching
if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

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
Plug 'dense-analysis/ale' " https://github.com/dense-analysis/ale#5iii-how-can-i-use-ale-and-cocnvim-together

" Git
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'tpope/vim-rhubarb' " github wrapper
Plug 'airblade/vim-gitgutter' " shows git diff markers, preview hunks

" Adds icons to plugins, e.g. NERDTree
" this has to come last after all supported plugins
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()
