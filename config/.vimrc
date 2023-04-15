set number
syntax enable
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE



call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-github-dashboard'
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'rhysd/vim-clang-format'
call plug#end()


let g:clang_format#style = 'llvm'
autocmd BufWritePre *.c,*.cpp,*.h :ClangFormat
