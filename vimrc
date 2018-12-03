"
"这里是 Ertuil VIM 配置文件 
"


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
set hlsearch
set foldmethod=indent
set foldlevel=99

" ----------------------------- status bar   ----------------------------
set laststatus=2 
set statusline=%F%m%r%h%w%=\ [ft=%Y]\ %{\"[fenc=\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"]\"}\ [ff=%{&ff}]\ [pos=%04l,%04v][%p%%][len=%L]

" ----------------------------- key map ---------------------------------
noremap <space>w :w<CR>
noremap <space>q :q<CR>
noremap <space>o :vs 

noremap <space>p <C-u>
noremap	<space>n <C-d>

noremap <space>j <C-W>j
noremap <space>k <C-W>k
noremap <space>h <C-W>h
noremap <space>l <C-W>l

noremap <space>z za

noremap <space>uk  :resize +3<CR>
noremap <space>uj  :resize -3<CR>
noremap <space>uh  :vertical resize -3<CR>
noremap <space>ul  :vertical resize +3<CR>


noremap <C-A> ^
noremap <C-E> $
noremap <C-K> d$
noremap <C-U> d^

noremap <space>ga :!git add *<CR>
noremap <space>gc :!git commit -m
noremap <space>gg :!git add * && git commit -m
noremap <space>gm :!git merge<CR>
noremap <space>gp :!git push<CR>
noremap <space>gP :!git pull<CR>


noremap <space>jc :tabc<CR> 
noremap <space>jo :tabo<CR>
noremap <space>jn :tabp<CR>
noremap <space>jm :tabn<CR>
noremap <space>je :tabedit 

let g:is_nu = 1
function! Tak_number()
	if g:is_nu == 1
		exe "set nonu"
		let g:is_nu = 0
    elseif g:is_nu == 0
		exe "set nu"
		let g:is_nu = 1
    endif
endfunction

noremap <space>v :call Tak_number()<CR>

function! TabPos_ActivateBuffer(num)
    let s:count = a:num
    exe "tabfirst"
    exe "tabnext" s:count
endfunction
       
function! TabPos_Initialize() 
    for i in range(1, 9)
        exe "map <space>" . i . " :call TabPos_ActivateBuffer(". i . ")<CR>"
    endfor
    exe "map <space>0 :call TabPos_ActivateBuffer(10)<CR>"
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
Plugin 'lrvick/Conque-Shell'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
call vundle#end()
filetype plugin indent on

" ----------------------------- NERDtree ---------------------------------

map <space>f :NERDTreeMirror<CR>
map <space>f :NERDTreeToggle<CR>

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
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
" ----------------------------- AutoComplPop Config ------------------

noremap <space>a :AutoComplPopEnable<CR>
noremap <space>A :AutoComplPopDisable<CR>

" ----------------------------- Conque Shell Config ------------------


if has('terminal') && exists(':terminal') == 2 && has('patch-8.1.1')
	" vim 8.1 支持 termwinkey ，不需要把 terminal 切换成 normal 模式
	" 设置 termwinkey 为 CTRL 加减号（GVIM），有些终端下是 CTRL+?
	" 后面四个键位是搭配 termwinkey 的，如果 termwinkey 更改，也要改
	noremap <space>x :belowright term<CR><c-/>:resize -5<CR>
	set termwinkey=<c-_>
	tnoremap <space>h <c-_>h
	tnoremap <space>l <c-_>l
	tnoremap <space>j <c-_>j
	tnoremap <space>k <c-_>k
	tnoremap <space>q <c-\><c-n>
else
    noremap <space>x :ConqueTermSplit zsh<CR>
    noremap <space>X :ConqueTermTab zsh<CR>
endif

" ----------------------------- Comment Config -----------------------

noremap <space>c \c<space>

" ----------------------------- State Bars -----------------------
"
" ----------------------------- Ctrip -----------------------
noremap <space>s :CtrlPMixed<CR> 

" ----------------------------- Extra File Config ------------------------
autocmd BufNewFile,BufRead *.html,*.htm,*.css,*.ts,*.js set noexpandtab tabstop=2 shiftwidth=2  

autocmd BufNewFile,BufRead *.py map <space>r :exec "!python3 %"<CR>
autocmd BufNewFile,BufRead *.c *.cpp map <space>r :exec "!g++ % -o %< && ./%<"<CR>
autocmd BufNewFile,BufRead *.ts *.js map <space>r :exec "!node %"<CR>
autocmd BufNewFile,BufRead *.java map <space>r :exec "!javac % && java %<"<CR>

" ----------------------------- Help Window  ------------------------

noremap <space>m :split ~/.vim/Readme.md<CR>
