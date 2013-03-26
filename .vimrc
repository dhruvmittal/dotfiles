syntax on
set t_Co=256
"Set up a way to toggle numbers on and off with F2
function! ToggleNumbers()
	set invnumber "set line numbering
endfunction
nnoremap <F2> :call ToggleNumbers()<CR>
inoremap <F2> <ESC>:call ToggleNumbers()<CR>a
vnoremap <F2> <ESC>:call ToggleNumbers()<CR>
"Let <F3> call CtrlP.vim
:nmap <F3> :CtrlP<CR>

"set guioptions-=m "remove menu bar
"set guioptions-=r "remove right-hand scrollbar
"set guioptions-=e "hide gui tabs
"set guifont=Inconsolata\ for\ Powerline\ Medium\ h11
set gfn=Inconsolata\ for\ Powerline\ Medium\ 13
nnoremap yy yy"+yy
vnoremap y ygv"+y
noremap gp "+p
set mouse=a

syntax on

set background=dark 
color mango

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Set up pathogen and infect
call pathogen#infect()

"let Vundle manage Vundle (required)
Bundle 'gmarik/vundle'

"My Bundles here:
Bundle 'Valloric/YouCompleteMe'
Bundle 'jcf/vim-latex'
Bundle 'kien/ctrlp.vim'

filetype plugin indent on "required

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o "gets rid of the stupid thing where the next line always starts with an extra comment
let g:Tex_Folding=0 

    
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
    
    
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
    

"set rtp+=/home/mittald/.local/bin/powerline/bindings

"Settings for powerline
set laststatus=2 "Always show the statusline
set encoding=utf-8 "Necessary to show Unicode glyphs
set t_Co=256
let g:Powerline_symbols = 'fancy'

