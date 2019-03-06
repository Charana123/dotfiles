" ========== vim-airline ====================================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = 'b%s-'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" ========== deoplete =======================================
let g:deoplete#enable_at_startup = 1


" ========== neomake ========================================
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 1000)
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_c_enabled_makers = ['clang']
let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_typescript_enabled_makers = ['tsc']
let g:neomake_rst_enabled_makers = ['rstlint']
let g:neomake_html_enabled_makers = ['tidy']
let g:neomake_css_enabled_makers = ['csslint']

" =========== vim-signify ===================================
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_delete = '-'
highlight clear SignColumn
" highlight SignColumn ctermbg=Black
highlight DiffAdd           cterm=bold ctermbg=119 ctermfg=0
highlight DiffDelete        cterm=bold ctermbg=167 ctermfg=0
highlight DiffChange        cterm=bold ctermbg=227 ctermfg=0

" =========== Ultisnips ======================================
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" =========== ctrlp =========================================
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" =========== JavaImp =======================================
let jre = system("/usr/libexec/java_home")
let g:JavaImpPaths =
    \ "/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/" . "jre/lib"
    \ "," . $HOME . "/.m2/repository"
let g:JavaImpDataDir = $HOME . "/vim/JavaImp"
" command! JCDict execute "!cat " . g:JavaImpDataDir . "/JavaImp.txt | sed 's/ .*//' > " . g:JavaImpDataDir . "/JCDict.txt"
" exe "set dict=" . g:JavaImpDataDir . "/JCDict.txt"
let g:JavaImpDocPaths =
    \ $HOME . "/.m2/repository"
    \ . ",/Users/charana/.m2/repository/com/google/code/gson/gson/2.2.4/gson-2.2.4-javadoc"
    \ . ",/Users/charana/Downloads/docs/api"
let g:JavaImpDocViewer = "w3m"

