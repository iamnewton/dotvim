" ########## COC.NVIM ##########
let g:coc_global_extensions = [ 'coc-css', 'coc-git', 'coc-highlight', 'coc-html', 'coc-json', 'coc-sh', 'coc-svg', 'coc-tsserver', 'coc-yaml' ]
" ########## END: COC.NVIM ##########

" ########## COC-HIGHLIGHT ##########
" enable highlight current symbol on CursorHold,
" not seeing the effects to this at this moment
autocmd CursorHold * silent call CocActionAsync('highlight')
" ########## END: COC-HIGHLIGHT ##########
