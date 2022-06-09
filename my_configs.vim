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

" ctrl + a to select all, this is mainly to combined with
" ctrl + c or ctrl + x
nnoremap <C-a> ggVG

" ctrl + x to cut to OSX clipboard
vmap <C-x> :!pbcopy<CR>

set number
" use Space key to highlight current word in current file
nnoremap <space> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
" remove included files in vim auto complete search source
setlocal complete-=i
setglobal complete-=i
" disable persistant-undo
set noundofile

map <F5> :!find ./ -name '*.c' -o -name '*.h' -o -name '*.gcl' -o -name '*.cc' -o -name '*.hh' -o -name '*.proto' > ./cscope.files;
      \cscope -i ./cscope.files -bq<CR>
      \:cs reset<CR><CR>

" this is used to avoid the following message when opening file in new tab using ctrlp:
" `Press ENTER or type command to continue`
" The reason that this message shows up is the filename is too long to fit
" in a one-line height cmd window
" This setting however will reduce the total lines a Vim window can show by 1
" since one extra line will be allocated to Vim cmd window
" another way to suppress this message is to find the corresponding
" ctrlp command causing this message and add `silent`
set cmdheight=2

" use » to mark Tabs and ° to mark trailing whitespace. This is a
" non-obtrusive way to mark these special characters.
set list listchars=tab:»\ ,trail:°
