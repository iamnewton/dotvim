" enable rainbow parens for everything
let g:rainbow_active = 1
" configure the colors per language
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'markdown': {
\			'parentheses_options': 'containedin=markdownCode contained', "enable rainbow for code blocks only
\		},
\		'vim': {
\			'parentheses_options': 'containedin=vimFuncBody', "enable rainbow inside vim function body
\		},
\		'css': 0, "disable this plugin for css files
\	}
\}
