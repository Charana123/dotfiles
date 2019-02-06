" ====== Terminal Configuration ================================================
if has('nvim')
	" <Esc> exists Terminal Mode
	tnoremap <Esc> <C-\><C-n>
	" Open terminal in new tab
	nnoremap <silent> <leader>tn :tabnew<CR>:terminal<CR>
	" Open terminal in vertical split
	nnoremap <silent> <leader>tv :vnew<CR>:terminal<CR>
endif
if !has('nvim') && has('terminal')
	nnoremap <silent> <leader>tn :tab terminal<CR>
	nnoremap <silent> <leader>tv :vert terminal<CR>
endif

" ========= Swap Lines =========================================================
" http://vimdoc.sourceforge.net/htmldoc/intro.html#keycodes
function! s:swap_lines(n1, n2)
	let line1 = getline(a:n1)
	let line2 = getline(a:n2)
	call setline(a:n1, line2)
	call setline(a:n2, line1)
endfunction

function! s:swap_up()
	let n = line('.')
	if n == 1
		return
	endif

	call s:swap_lines(n, n - 1)
	exec n - 1
endfunction

function! s:swap_down()
	let n = line('.')
	if n == line('$')
			return
	endif

	call s:swap_lines(n, n + 1)
	exec n + 1
endfunction

nnoremap <silent> <C-k> :call <SID>swap_up()<CR>
nnoremap <silent> <C-j> :call <SID>swap_down()<CR>

" ========== Search Options ======================================================
" Cursor to start of next match
nnoremap n //<CR>
" Cursor to end of next match
nnoremap m //e<CR>
" Remove highlight for current matches
nnoremap <esc><esc> :silent! nohlsearch<cr>

" ========== Clipboard and Copy/Paste Options ====================================
" maps all delete operations to the black hole register
nnoremap d "_d
vnoremap d "_d

" unify system and vim clipboards
if has('clipboard')
	" yank and cut to system clipboard
	nnoremap y "*y
	vnoremap y "*y
	vnoremap x "*x
	" paste from system clipboard
	nnoremap p "*p
	vnoremap p "*p
endif

" ========== Indentation ==========================================================
" maps tab to indent right
inoremap <Tab> <C-t>
" maps shift+tab to indent left
inoremap <S-Tab> <C-d>

" ========== Tab Options ==========================================================
" toggle previous active tab
" au TabLeave * let g:lasttab = tabpagenr()
" nnoremap <silent> '' :exe "tabn ".g:lasttab<cr>

" Close tabs to the right
function! TabCloseRight(bang)
    let cur=tabpagenr()
    while cur < tabpagenr('$')
        exe 'tabclose' . a:bang . ' ' . (cur + 1)
    endwhile
endfunction

command! -bang TabCloseRight call TabCloseRight('<bang>')

" Quick save/quit mappings
inoremap <C-s> <esc>:w<cr>                 " save files
nnoremap <C-s> :w<cr>
inoremap <C-d> <esc>:wq<cr>               " save and exit
nnoremap <C-d> :wq<cr>
inoremap <C-q> <esc>:qa!<cr>               " quit discarding changes
nnoremap <C-q> :qa!<cr>

" Commentary - Quick comment with CTRL-C
nmap <C-c> gcc
vmap <C-c> gc

" Tab navigation
nnoremap { :tabprevious<CR>
nnoremap } :tabnext<CR>







