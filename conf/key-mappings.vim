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

" === Denite shorcuts === "
"   <space>         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and
"   close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
nmap <space> :Denite buffer -split=floating -winrow=1<CR>
nmap <leader>t :Denite file/rec -split=floating -winrow=1<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty -mode=normal<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:. -mode=normal<CR>

" Define mappings while in 'filter' mode
"   <C-o>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
"   <C-t>         - Open currently selected file in a new tab
"   <C-v>         - Open currently selected file a vertical split
"   <C-h>         - Open currently selected file in a horizontal split
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o>
  \ <Plug>(denite_filter_update)
  inoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  inoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  inoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  inoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  inoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction

" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
"   <C-h>       - Open currently selected file in a horizontal split
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-o>
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction
