" .vimrc

" Set a variable to the dotvim directory
let dotvimdir = "$HOME/.dotvim"
" Add the dotvim directory variable to the runtimepath option
" Using an ampersand in front of a name tells Vim that you're
" referring to the option, not a variable that happens to have the same name
" '.' is string concatenation
" '.=' is string concatenation and assignment
let &runtimepath .= "," . dotvimdir

runtime conf/startup.vim
runtime conf/settings.vim
runtime conf/plugins.vim " plugin management (e.g. vim-plug)
runtime conf/editing.vim " search, replace, find
runtime conf/ui.vim " colors, fonts, layout, which windows open, etc.

" ########## SHORTCUTS ##########
runtime conf/shortcuts/abbreviations.vim
runtime conf/shortcuts/keyboard.vim " all keyboard mappings, including plugins
" ########## SHORTCUTS: END ##########

" ########## PLUGINS ##########
runtime conf/plugins/ale.vim
runtime conf/plugins/coc.vim
runtime conf/plugins/denite.vim
runtime conf/plugins/devicons.vim
runtime conf/plugins/editorconfig.vim
runtime conf/plugins/nerdtree.vim
runtime conf/plugins/prettier.vim
runtime conf/plugins/unicycle.vim
" ########## PLUGINS: END ##########
