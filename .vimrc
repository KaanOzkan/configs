filetype plugin indent on
syntax on

" key remaps
imap jk <Esc>
imap kj <Esc>
imap <C-f> <Right>

" aliases
nnoremap cw ciw
nnoremap dw diw
" Set fzf keybinding
map ; :Files<CR>
map rg :Rg<CR>
" Window splits
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" settings
set autoindent
set smartindent " trying out semantic indentation
set ttimeoutlen=50 " for airline
let mapleader = ","
set number
set relativenumber

" Spell checking for .txt files
autocmd BufRead,BufNewFile *.txt set filetype=text
autocmd FileType text setlocal spell

" use spaces instead of tabs"
set tabstop=4
set shiftwidth=4
set expandtab
set number
set autochdir
set ignorecase
set mouse=a
set autoread
set linespace=4

" cursor blink
set guicursor=a:blinkon0

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
Plug 'drewtempelmeyer/palenight.vim' " This pretty theme
Plug 'itchyny/lightline.vim' " Informational footer bar
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy search
Plug 'junegunn/fzf.vim' " Fuzzy search vim integration
Plug 'dkarter/bullets.vim' " Automated bullet lists
Plug 'tpope/vim-commentary' " Comments
Plug 'scrooloose/syntastic' " Syntax checker
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
" bullet
let g:bullets_enabled_file_types = ['text']

" :Find using rg
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
