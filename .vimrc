set nocompatible

filetype off
set ffs=unix,dos

execute ( 'set rtp+=' . expand('<sfile>:h:p') . '/.vim/bundle/Vundle.vim')
execute ( 'let vundlepath=' . '''' . expand('<sfile>:h:p') . '/.vim/bundle''' )

call vundle#begin(vundlepath)

Plugin 'gmarik/Vundle.vim'

call vundle#end()

filetype plugin indent on
set softtabstop=2
set shiftwidth=2
set tabstop=2
syntax on

inoremap jk <esc>
let mapleader = ","
nnoremap <Leader>ev :vsp $MYVIMRC<cr>
nnoremap <Leader>evv :edit $MYVIMRC<cr>
nnoremap <Leader>sv :source $MYVIMRC<cr>
nnoremap <Leader>r <c-v>

map <Left> <nop>
map <Right> <nop>
map <Up> <nop>
map <Down> <nop>
imap <esc> <nop>

function! CheckFileOpen( )
	let l:filePath = expand("<afile>:p")
	if ( getbufvar(l:filePath, "&mod") == 1)
		echoh WarningMsg
		echom "Sourcing modified file " . l:filePath
		echoh None
	endif
endfunction

augroup filetype_cpp
  autocmd!
  autocmd filetype cpp :set number
	autocmd filetype cpp :set colorcolumn=110
	autocmd filetype cpp :highlight ColorColumn ctermbg=darkgrey
augroup END  
augroup filetype_vim
  autocmd!
  autocmd filetype vim :set number
augroup END  
augroup onSource
	autocmd!
	autocmd sourcepre * :call CheckFileOpen()
augroup END

nnoremap <Leader>al O<esc>

set exrc
set secure
