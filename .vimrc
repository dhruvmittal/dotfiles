set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after,/usr/share/vim/vimfiles
set hlsearch

function! ToggleNumbers()
	set invnumber "set line numbering
endfunction
function! ToggleRelNumbers()
	set invrelativenumber
endfunction

set number
set relativenumber

nnoremap <F2> :call ToggleNumbers()<CR>
inoremap <F2> <esc>:call ToggleNumbers()<CR>a
vnoremap <F2> <esc>:call ToggleNumbers()<CR>
nnoremap <F1> :call ToggleRelNumbers()<CR>
inoremap <F1> <esc>:call ToggleRelNumbers()<CR>a
vnoremap <F1> <esc>:call ToggleRelNumbers()<CR>

set gfn=Source\ code\ pro\ for\ Powerline\ 11
nnoremap yy yy"+yy
vnoremap y ygv"+y
noremap gp "+p

set mouse=a


set background=dark
colorscheme badwolf
syntax on
set t_Co=256
set nocompatible

execute pathogen#infect()


set splitbelow
set splitright

"Disable that stupid fucking beeping everytime you try to go past the end of a line
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"settings for powerline
set laststatus=2
set encoding=utf-8
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1

"remap leader to comma
"let mapleader = ","
let mapleader = "\<Space>"
nnoremap <Leader>w :w<Cr>
nnoremap <Leader>q :q<Cr>
nnoremap <Leader>wq :wq<Cr>
nnoremap <Leader>x :noh<Cr>
"inoremap <Leader>x :noh<Cr>

"Youcompleteme options
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0

set timeoutlen=2000 ttimeoutlen=0

filetype plugin on
let g:Tex_Folding=0 
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:autoclose = 1
"let b:loaded_tex_autoclose = 1


set smartindent
