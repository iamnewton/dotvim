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
