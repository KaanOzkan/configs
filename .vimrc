filetype plugin indent on
syntax on

" key remaps
:imap jj <Esc>

" settings
set autoindent
set smartindent " trying out semantic indentation
set ttimeoutlen=50 " for airline
    " use spaces instead of tabs"
:set tabstop=4
:set shiftwidth=4
:set expandtab

" Auto close
inoremap " ""<left>
inoremap ' ''<left>
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
