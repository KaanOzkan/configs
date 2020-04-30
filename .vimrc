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
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>
nnoremap <esc> :noh<return><esc>

" settings
set autoindent
set smartindent " trying out semantic indentation
set ttimeoutlen=50 " for airline
let mapleader = ","
set number
set relativenumber
set hlsearch
" Spell checking for .txt files
autocmd BufRead,BufNewFile *.txt set filetype=text
autocmd FileType text setlocal spell
" Save upon leaving insert mode
autocmd InsertLeave * write

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

" folding (z + a)
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Open quickfix window when command populates quickfix list
" augroup qf
"     autocmd!
"     autocmd QuickFixCmdPost [^l]* cwindow
"     autocmd QuickFixCmdPost l*    cwindow
"     autocmd VimEnter        *     cwindow
" augroup END

" plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'drewtempelmeyer/palenight.vim' " Theme
Plug 'axvr/photon.vim' " Theme
Plug 'itchyny/lightline.vim' " Informational footer bar
Plug 'sainnhe/lightline_foobar.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy search
Plug 'junegunn/fzf.vim' " Fuzzy search vim integration
Plug 'dkarter/bullets.vim' " Automated bullet lists
Plug 'tpope/vim-commentary' " Comments
Plug 'scrooloose/syntastic' " Syntax checker
Plug 'fatih/vim-go' " golang support
Plug 'rust-lang/rust.vim' "rust support
call plug#end()
" Reload .vimrc (:so %) and :PlugInstall to install plugins

" let g:palenight_terminal_italics=1
let g:lightline = { 'colorscheme': 'space_vim_dark' }
set laststatus=0 " Disabled lightline
set termguicolors
colorscheme desert

" Configure desert theme, doesnt play well with ruby
hi NonText guifg=bg
hi Identifier guifg=white
hi PreProc guifg=khaki

" netrw settings
let g:netrw_liststyle = 3
" let g:netrw_banner = 0 " remove banner
let g:netrw_winsize = 50
" bullet points
let g:bullets_enabled_file_types = ['text']
" syntastic
let g:syntastic_go_checkers = ['govet', 'errcheck', 'go']
" vim-go
let g:go_gopls_enabled = 0

" :Find using rg ==== IDK If we need this anymore
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

" Trim whitespace on save
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

if has("gui_macvim")
  " cmd + shift + [ for previous tab
  " cmd + shift + ] for next tab
  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif

