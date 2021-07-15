" ########## NERDTREE ##########
" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
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

" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']
" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1
" show all hidden files in NERDTree
let g:NERDTreeShowHidden = 1
" remove the directory arrows
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

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
" this seems to mess up the status icons
" let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  :'✹',
    \ 'Staged'    :'✚',
    \ 'Untracked' :'✭',
    \ 'Renamed'   :'➜',
    \ 'Unmerged'  :'═',
    \ 'Deleted'   :'✖',
    \ 'Dirty'     :'✗',
    \ 'Ignored'   :'☒',
    \ 'Clean'     :'✔︎',
    \ 'Unknown'   :'?',
\ }
" ########## END: NERDTREE GIT PLUGIN ##########
