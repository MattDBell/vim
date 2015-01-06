set nocompatible

filetype off
set ffs=unix,dos

if has('win32')
set rtp+=~/vimfiles/bundle/Vundle.vim
let path='~/vimfiles/bundle'
else
set rtp+=~/.vim/bundle/Vundle.vim
let path='~/.vim/bundle'
endif

call vundle#begin(path)

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

map <Left> <nop>
map <Right> <nop>
map <Up> <nop>
map <Down> <nop>
imap <esc> <nop>

augroup filetype_cpp
  autocmd!
  autocmd filetype cpp :set number
augroup END  
augroup filetype_vim
  autocmd!
  autocmd filetype vim :set number
augroup END  

function! GetOtherFilePath()
  let l:filePath = expand('%')
  " echom l:filePath
  let l:extensionSplit = split( l:filePath, '\.')
  " echom join(extensionSplit, '---')
  if ( len(l:extensionSplit) > 0 ) " we have an extension

    let l:extension = l:extensionSplit[-1]
    let l:desiredExtension = 'h'

    if l:extension ==# 'h'
      let l:desiredExtension = 'cpp'
    endif

    " echom l:desiredExtension

    let l:oldDirectory = 'src'
    let l:directory = 'include'

    if l:extension ==# 'h'
      let l:directory = 'src'
      let l:oldDirectory = 'include'
    endif

    " echom l:oldDirectory
    " echom l:directory
    
    let l:newPath = substitute(l:filePath, l:oldDirectory,
	  \ l:directory, '')

    " echom len(l:newPath)
    " echom len(l:extension)

    let l:newPath = l:newPath[0:len(l:newPath) - len(l:extension) - 1] .
	  \ l:desiredExtension
    
    " echom l:newPath
    return l:newPath
  endif
endfunction

nnoremap <Leader>th :execute ':edit ' . GetOtherFilePath()<cr><cr>
nnoremap <Leader>oh :execute ':vsp ' . GetOtherFilePath()<cr><cr>
nnoremap <Leader>al O<esc>

