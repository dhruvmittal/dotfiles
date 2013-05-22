"Let F1 and F2 deal with numbers - F2 toggles regular numbering, F1 toggles relative numbering. Relative numbering overall is more useful, which is why it's first. We'll also make it the default behavior, at least until I get used to it.
function! ToggleNumbers()
	set invnumber "set line numbering
endfunction
function! ToggleRelNumbers()
	set invrelativenumber
endfunction

set relativenumber

nnoremap <F2> :call ToggleNumbers()<CR>
inoremap <F2> <esc>:call ToggleNumbers()<CR>a
vnoremap <F2> <esc>:call ToggleNumbers()<CR>
nnoremap <F1> :call ToggleRelNumbers()<CR>
inoremap <F1> <esc>:call ToggleRelNumbers()<CR>a
vnoremap <F1> <esc>:call ToggleRelNumbers()<CR>

set hlsearch

set gfn=Inconsolata\ for\ Powerline\ Medium\ 13
nnoremap yy yy"+yy
vnoremap y ygv"+y
noremap gp "+p
set mouse=a

set background=dark 
"color mango
"colorscheme darkburn
colorscheme zenburn
syntax on
set t_Co=256
set nocompatible
filetype off

"Setup Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"Set up pathogen and infect
call pathogen#infect()
"let Vundle manage Vundle (required)
Bundle 'gmarik/vundle'
"My Bundles here:
Bundle 'Valloric/YouCompleteMe'
"Bundle 'jcf/vim-latex' DON'T NEED THIS FOR FACEBOOK, probably. RE-ENABLE FOR PHYSICS
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
"let g:autoclose = 1
"let b:loaded_tex_autoclose = 1


"Settings for powerline
set laststatus=2 "Always show the statusline
set encoding=utf-8 "Necessary to show Unicode glyphs
set t_Co=256
let g:Powerline_symbols = 'fancy'

"exclude mp3 files from command t or control P
set wildignore+=*.mp3,*.m4a,*.png,*.mkv,*.wmv,*.mp4,*.avi,*.docx,*.jpg,*.cbr,*.cbz,*.mx,*.rtf,*.pdf,*.ogg,*.wma,*.gif,*.m3u,*.jpg,*.JPEG,*.JPG,*.jpeg,*.MP3,*m4p,*.part,*.iso,*.tar,*.zip,*.nfo,*.pls,*.sfv,*.apk,*.class,*.odt,*.ods,*.odp,*.doc,*.docx,


"remap leader to comma
let mapleader = ","
nnoremap <Leader>w :w<Cr>
nnoremap <Leader>q :q<Cr>
nnoremap <Leader>wq :wq<Cr>

" Splits and Split Manipulations
set splitbelow
set splitright
nnoremap <C-w>t <C-w>T
nnoremap <C-w>c :call Tabmerge()<Cr>


"control tab through splits
nnoremap <C-tab> <C-w>w
nnoremap<C-S-tab> <C-w>W
"make :Q quit
command! Q q 


"Disable that stupid fucking beeping everytime you try to go past the end of a line
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=


