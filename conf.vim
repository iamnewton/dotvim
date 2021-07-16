" .vimrc

" Set a variable to the dotvim directory
let dotvimdir = "$HOME/.dotvim"
" Add the dotvim directory variable to the runtimepath option
" Using an ampersand in front of a name tells Vim that you're 
" referring to the option, not a variable that happens to have the same name
" '.' is string concatenation
" '.=' is string concatenation and assignment
let &runtimepath .= "," . dotvimdir

runtime conf/general.vim 
runtime conf/plugins.vim " plugin management (e.g. vim-plug)
runtime conf/key-mappings.vim " all keyboard mappings, including plugins
runtime conf/search.vim " search, replace, find
runtime conf/ui.vim " colors, fonts, layout, which windows open, etc.

" ########## PLUGINS ##########
runtime conf/plugin.denite.vim
runtime conf/plugin.nerdtree.vim
runtime conf/plugin.coc.vim
runtime conf/plugin.devicons.vim 
" ########## PLUGINS: END ##########
