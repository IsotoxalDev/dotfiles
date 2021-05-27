"    _____  __________
"   /  _  \ \______   \
"  /  /_\  \  |   |  _/
" /    _    \ |   |   \
" \___/ \_  //______  /
"         \/        \/
"
" ~/.vimrc
"
" Abhinav's dotfile

" Colemak support
noremap u i
noremap l u
noremap f e
noremap n j
noremap e k
noremap i l

" Settings
set list
set hidden
set nu rnu
set ttyfast
set showcmd
set ttimeout
set autoread
set wildmenu
set incsearch
set lazyredraw
set cursorline
set noswapfile
set splitbelow
set splitright
set autoindent
set ignorecase
set nocompatible
set ttimeoutlen=50
set listchars=tab:\|\ "Space needs to be here
set clipboard=unnamedplus
set wildmode=longest:full,full
set completeopt=longest,menuone,preview
set tabstop=4 shiftwidth=4 softtabstop=4

syntax enable
au VimEnter * set formatoptions-=cro

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-eunuch'
Plug 'timonv/vim-cargo'
Plug 'ervandew/supertab'
Plug 'habamax/vim-godot'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/open-pdf.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'chun-yang/auto-pairs'
Plug 'frazrepo/vim-rainbow'
Plug 'vimplugin/project.vim'
Plug 'ryanoasis/vim-devicons'
"Plug 'valloric/youcompleteme'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'arcticicestudio/nord-vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

filetype plugin indent on

" Theme
autocmd vimenter * ++nested colorscheme nord
set bg=dark

" Rainbow parenthesis
let g:rainbow_active = 1

" Nerd commenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCustomDelimiters = {
			\'c': { 'left': '/**', 'right': '*/'}
			\}
let g:NERDCommentEmptyLines = 1

" Make line highlight disappear when window not focused
au VimEnter,WinEnter,BufWinEnter,FocusGained,CmdwinEnter * set cul
au WinLeave,FocusLost,CmdwinLeave * set nocul

" Remove all trailing whitespaces
autocmd! BufWritePre * :%s/\s\+$//e

"DevIcons
let g:WebDevIconsOS = 'Linux'

" NerdTree
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" VimWiki
"let g:vimwiki_folding = 'custom'
function! VimwikiFindIncompleteTasks()
  lvimgrep /- \[ \]/ %:p
  lopen
endfunction

function! VimwikiFindAllIncompleteTasks()
  VimwikiSearch /- \[ \]/
  lopen
endfunction
let g:vimwiki_list = [{'path': '~/.vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" Godot
let g:godot_executable = '/usr/bin/godot'

" Leader key stuff
let mapleader="\<Space>"

nnoremap <leader>w :w<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>
nnoremap <leader>n :NERDTree<cr>
nnoremap <leader>gs :Gstatus<cr>
noremap <leader>s ~
nnoremap <Leader>wa :call VimwikiFindAllIncompleteTasks()<CR>
nnoremap <Leader>wx :call VimwikiFindIncompleteTasks()<CR>
nnoremap <Leader>cr :vsp<CR> :term cargo run<CR>

" Some keymaps to make life easy
inoremap <S-Tab> <backspace>
noremap! tn <esc>
onoremap tn <esc>
nnoremap <buffer> <F5> :GodotRun<CR>
nnoremap <buffer> <F6> :GodotRunCurrent<CR>
