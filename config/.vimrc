set number
syntax enable
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE

call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'
Plug 'rhysd/vim-clang-format'
call plug#end()

let g:clang_format#style = 'llvm'
autocmd BufWritePre *.c,*.cpp,*.h :ClangFormat
