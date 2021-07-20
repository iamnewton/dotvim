" http://stackoverflow.com/a/6821698/1536779
if has("autocmd")
	" http://stackoverflow.com/a/23121220/438329
	" commenting these 3 out as the article above makes a good point
	" against it
	" startup with tagbar window shown
	" autocmd VimEnter * TagbarToggle
	" startup with nerdtree window shown
	" autocmd VimEnter * NERDTreeToggle
	" startup in the correct window
	" autocmd VimEnter * wincmd l

	" Save files when ViM loses focus
	autocmd FocusLost * :wa

	" Restore cursor position upon reopening files {{{
	" commenting out because I need to exclude certain file types
	" See http://askubuntu.com/questions/202075/how-do-i-get-vim-to-remember-the-line-i-was-on-when-i-reopen-a-file
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
	"
	" http://thejakeharding.com/tutorial/2012/06/13/using-spell-check-in-vim.html
	" Set spellfile to location that is guaranteed to exist, can be symlinked to
	" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using
	" rcm.
	set spelllang=en
	set spellfile="$HOME/.dotvim/opt/spell-en.utf-8.add"

	" Enable spell checking
	autocmd FileType markdown,gitcommit setlocal spell

	" Git Commits
	" Automatically wrap at 72 characters and spell check git commit messages
	autocmd FileType gitcommit setlocal textwidth=72
endif

" hide the launch screen
set shortmess+=I
" trying to start up the terminal on ViM start up
" and select the other window
" autocmd VimEnter * terminal
