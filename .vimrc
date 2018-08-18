" ---------------------------- Basic Config ------------------------------
set nu
set ruler
syntax enable
syntax on

colorscheme desert

" ---------------------------- Text Config -------------------------------

set tabstop=4
set softtabstop=4
set noexpandtab 
set smarttab 

set encoding=utf-8
set nocompatible
set backspace=indent,eol,start
set history=200

set showcmd
set autoindent
set showmatch
set ignorecase 
set incsearch
set foldmethod=indent
set foldlevel=99

" ----------------------------- status bar   ----------------------------
set laststatus=2 
set statusline=%F%m%r%h%w%=\ [ft=%Y]\ %{\"[fenc=\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"]\"}\ [ff=%{&ff}]\ [pos=%04l,%04v][%p%%][len=%L]

" ----------------------------- key map ---------------------------------
nmap <space>s :w<CR>
nmap <space>j <C-W>j
nmap <space>k <C-W>k
nmap <space>h <C-W>h
nmap <space>l <C-W>l
nmap <space>w <C-W>w
nmap <space>z za

nmap <space>xk  :resize +3<CR>
nmap <space>xj  :resize -3<CR>
nmap <space>xh  :vertical resize -3<CR>
nmap <space>xl  :vertical resize +3<CR>

nmap <space>q :q<CR>

nmap <space>gc :tabc<CR> 
nmap <space>go :tabo<CR>
nmap <space>gn :tabp<CR>
nmap <space>gm :tabn<CR>
nmap <space>ge :tabedit 

function! TabPos_ActivateBuffer(num)
    let s:count = a:num
    exe "tabfirst"
    exe "tabnext" s:count
endfunction
       
function! TabPos_Initialize() 
    for i in range(1, 9)
        exe "map <space>g" . i . " :call TabPos_ActivateBuffer(". i . ")<CR>"
    endfor
    exe "map <space>g0 :call TabPos_ActivateBuffer(10)<CR>"
endfunction
 
autocmd VimEnter * call TabPos_Initialize()

" ----------------------------- Vundle Start ----------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'The-NERD-tree'
Plugin 'taglist.vim'
Plugin 'AutoComplPop'
Plugin 'Syntastic'
Plugin 'The-NERD-Commenter'

call vundle#end()
filetype plugin indent on

" ----------------------------- NERDtree ---------------------------------

map <space>f :NERDTreeMirror<CR>
map <space>f :NERDTreeToggle<CR>

" ----------------------------- plugin taglist start ---------------------
map <space>t :TlistToggle<CR>
let Tlist_Use_Right_Window =1
let Tlist_Show_One_File=1     
let Tlist_Exit_OnlyWindow=1   
set tags=tags;
set autochdir
let Tlist_Ctags_Cmd="/usr/local/bin/ctags" 

" ----------------------------- Error Check Config -----------------------

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
nmap <space>e :Errors<CR> 

" ----------------------------- Comment Config -----------------------

nmap <space>c \c<space>

" ----------------------------- Extra File Config ------------------------
autocmd BufNewFile,BufRead *.html,*.htm,*.css,*.js set noexpandtab tabstop=2 shiftwidth=2  

autocmd BufNewFile,BufRead *.py map <space>r :exec "!python3 %"<CR>
autocmd BufNewFile,BufRead *.c *.cpp map <space>r :exec "!g++ % -o %< && ./%<"<CR>
autocmd BufNewFile,BufRead *.ts *.js map <space>r :exec "!node %"<CR>
autocmd BufNewFile,BufRead *.java map <space>r :exec "!javac % && java %<"<CR>


