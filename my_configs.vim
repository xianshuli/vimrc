syntax enable
set background=dark
colorscheme desert
" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>
" control+x to cut to OSX clipboard
" control+c to copy to OSX clipboard
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>
set number
" use Space key to highlight current word in current file
nnoremap <space> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
" remove included files in vim auto complete search source
setlocal complete-=i
setglobal complete-=i
" disable persistant-undo
set noundofile

map <F5> :!find /home/xianshuli/$YROOT_NAME/ /home/y/include/ /home/y/include64/ -type f -name '*.c' -o -name '*.h' -o -name '*.idl' -o -name '*.cc' -o -name '*.hh' -o -name '*.pl' > /home/xianshuli/$YROOT_NAME/cscope.files;
            \cscope -i /home/xianshuli/$YROOT_NAME/cscope.files -bq<CR>
            \:cs reset<CR><CR>
