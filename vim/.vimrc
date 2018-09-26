" ======== Be iMproved ================================
if &compatible
  set nocompatible
endif

" ======== Vim Plugins ==============================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" vim-airline (status and tab lines)
Plugin 'vim-airline/vim-airline'

" indentLine (Display Indentation)
Plugin 'Yggdroot/indentLine'

" ultisnips (Template Snippet Engine)
Plugin 'SirVer/ultisnips'

" vim-snippets (Snippet Collection)
Plugin 'honza/vim-snippets'

" typescript-vim (typescript syntax highlighting)
Plugin 'leafgarland/typescript-vim'

call vundle#end()            " required

" ======== Modify configuration =========================
source ~/base.vim
source ~/mappings.vim
source ~/plugins.vim


