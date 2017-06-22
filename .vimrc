set nocompatible
set rtp+=~/.vim/bundle/repos/github.com/Shougo/dein.vim
call dein#begin('~/.vim/bundle')
call dein#add('Shougo/dein.vim')

" Appearance
call dein#add('forell/vim-forell')
call dein#add('vim-airline/vim-airline')
" Language support and autocomplete
call dein#add('Valloric/YouCompleteMe')
call dein#add('SirVer/ultisnips')
call dein#add('ludovicchabant/vim-gutentags')
call dein#add('octol/vim-cpp-enhanced-highlight')
call dein#add('rust-lang/rust.vim')
" Functionality
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-surround')
call dein#add('tomtom/tcomment_vim')
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

" Line numbering
set number relativenumber cursorline
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
    " Only works in tmux
    autocmd FocusLost * :set norelativenumber
    autocmd FocusGained * :set relativenumber

" Line wrapping and scrolling
set nowrap sidescroll=5 scrolloff=5

" Folds
set foldcolumn=1 foldmethod=indent foldlevel=99

" Indentation
set expandtab tabstop=4 shiftwidth=4 softtabstop=4 cinoptions=g0,j1

" Files created by vim
set undofile undodir=~/.vim/undo// noswapfile

" Reduce key code timeout
set ttimeoutlen=100

" Slightly more intuitive splitting
set splitbelow splitright

" Misc
set encoding=utf-8 shortmess=Ia hidden confirm wildmenu showcmd noshowmode

" Leader
let mapleader="\<Space>"
let maplocalleader="\\"
    " Prevent space from moving the cursor
    noremap   <Space>  <NOP>

" Less awkward copy and paste from/to X
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

nnoremap <Leader>y "+y
nnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

" Edit a single file in two (simultaneously scrolling) panes
noremap <silent> <Leader>vs
            \ :<C-u>let @z=&so<CR>:set so=0 noscb<CR>
            \ :bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR> <C-w>=

" Restore cursor position
autocmd BufReadPost *
            \ if line("'\"") >= 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" Splits and buffers navigation
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Automatically close braces
inoremap { {}<C-[>i
inoremap {<CR> {<CR>}<C-[>O
inoremap {{ {

" Truecolor
set t_Co=256 termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme forell

" Set cursor shape
if &term =~ "xterm" || &term =~ "screen"
    autocmd VimEnter * silent !printf "[1 q"
    let &t_EI = "\<Esc>[1 q"
    let &t_SI = "\<Esc>[3 q"
    let &t_SR = "\<Esc>[1 q"
    autocmd VimLeave * silent !printf "[3 q"
endif

" Save sessions
set viewoptions-=options
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Close completion preview window
autocmd CompleteDone * pclose

" Filetype-specific
autocmd Filetype cpp,c,python,rust set colorcolumn=81
autocmd Filetype gitcommit set colorcolumn=73 textwidth=72
autocmd Filetype make set noexpandtab
set keywordprg=:Man
runtime! ftplugin/man.vim

" Plugin-related
    " YCM
    let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_rust_src_path = '/usr/src/rust/src'

    nnoremap <Leader>f :YcmCompleter FixIt<CR>
    nnoremap <Leader>t :YcmCompleter GetType<CR>

    " UltiSnips
    let g:UltiSnipsExpandTrigger="<C-J>"
    let g:UltiSnipsJumpForwardTrigger="<C-J>"
    let g:UltiSnipsJumpBackwardTrigger="<C-K>"

    " NERDTree
    nnoremap <C-N> :NERDTreeToggle<CR>

    " Airline
    set laststatus=2
    let g:airline_theme = 'forell'

    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_powerline_fonts = 1

    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#tabline#buffer_nr_format = '%s '
    let g:airline#extensions#syntastic#enabled = 0
    let g:airline#extensions#whitespace#enabled = 0
    let g:airline_section_y = ''
    let g:airline_section_z = airline#section#create(['%l/%L %c'])
