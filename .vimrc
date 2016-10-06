set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'weynhamz/vim-plugin-minibufexpl'
Plugin 'freitass/todo.txt-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
call vundle#end()

filetype plugin indent on
set linebreak breakindent expandtab ts=4 sw=4 number relativenumber encoding=utf-8 shortmess=Ia termguicolors noswapfile " hlsearch 
let mapleader="\<Space>"
let maplocalleader="/"

" For less awkward copy paste from/to X
vmap <Leader>y "+y
vmap <Leader>d "+d
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader>p "+p
nmap <Leader>P "+P

" The following is copied from the wiki for editing a single file in two panes
" when I have vim spanning my whole screen or otherwise a wide area;
" sometimes it gets screwed up but just setting it up again fixes it
noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR> <C-w>=

set backupdir=~/.vim/backup//
syntax on
let g:ycm_global_ycm_extra_conf = '/home/forell/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
" An arbitrary keybind because I couldn't get it to work with <C-Tab> in
" terminal vim. Meh.
let g:UltiSnipsExpandTrigger="<C-A>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"

augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
set background=dark
let g:indent_guides_auto_colors = 1

" autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Slightly more intuitive splitting to match my wm
set splitbelow splitright

" Removes the annoying O delay and also prevents normal arrow key usage
set noesckeys

" Automatically close brackets, braces and such
inoremap { {}<C-[>i
inoremap {<CR> {<CR>}<C-o>O
inoremap {{ {
inoremap " ""<C-[>i
inoremap "" "
inoremap ( ()<C-[>i
inoremap (( (
inoremap [ []<C-[>i
inoremap [[ [
inoremap „ „”<C-[>i

" I use space as leader, so this prevents it from moving my cursor when I use it,
" which I found particularly annoying for some reason.
noremap   <Space>  <NOP>

autocmd Filetype html,xml inoremap < <><C-[>i " autoclose those <>s
autocmd VimEnter * execute "normal \<C-L>"
let g:indent_guides_enable_on_vim_startup = 1
colorscheme molokai
let g:molokai_original = 1

let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#25272D
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#25272D

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
