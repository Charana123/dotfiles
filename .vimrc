set number

set tabstop=4
set shiftwidth=4
set expandtab

set backspace=indent,eol,start

" map dd to the black hole register https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
nnoremap d "_d
vnoremap d "_d

set incsearch
set hlsearch
nnoremap <esc><esc> :silent! nohls<cr>

" maps tab to shift right
inoremap <Tab> <C-t>
" maps shift+tab to shift left
inoremap <S-Tab> <C-d>

if has('clipboard')
    " maps yank and cut to system clipboard
    vnoremap y "*y
    vnoremap x "*x
    " maps paste to system clipboard
    nnoremap p "*p
endif

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.py set textwidth=79 " break lines when line length increases
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

" make backspaces more powerfull
set backspace=indent,eol,start

set ruler                           " show line and column number
syntax on               " syntax highlighting
set showcmd             " show (partial) command in status line



" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      exec 'vert res 40'
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

" Vim 7.3 persistent undo
if has('persistent_undo')
    let myundodir = '$HOME/.vim/undodir/'
    silent call system('mkdir -p ' . myundodir)
    let &undodir = expand(myundodir)          " where to save undo histories
    set undofile                   " Save undos after file closes
    set undolevels=1000            " How many undos
    set undoreload=10000           " number of lines to save for undo
endif

" enable netrw line numbers
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" highlights/un-highlights all instances of current word on Enter
let g:highlighting = 0
function! Highlighting()
  if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    let g:highlighting = 0
    return ":silent nohlsearch\<CR>"
  endif
  let @/ = '\<'.expand('<cword>').'\>'
  let g:highlighting = 1
  return ":silent set hlsearch\<CR>"
endfunction
nnoremap <silent> <expr> <CR> Highlighting()

" modifies the tabline to show only tab-number, filename and modified indicator symbol (+)
function! Tabline()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")

    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tab .':'
    let s .= (bufname != '' ? '['. fnamemodify(bufname, ':t') . '] ' : '[No Name] ')

    if bufmodified
      let s .= '[+] '
    endif
  endfor

  let s .= '%#TabLineFill#'
  if (exists("g:tablineclosebutton"))
    let s .= '%=%999XX'
  endif
  return s
endfunction
set tabline=%!Tabline()


" toggle previous active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> '' :exe "tabn ".g:lasttab<cr>
" vnoremap <silent> '' :exe "tabn ".g:lasttab<cr>

" resize current buffer
nnoremap + 10<C-w>> 
nnoremap - 10<C-w><

