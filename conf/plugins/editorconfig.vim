" To ensure that this plugin works well with Tim Pope's fugitive, use the following patterns array:
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
" You can disable this plugin for a specific buffer by setting
" b:EditorConfig_disable. Therefore, you can disable the plugin for all
" buffers of a specific filetype. For example, to disable EditorConfig for all
" git commit messages (filetype gitcommit):
autocmd FileType gitcommit let b:EditorConfig_disable = 1
