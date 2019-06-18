" Auto-install vim-plug if it doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  " Shortcuts for commenting lines
  Plug 'tpope/vim-commentary'

  " Fuzzy finder
  Plug '/usr/local/opt/fzf'
call plug#end()

" Use syntax highlighting
syntax on

" Show line numbers in gutter
set number

" Use 2 space indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Show position of cursor in bottom right
set ruler

" Use previous line indentation when starting new line
set autoindent

" Remove netrw banner
let g:netrw_banner = 0

" Hide files instead of closing when navigating away with unsaved changes
set hidden

function! <SID>TrimWhitespaces()
  let _cursor_position = getpos(".")

  " Trim trailing whitespace on every line
  :silent! %s/\s\+$//e
  " Trim blank lines at end of file
  :silent! %s#\($\n\s*\)\+\%$##

  call setpos(".", _cursor_position)
endfunction

" Automatically remove trailing whitespace on write for any file type (*)
autocmd BufWritePre * :call <SID>TrimWhitespaces()
