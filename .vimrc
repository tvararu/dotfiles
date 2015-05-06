" Be iMproved.
set nocompatible
" Required for Vundle.
filetype off

" Set <Space> as the <leader> key, for subsequent binds.
let mapleader = "\<Space>"

" Vundle stuff is in a separate file to keep this at a sane length.
source $HOME/.vimrc.vundle

" Use the vim-irblack colorscheme, a Vundle plugin.
colorscheme ir_black

" Syntax highlighting, OS X native clipboard, line numbers, and indentation.
syntax on
set clipboard=unnamed
set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" However, `make` uses real tabs.
autocmd filetype make set noexpandtab

" The only encoding.
set encoding=utf8

" Incremental/better searching.
set hlsearch
set incsearch
set smartcase

" Make vim wait less time for <Esc> codes.
set ttimeoutlen=10

" No save backup by .sw*.
set nowritebackup
set noswapfile
" No autoread changes if performed by other file editors.
set noautoread

" Don't unload buffers when switching (preserves undo history).
set hidden

" Ensure 5 lines of context always visible about cursor
set scrolloff=5

" Allows you to use `gf` inside `require` statements to jump directly to files.
autocmd filetype stylus setl suffixesadd=.styl
autocmd filetype javascript setl suffixesadd=.coffee,.litcoffee,.cjsx,.js,.json,.jsx
autocmd filetype coffee setl suffixesadd=.coffee,.litcoffee,.cjsx,.js,.json,.jsx

" Thorfile, Rakefile, Vagrantfile and Gemfile are `.rb`.
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru,Guardfile} set ft=ruby
" JSON is basically `.js`.
au BufRead,BufNewFile *.json set ft=javascript

" Double space maps to clear highlights.
nnoremap <leader><space> :noh<cr>
" Maximize current pane
nnoremap <C-w>a <C-w>\|<C-w>_
" `cd` to the directory containing the file in the buffer.
nmap <silent> <leader>cd :lcd %:h<CR>
" `mkdir` the folder for the current buffer.
nmap <silent> <leader>md :!mkdir -p %:h<CR><CR>
" Map the arrow keys to be based on display lines, not physical lines.
map <Down> gj
map <Up> gk

autocmd BufWritePre * :%s/\s\+$//e

