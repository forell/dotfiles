set nocompatible
set rtp+=~/.vim/bundle/repos/github.com/Shougo/dein.vim
call dein#begin('~/.vim/bundle')
call dein#add('Shougo/dein.vim')

" Appearance
call dein#add('forell/vim-forell')
call dein#add('vim-airline/vim-airline')
" Language support and autocomplete
call dein#add('Valloric/YouCompleteMe')
call dein#add('vim-syntastic/syntastic')
call dein#add('SirVer/ultisnips')
call dein#add('ludovicchabant/vim-gutentags')
call dein#add('octol/vim-cpp-enhanced-highlight')
call dein#add('rust-lang/rust.vim')
" Functionality
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-commentary')
call dein#add('justinmk/vim-sneak')
" Misc
call dein#add('scrooloose/nerdtree')
call dein#add('mbbill/undotree')
call dein#add('freitass/todo.txt-vim')
call dein#add('tmux-plugins/vim-tmux-focus-events')
call dein#add('ap/vim-css-color')
call dein#add('gerw/vim-HiLinkTrace')

call dein#end()
filetype plugin indent on
syntax on

set nowrap sidescroll=5 scrolloff=5 cursorline
set foldcolumn=1 foldmethod=indent foldlevel=99
set listchars+=precedes:<,extends:>
set expandtab tabstop=4 shiftwidth=4 softtabstop=4 cinoptions=g0
set number relativenumber wildmenu showcmd noshowmode
set encoding=utf-8 shortmess=Ia noswapfile hidden confirm
set undofile undodir=~/.vim/undo//
set ttimeoutlen=100

" Slightly more intuitive splitting
set splitbelow splitright

let mapleader="\<Space>"
let maplocalleader="\\"

" Less awkward copy and paste from/to X
vmap <Leader>y "+y
vmap <Leader>d "+d
vmap <Leader>p "+p
vmap <Leader>P "+P

nmap <Leader>y "+y
nmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P

" The following is copied from the wiki for editing a single file in two panes
" when I have vim spanning my whole screen or otherwise a wide area
noremap <silent> <Leader>vs
    \ :<C-u>let @z=&so<CR>:set so=0 noscb<CR>
    \ :bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR> <C-w>=

let g:ycm_global_ycm_extra_conf = '/home/forell/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_rust_src_path = '/usr/src/rust/src'

nmap <Leader>f :YcmCompleter FixIt<CR>
nmap <Leader>t :YcmCompleter GetType<CR>

let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_rust_checkers = ['rustc']

autocmd BufReadPost *
            \ if line("'\"") >= 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

autocmd bufenter * if (winnr("$") == 1
            \ && exists("b:NERDTree")
            \ && b:NERDTree.isTabTree()) | q | endif

nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Automatically close braces
inoremap { {}<C-[>i
inoremap {<CR> {<CR>}<C-o>O
inoremap {{ {

" I use space as leader, so this prevents it from moving my cursor when I use it
noremap   <Space>  <NOP>

:au FocusLost * :set norelativenumber
:au FocusGained * :set relativenumber

autocmd Filetype html,xml inoremap < <><C-[>i
autocmd Filetype cpp,c,python,rust set colorcolumn=81
autocmd Filetype gitcommit set colorcolumn=73 textwidth=72
autocmd Filetype todo,man set norelativenumber
autocmd Filetype man set nonumber
autocmd Filetype make set noexpandtab
set keywordprg=:Man

set t_Co=256 termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

colorscheme forell

" Sets cursor shape
autocmd VimEnter * silent !printf "[1 q"
let &t_EI = "\<Esc>[1 q"
let &t_SI = "\<Esc>[3 q"
let &t_SR = "\<Esc>[1 q"
autocmd VimLeave * silent !printf "[3 q"

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave *
            \ if &ft != "todo" | :set relativenumber | endif

set viewoptions-=options
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
autocmd CompleteDone * pclose

runtime! ftplugin/man.vim

set laststatus=2
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s '
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme = 'forell'
let g:airline_section_y = ''
