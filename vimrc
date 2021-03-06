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
Plugin 'haya14busa/incsearch.vim'
Plugin 'Syntastic'
Plugin 'The-NERD-Commenter'
Plugin 'lrvick/Conque-Shell'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'Shougo/neocomplete.vim'
call vundle#end()
filetype plugin indent on

" ----------------------------- NERDtree ---------------------------------

map <space>d :NERDTreeMirror<CR>
map <space>d :NERDTreeToggle<CR>

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
	noremap <space>x :belowright term<CR><c-_>:resize -7<CR>
	set termwinkey=<c-_>
	tnoremap <c-/>h <c-_>h
	tnoremap <c-/>l <c-_>l
	tnoremap <c-/>j <c-_>j
	tnoremap <c-/>k <c-_>k
	tnoremap <c-/>q <c-_>:q!
else
    noremap <space>x :ConqueTermSplit zsh<CR>
    noremap <space>X :ConqueTermTab zsh<CR>
endif

" ----------------------------- Comment Config -----------------------

noremap <space>c \c<space>

" ----------------------------- State Bars -----------------------
"
" ----------------------------- Ctrip -----------------------
noremap <space>f :CtrlPMixed<CR> 

" ----------------------------- incsearch -----------------------

map <space>s <Plug>(incsearch-forward)
map <space>S <Plug>(incsearch-backward)
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" ----------------------------- neocomplete  ------------------------

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" ----------------------------- Extra File Config ------------------------
autocmd BufNewFile,BufRead *.html,*.htm,*.css,*.ts,*.js set noexpandtab tabstop=2 shiftwidth=2  

autocmd BufNewFile,BufRead *.py map <space>r :exec "!python3 %"<CR>
autocmd BufNewFile,BufRead *.c *.cpp map <space>r :exec "!g++ % -o %< && ./%<"<CR>
autocmd BufNewFile,BufRead *.ts *.js map <space>r :exec "!node %"<CR>
autocmd BufNewFile,BufRead *.java map <space>r :exec "!javac % && java %<"<CR>

" ----------------------------- Help Window  ------------------------

noremap <space>m :split ~/.vim/Readme.md<CR>
