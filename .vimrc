filetype plugin indent on
syntax on

" key remaps
imap jk <Esc>

" settings
set autoindent
set smartindent " trying out semantic indentation
set ttimeoutlen=50 " for airline
" use spaces instead of tabs"
set tabstop=4
set shiftwidth=4
set expandtab
set number

" Auto close
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Open quickfix window when command populates quickfix list
augroup qf
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    cwindow
    autocmd VimEnter        *     cwindow
augroup END


" plugins
call plug#begin('~/.vim/plugged')
Plug 'drewtempelmeyer/palenight.vim'
Plug 'itchyny/lightline.vim'
call plug#end()
" Reload .vimrc and :PlugInstall to install plugins

" palenight
let g:palenight_terminal_italics=1
let g:lightline = { 'colorscheme': 'palenight' }
set laststatus=2
set termguicolors
colorscheme palenight

" netrw settings
let g:netrw_liststyle = 3
" let g:netrw_banner = 0 " remove banner
let g:netrw_winsize = 50
