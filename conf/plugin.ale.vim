" disable all LSP features in ALE, so ALE doesn't try to provide LSP features 
" already provided by coc.nvim, such as auto-completion
let g:ale_disable_lsp = 1
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
" Fix files with prettier, and then ESLint.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\}
