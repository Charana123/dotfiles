set ruler                           " show line and column number
syntax on               " syntax highlighting
set showcmd             " show (partial) command in status line
set number
" make backspaces more powerfull
set backspace=indent,eol,start
" mapping delay and key code delay
set timeoutlen=1000 ttimeoutlen=0

au FocusGained,BufEnter * :checktime " autoload when file changes outside of vim
" ====== Indentation Options ==========================================
set tabstop=4     " A tab counts for 2 columns
set softtabstop=4 " Tab in insert mode adds 2 columns
set shiftwidth=4  " Indentation operations, indent by 2 columns
set shiftround    " Round indentation operations (<C-T> and <C-D> in insert mode and `>>` and `<<` in normal mode) to the nearest tab
set expandtab     " Replace tab with spaces
set autoindent    " copy indent from current line when starting a new line
if has('smartindent')
	set smartindent   " indent according to syntactic conventions
endif
if has('cindent')
	set cindent " Indentation according to C-style syntax
endif

" ====== neovim or +terminal ====================================================
if has('nvim') || has('terminal')
	" Automatically enter inside mode when opening terminal
	autocmd TermOpen term://* startinsert
endif
" ====== +virtualedit ==================================================
" Useful for selecting block regions in Visual block mode <C-v>
" if has('virtualedit')
" 	set virtualedit=all
" endif

" ====== netrw ========================================================
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro' " enable netrw line numbers
let g:netrw_banner=0																		 " disable annoying banner
let g:netrw_browse_split=4															 " open in prior window
let g:netrw_altv=1																			 " open splits to the right
let g:netrw_liststyle=3																	 " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" ====== +persistent_undo ==============================================
" if has('persistent_undo')
"     let myundodir = '$HOME/.vim/undodir/'
"     silent call system('mkdir -p ' . myundodir)
"     let &undodir = expand(myundodir)          " where to save undo histories
"     set undofile                   " Save undos after file closes
"     set undolevels=1000            " How many undos
"     set undoreload=10000           " number of lines to save for undo
" endif

" ====== +extra_search ==================================================
if has('extra_search')
	set incsearch
	set hlsearch
endif

" ====== File specific configuration ====================================
"if exists('+colorcolumn')
"  au BufRead,BufNewFile *.py set colorcolumn=80
"endif
"au BufRead,BufNewFile *.py set textwidth=79 " break lines when line length increases

" ====== Whitespace ======================================================
" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" ======= Spell Checking =================================================
if expand('%:p:h:t') != 'doc'
	autocmd BufNewFile,BufRead *.txt  set spell spelllang=en_gb
endif
autocmd BufNewFile,BufRead *.tex  set spell spelllang=en_gb
autocmd BufNewFile,BufRead *.rst  set spell spelllang=en_gb
autocmd BufNewFile,BufRead *.yaml set spell spelllang=en_gb
autocmd BufNewFile,BufRead *.html set spell spelllang=en_gb
autocmd BufNewFile,BufRead *.md   set spell spelllang=en_gb

" ======= File Finding ===================================================
" Provides tab completion for :find/:tabf or :b/:bf commands
set path+=**
" Displays all matching files
set wildmenu
set wildmode=longest:full,full

" ======= indow Options =================================================
" Vertical splitting places new window to the right
set splitright

" ======= Custom =========================================================
" Parse any edited rst to html on buffer write
au BufWritePost *.rst call system('rst2html.py ' . shellescape(@%) . ' ' . shellescape(expand('%:r')) . '.html')
" Tag jumping
command! MakeTags !ctags -R .

command! DeleteSwaps !rm ~/.local/share/nvim/swap/*





