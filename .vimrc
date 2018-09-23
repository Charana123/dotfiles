" Setup Vundle plugins (optionally on local machine)
if has('macunix')
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    " vim-airline (status and tab lines)
    Plugin 'vim-airline/vim-airline'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#tab_nr_type = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#tabline#buffer_nr_format = 'b%s-'
    let g:airline#extensions#tabline#formatter = 'unique_tail'

    " YouCompleteMe (Auto Completion)
    " Plugin 'Valloric/YouCompleteMe'

    " deoplete (Async AutoCompletion)
    if has('nvim')
        Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plugin 'Shougo/deoplete.nvim'
        Plugin 'roxma/nvim-yarp'
        Plugin 'roxma/vim-hug-neovim-rpc'
    endif
    let g:deoplete#enable_at_startup = 1

    " deoplete-jedi (python autocompletion)
    " Plugin 'zchee/deoplete-jedi'

    " indentLine (Display Indentation)
    Plugin 'Yggdroot/indentLine'

    " Fugitive (Git Integration)
    Plugin 'tpope/vim-fugitive'

    " Signify (Git Diff)
    Plugin 'mhinz/vim-signify'
    let g:signify_vcs_list = [ 'git' ]
    let g:signify_sign_delete = '-'
    highlight clear SignColumn
    " highlight SignColumn ctermbg=Black
    highlight DiffAdd           cterm=bold ctermbg=119 ctermfg=0
    highlight DiffDelete        cterm=bold ctermbg=167 ctermfg=0
    highlight DiffChange        cterm=bold ctermbg=227 ctermfg=0

    " Utlisnips (Template Snippet Engine)
    Plugin 'SirVer/ultisnips'
    " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<C-l>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

    " Vim Snippets (Snippet Collection)
    Plugin 'honza/vim-snippets'

    " ==== SYNTAX HIGHLIGHTING ====
    " Typscript syntax
    Plugin 'leafgarland/typescript-vim'

    call vundle#end()            " required
endif

set number
" Toggle relative line number
" nmap <C-L> :set invrelativenumber<CR>

set tabstop=4
set shiftwidth=4
set expandtab

set backspace=indent,eol,start

" maps all delete operations to the black hole register https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
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
    " yank and cut to system clipboard
    nnoremap y "*y
    vnoremap y "*y
    vnoremap x "*x
    " paste from system clipboard
    nnoremap p "*p
    vnoremap p "*p
endif

" configure expanding of tabs for various file types
if exists('+colorcolumn')
  au BufRead,BufNewFile *.py set colorcolumn=80
endif
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
" if has('persistent_undo')
"     let myundodir = '$HOME/.vim/undodir/'
"     silent call system('mkdir -p ' . myundodir)
"     let &undodir = expand(myundodir)          " where to save undo histories
"     set undofile                   " Save undos after file closes
"     set undolevels=1000            " How many undos
"     set undoreload=10000           " number of lines to save for undo
" endif

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
  A
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

" Finding Files
" Provides tab completion for :find/:tabf or :b/:bf commands
set path+=**
" Displays all matching files
set wildmenu
set wildmode=longest:full,full

" Tag jumping
command! MakeTags !ctags -R .

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" netrw configuration
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

nnoremap m //e<CR>
nnoremap n //<CR>

cabbrev help tab help


"Spell Checking
autocmd BufNewFile,BufRead *.txt set spell spelllang=en_gb
autocmd BufNewFile,BufRead *.tex set spell spelllang=en_gb
autocmd BufNewFile,BufRead *.rst set spell spelllang=en_gb
autocmd BufNewFile,BufRead *.yaml set spell spelllang=en_gb
autocmd BufNewFile,BufRead *.html set spell spelllang=en_gb
autocmd BufNewFile,BufRead *.md set spell spelllang=en_gb

"word wrap 80 chars for md files
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.tex setlocal textwidth=80

" http://vimdoc.sourceforge.net/htmldoc/intro.html#keycodes
" Swapping line up or down
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

" Causes buffer to stutter
" nnoremap <silent> <C-k> yyddkP
" nnoremap <silent> <C-j> yyddp

" mapping delay and key code delay
set timeoutlen=1000 ttimeoutlen=0

" Parse any edited rst to html
au BufWritePost *.rst call system('rst2html.py ' . shellescape(@%) . ' ' . shellescape(expand('%:r')) . '.html')





