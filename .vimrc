filetype plugin indent on
syntax on

" key remaps
imap jk <Esc>

" aliases
:nnoremap cw ciw
:nnoremap dw diw

" settings
set autoindent
set smartindent " trying out semantic indentation
set ttimeoutlen=50 " for airline
" use spaces instead of tabs"
set tabstop=4
set shiftwidth=4
set expandtab
set number
set autochdir
set ignorecase
set mouse=a
set autoread

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
Plug 'drewtempelmeyer/palenight.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dkarter/bullets.vim'
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
