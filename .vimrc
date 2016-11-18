set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'freitass/todo.txt-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'mbbill/undotree'
Plugin 'justinmk/vim-sneak'
call vundle#end()

filetype plugin indent on
set linebreak breakindent cursorline
set expandtab ts=4 sw=4 cino=g0
set number relativenumber
set encoding=utf-8 shortmess=Ia termguicolors noswapfile hidden confirm
set undofile undodir=~/.vim/undo//

" Slightly more intuitive splitting to match my wm
set splitbelow splitright

" Removes the annoying O delay and also prevents normal arrow key usage
set noesckeys

let mapleader="\<Space>"
let maplocalleader="\\"

" For less awkward copy paste from/to X
vmap <Leader>y "+y
vmap <Leader>d "+d
vmap <Leader>p "+p
vmap <Leader>P "+P

nmap <Leader>y "+y
nmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P

" The following is copied from the wiki for editing a single file in two panes
" when I have vim spanning my whole screen or otherwise a wide area;
" sometimes it gets screwed up but just setting it up again fixes it
noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR> <C-w>=

syntax on
let g:ycm_global_ycm_extra_conf = '/home/forell/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

nmap <Leader>f :YcmCompleter FixIt<CR>
nmap <Leader>t :YcmCompleter GetType<CR>

" An arbitrary keybind because I couldn't get it to work with <C-Tab> in
" terminal vim. Meh.
let g:UltiSnipsExpandTrigger="<C-A>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"

augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Automatically close brackets, braces and such
inoremap { {}<C-[>i
inoremap {<CR> {<CR>}<C-o>O
inoremap {{ {
inoremap „ „”<C-[>i

" I use space as leader, so this prevents it from moving my cursor when I use it,
" which I found particularly annoying for some reason.
noremap   <Space>  <NOP>

autocmd Filetype html,xml inoremap < <><C-[>i
autocmd VimEnter * execute "normal \<C-L>"
autocmd Filetype todo,man set norelativenumber
autocmd Filetype man set nonumber
set keywordprg=:Man

colorscheme molokai_red

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * if &ft != "todo" && &ft != "man" | :set relativenumber | endif

runtime! ftplugin/man.vim

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'
