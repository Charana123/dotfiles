" ======== Be iMproved ================================
if &compatible
  set nocompatible
endif

" ======== Neovim ======================================
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" ======== Neovim Plugins ==============================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" vim-airline (status and tab lines)
Plugin 'vim-airline/vim-airline'

" deoplete (Async AutoCompletion)
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" deoplete-jedi (python autocompletion)
" Plugin 'zchee/deoplete-jedi'

" denite
" Plugin 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

" neomake (Async syntax checker and linter)
Plugin 'neomake/neomake'

" indentLine (Display Indentation)
Plugin 'Yggdroot/indentLine'

" vim-signify (Git Diff)
" Plugin 'mhinz/vim-signify'

" ultisnips (Template Snippet Engine)
Plugin 'SirVer/ultisnips'

" vim-snippets (Snippet Collection)
Plugin 'honza/vim-snippets'

" typescript-vim (typescript syntax highlighting)
Plugin 'leafgarland/typescript-vim'

" vim-cpp-enhanced-highlight (c++ syntax highlighting)
Plugin 'octol/vim-cpp-enhanced-highlight'

" clang_complete (c++ autocompletion)
" Plugin 'rip-rip/clang_complete'

" vim-surround
Plugin 'tpope/vim-surround'

" vim-repeat (repeat commands of other plugin including vim-surround)
Plugin 'tpope/vim-repeat'

" commentary
Plugin 'tpope/vim-commentary'

" NerdTree
" Plugin 'scrooloose/nerdtree'

" ctrlp
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()            " required

" ======== Modify configuration =========================
source ~/base.vim
source ~/mappings.vim
source ~/plugins.vim








