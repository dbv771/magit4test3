" todo {{{1
behave mswin

filetype on


set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
"默认编码部分
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,chinese,gb18030,gbk,cp936,big5,euc-jp,euc-kr,latin1

"let mapleader = ","
let mapleader = "\<Space>"

noremap <space> :
noremap <silent> <leader><leader> viw
"noremap <silent> <Leader>w vaw
"noremap <silent> <leader>n gN
map <silent> <leader><cr> :noh<cr>
map ; %

set sessionoptions=buffers,tabpages

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置 {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 判断是终端还是gvim
if has("gui_running")
	let g:isGUI = 1
else
	let g:isGUI = 0
endif

set nocompatible  " 关闭兼容模式
syntax enable     " 语法高亮
sy on  "语法高亮
filetype plugin on  " 文件类型插件
filetype indent on
set ffs=dos,unix,mac " fileformats support all three, in this order
set go=           "无菜单、工具栏 go=e显示标签栏
set ru            " 标尺信息
set nu            " 显示行号，还可以现实相对行号 relativenumber rnu
set showcmd       " 显示命令
set lz            " lazyredraw当运行宏时，在命令执行完成之前，不重绘屏幕
set hid           " 可以在没有保存的情况下切换buffer
set backspace=eol,start,indent
set whichwrap+=<,>,h,l " 退格键和方向键可以换行
set incsearch     " 增量式搜索
set hls           " hls,hlsearch 高亮搜索,noh临时关闭，nohls关闭
set ic            " ignorecase 搜索时忽略大小写
set gdefault      " 查找替换中 默认globally 替换之中/g 是全局但行内只是第一个 /gg是全局且行内，为默认
set magic         " 额，自己:h magic吧，一行很难解释
set showmatch     " 显示匹配的括号,()[]{}
set nobackup      " 关闭备份
set wrap          "默认自动换行 set nowrap
set more          "列表在全屏填满时暂停,可用g到首，鼠标选择，Ctrl+y复制
set nowb
set noaw          "noautowrite
set noswapfile    " 不使用swp文件，注意，错误退出后无法恢复
"set list         "显示隐藏字符
set lbr           " 在breakat字符处而不是最后一个字符处断行
set ambiwidth=double "解决显示汉字半个字符的问题
set ai            " autoindent 自动缩进
set si            " smartindent 智能缩进
set cindent       " C/C++风格缩进
set wildmenu      "在系统支持 wildmenu 特性启用文本模式的菜单
set fdm=indent    "fold的方式，有 indent,syntax 语法
" manual  手工定义折叠
" indent  更多的缩进表示更高级别的折叠
" expr    用表达式来定义折叠
" syntax  用语法高亮来定义折叠
" diff    对没有更改的文本进行折叠
" marker  对文中的标志折叠
set splitright    "新打开的窗口放在右边

set fdc=5         "行前显示多长折叠符号
set fen           "默认就折叠
set fdl=5        "折叠到第几层，默认为0
"set mousemodel=popup    " 允许鼠标右键弹出菜单
"set tabpagemax=15 "Vim默认最多只能打开10个标签页
set clipboard+=unnamed  " win系统剪贴板与无名寄存器同步
"linux之中"+y复制到系统剪贴板
set helplang=cn
set formatoptions-=cro  "h fo-table
set formatoptions+=mM   "正确地处理中文字符的折行和拼接行尾不要空格 set fo+=M  
"join的时候如果需要空格就 set fo-=M
"英文的时候默认有空格，用,vJ  join!无空格
set bsdir=buffer   "browsedir设定文件浏览器目录为当前目录
set scrolloff=2    "上下边界始终保留行数
set display=lastline
"set guitablabel=%N\ %t\ %M
set noimc    "命令行一开始不用中文，按Ctrl ^可切换

set linespace=1
"tab转化为2个字符
"set expandtab "用空格替代tab
set smarttab
"tab宽度
set shiftwidth=4
set tabstop=4
set listchars=tab:>-,trail:-,eol:$,extends:>,precedes:<
"光标可以到任意位置，set virtualedit="all"
set ve=

set showmatch matchpairs=(:),[:],{:},<:>
set complete=.,w,b,u,t,i,d completeopt=longest,menu
set background=dark

set dy=lastline "显示最多行，不用@@

set history=1000  " vim记住的历史操作的数量，默认的是20
set undolevels=1000

"set autoread    " 当文件在外部被修改时，自动重新读取
set autochdir "自动改变到当前文件目录

" 不让vim发出讨厌的滴滴声和闪烁
set noeb vb t_vb=
if (g:isGUI)
	au GUIEnter * set vb t_vb=
endif

" shortens messages to avoid 'press a key' prompt
set shortmess=atI

"忽略这些文件扩展名
"set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png,*.swp,*.class
"set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png,*.swp,*.class,*.flv,*.rmvb,*.rm,*.avi,*.mp3,*.mp3

set cscopetag "出现多个同名tag的时候，给出一个备选列表

"进入当前编辑的文件的目录
"autocmd BufEnter * exec "cd %:p:h"
"autocmd BufEnter * exec "lcd %:p:h"
autocmd BufEnter * :cd %:p:h
autocmd BufEnter * :lcd %:p:h
autocmd BufEnter * :syntax sync fromstart

"au BufNewFile,BufRead *.html set filetype=html

"保存的时候去掉空格autocmd BufWrite * execute
"autocmd BufEnter * :set fdl=0

"自动套用模板
"au BufNewFile *.html 0r ~/.vim/temple/html.html|norm 13G

"打开文件 光标定位到上次编辑的地方
if has("autocmd")
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 不同OS {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 判断操作系统
"if (has("win32") || has("win64") || has("win32unix")) &&
if (has("win32") || has("win64"))
	"au GUIEnter * simalt ~x  "启动的时候最大化
	let g:isWin = 1
	let g:slash = '\'
	let &termencoding=&encoding " 通常win下的encoding为cp936
	map <silent> <leader>ee :e $VIMRUNTIME/_vimrc<cr>
	map <silent> <leader>er :source $VIMRUNTIME/_vimrc<cr>
	autocmd! bufwritepost .vimrc source $VIMRUNTIME/_vimrc
	set guifont=Consolas:h18 "英文字符
	set gfw=Consolas:h18:cGB2312
	"set gfw=YouYuan:b:h18:cGB2312
	"关闭vim时候自动保存打开文件的信息
	au VimLeave * mksession! $VIMRUNTIME/Session.vim
	au VimLeave * wviminfo! $VIMRUNTIME/_viminfo
	""启动vim时候自动恢复上次打开文件的状态
	"autocmd VimEnter * nested if argc() == 0 && filereadable($VIMRUNTIME . "/Session.vim") |
	"	\ execute "source " . $VIMRUNTIME . "/Session.vim"|
	"	\ execute "rviminfo " . $VIMRUNTIME . "/_viminfo"
	"map <leader>gf :update<CR>:silent !start c:\progra~1\intern~1\iexplore.exe file://%:p
	map <leader>gp :!start nircmd shexec open %:p<CR><CR>
	map <leader>gi :!start nircmd shexec open <cWORD><CR><CR>
	command! SHELL silent cd %:p:h|silent exe "!start cmd"|silent cd -
	command! TC silent !start explorer %:p:h
else
	let g:isWin = 0
	let g:slash = '/'
	map <silent> <leader>ee :e $HOME/.vimrc<cr>
	map <silent> <leader>er :source ~/.vimrc<cr>
	command! -nargs=? RW :w !sudo tee %
	autocmd! bufwritepost .vimrc source ~/.vimrc
	set guifont=DejaVu\ Sans\ Mono\ 12
	set guifontwide=WenQuanYi\ Zenhei\ 12
	"autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
	"	\ call mkdir($HOME . "/.vim") |
	"	\ endif |
	"	\ execute "mksession! " . $HOME . "/.vim/Session.vim"
	"autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
	"	\ execute "source " . $HOME . "/.vim/Session.vim"
	map <leader>gf :tabe <c-r>=getline('.')<CR><CR>
	map <leader>gi :!firefox <cWORD><CR><CR>
	command! SHELL silent cd %:p:h|silent exe '!setsid gnome-terminal'|silent cd -
	command! Nautilus silent !nautilus %:p:h
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 界面UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 状态栏
set laststatus=2  " 总是显示状态栏
highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
" 获取当前路径，将$HOME转化为~
function! CurDir()
	let curdir = substitute(getcwd(), $HOME, "~", "g")
	return curdir
endfunction
function! IMInsertSearch() "输入和命令状态
	return "i" . &iminsert . "s" . &imsearch
endfunction
"set statusline=[%n]%f%m%r%h\|%{CurDir()}\|%l,%c\ %p%%@%L\|%=\|A=%b,H=%b%{((&fenc==\"\")?\"\":\"\|\".&fenc)}\|%{&ff}\|%Y\|%{$USER}@%{hostname()}\
"set statusline=[%n]%f%m%r%h\|%{CurDir()}\|%l,%c\ %p%%@%L\|%=\|%{&fo}\|A=%b,H=%b%{((&fenc==\"\")?\"\":\"\|\".&fenc)}\|%{&ff}\|%Y\|%{$USER}@%{hostname()}\
"&ho formatoptions的相关选项 :h fo-table
set statusline=[%n]%f%m%r%h\|%{CurDir()}\|%l,%c\ %p%%@%L\|%=\|%{IMInsertSearch()}\|%{&fo}\|A=%b,H=%b%{((&fenc==\"\")?\"\":\"\|\".&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}\|%{&ff}\|%Y\|%{$USER}@%{hostname()}\
"set statusline=[%n]%f%m%r%h\|%{CurDir()}\|%l,%c\ %p%%@%L\|%=\|%{&fo}\|A=%b,H=%b%{((&fenc==\"\")?\"\":\"\|\".&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}\|%{&ff}\|%Y\|%{$USER}@%{hostname()}\
" 恢复上次文件打开位置
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" 第80列往后加下划线
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)

" 根据给定方向搜索当前光标下的单词，结合下面两个绑定使用
function! VisualSearch(direction) range
	let l:saved_reg = @"
	execute "normal! vgvy"
	let l:pattern = escape(@", '\\/.*$^~[]')
	let l:pattern = substitute(l:pattern, "\n$", "", "")
	if a:direction == 'b'
		execute "normal ?" . l:pattern . "<cr>"
	else
		execute "normal /" . l:pattern . "<cr>"
	endif
	let @/ = l:pattern
	let @" = l:saved_reg
endfunction

" 用 */# 向 前/后 搜索光标下的单词
vnoremap <silent> * :call VisualSearch('f')<CR>
"搜索然后找到下一个
vnoremap <silent> # :call VisualSearch('b')<CR>
"搜索然后找到上一个
"用gd命令搜索，然后跳到第一个
"nmap <Leader>* MultipleSearch.vim 增量

"选中后进行查找替换
nmap <Leader>r :%s/<C-R>=expand("<cWORD>")<CR>
"vmap <Leader>r y:%s/<C-R>"
vmap <Leader>r "ry:%s/<C-R>r
nmap <Leader>g :g/<C-R>=expand("<cWORD>")<CR>/d
vmap <Leader>g "ry:g/<C-R>r/d
"v方式速度很慢
nmap <Leader>v :v/<C-R>=expand("<cWORD>")<CR>/d
vmap <Leader>v "ry:v/<C-R>r/d
"nmap <Leader>// :v/<C-R>=expand('<cWORD>')<CR>/d
"vmap <Leader>// "ry:v/<C-R>r/d<CR>
"grep，不支持中文
"vim中不能使用 ctrl+/ 作为快捷键.
nmap <Leader>/ :%!grep <C-R>=expand("<cWORD>")<CR>
vmap <Leader>/ "ry:%!grep <C-R>r

"每个标签 tabpage 单独搜索 查找内容本地化,利用autocmd功能,在离开buffer时保存"/的值，在进入buffer时恢复：
au BufLeave * let b:search_save=@/ | let g:search_pattern=@/
au BufEnter * if exists("b:search_save") | let @/=b:search_save | endif
"继续刚刚别的标签里面的搜索
map <A-/> /<C-R>=eval("g:search_pattern")<CR><CR>
"还可以把buffer改成window，也就是各个window维护自己的"/
"这样在多窗口编辑同一文件时，可以使得查找文字互不干扰

"在gvim中高亮当前行
if (g:isGUI)
	set cursorline
	colo evening "夜晚风格
	"hi cursorline guibg=#333333
	"hi CursorColumn guibg=#333333
endif

" 删除buffer时不关闭窗口
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
	let l:currentBufNum = bufnr("%")
	let l:alternateBufNum = bufnr("#")

	if buflisted(l:alternateBufNum)
		buffer #
	else
		bnext
	endif

	if bufnr("%") == l:currentBufNum
		new
	endif

	if buflisted(l:currentBufNum)
		execute("bdelete! ".l:currentBufNum)
	endif
endfunction


highlight TablineSel term=underline,reverse cterm=bold gui=underline,reverse guibg=#00ec00 guifg=#073642 guisp=#839496


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mswin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"source $VIMRUNTIME/mswin.vim
" set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q> <C-V>

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

" backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

"alt-c 新建剪贴板中的内容
"map <M-c> :tabnew<CR>"+gP
"imap <M-c> <esc>:tabnew<CR>"+gP
"map <M-c> :tabnew<CR>:r! cliphtml<cr>:%s/>\s*</>\r</gg<cr>gg
"imap <M-c> <esc>:tabnew<CR>:r! cliphtml<cr>:%s/>\s*</>\r</gg<cr>gg
function! GetClipHtml()
	silent exe "!start nircmd execmd cliphtml ~x3E ~$sys.temp$\\cliphtml.html"
	silent exe "sleep 300m"
	silent execute "tabnew"
	silent execute "r " . expand('$TEMP').'\cliphtml.html'
	"silent exe "%s/\r"
	"silent exe "%s/>\s*</>\r</gg"

	%s/>\s*</>\r</gg
	%g/^<!--StartFragment/norm dgg
	%g/^<!--EndFragment/norm dG

	"%g/^\(Version\|StartHTML\|EndHTML\|StartFragment\|EndFragment\|SourceURL\):/d
	"if match(getline(7),"^SourceURL:http") == 0
	"	execute "normal 7Gdd"
	"endif

	silent execute "normal gg"
	silent execute "set filetype=html"
endfunction
command! -range=% -nargs=? GCH call GetClipHtml()
map <silent> <M-c> :silent! GCH<CR>
imap <silent> <M-c> <esc>:silent! GCH<CR>



" CTRL-V and SHIFT-Insert are Paste
map <C-V> "+gP
map <S-Insert> "+gP

cmap <C-V> <C-R>+
cmap <S-Insert> <C-R>+
"ALT-V
cmap <A-v> <C-R>"
inoremap <A-v> <C-R>"
"ctrl backspace are delete previous word
imap <C-BS> <C-W>
"alt-0
map <M-0> "0p
vmap <M-0> "0p
imap <M-0> <C-R>0
cmap <M-0> <C-R>0
"alt-p
map <M-p> "0p
vmap <M-p> "0p
imap <M-p> <C-R>0
cmap <M-p> <C-R>0

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert> <C-V>
vmap <S-Insert> <C-V>

" Use CTRL-S for saving, also in Insert mode
"noremap <silent> <Leader>w :update<CR>
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
	set guioptions-=a
endif

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
"inoremap <C-Y> <C-O><C-R>

" Alt-Space is System menu
if has("gui")
	noremap <M-Space> :simalt ~<CR>
	inoremap <M-Space> <C-O>:simalt ~<CR>
	cnoremap <M-Space> <C-C>:simalt ~<CR>
endif

" CTRL-A is Select all
"noremap <C-A> gggH<C-O>G
"inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
"cnoremap <C-A> <C-C>gggH<C-O>G
"onoremap <C-A> <C-C>gggH<C-O>G
"snoremap <C-A> <C-C>gggH<C-O>G
"默认原来的设置是直接编辑，不合理
noremap <C-A> ggVG
inoremap <C-A> <C-C>ggVG
cnoremap <C-A> <C-C>ggVG
onoremap <C-A> <C-C>ggVG
snoremap <C-A> <C-C>ggVG
xnoremap <C-A> <C-C>ggVG

" CTRL-Tab is Next window
"noremap <C-Tab> <C-W>w
"inoremap <C-Tab> <C-O><C-W>w
"cnoremap <C-Tab> <C-C><C-W>w
"onoremap <C-Tab> <C-C><C-W>w

" CTRL-F4 is Close window
noremap <F4> <C-W>c
inoremap <F4> <C-O><C-W>c
"cnoremap <C-F4> <C-C><C-W>c
"onoremap <C-F4> <C-C><C-W>c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快捷键 {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"^z快速进入shell
"nmap <C-Z> :shell<cr>
"重复执行上一次的命令
"noremap <Leader>. @:
noremap <Leader>. @q

"复制当前行不带回车
noremap <Leader>Y 0"+y$
"全选
noremap <Leader>G ggyG
"上下两行互换
noremap <Leader>D ddpj

noremap <CR> G
noremap <BS> gg

cnoremap <A-h> <Home>
cnoremap <A-l> <End>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <A-j> <Left>
cnoremap <A-k> <Right>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <A-b> <S-Left>
cnoremap <A-B> <S-Left>
cnoremap <A-w> <S-Right>
cnoremap <A-W> <S-Right>

"翻页
map <M-j> <C-f>
map <M-k> <C-b>
imap <M-j> <C-o><PageDown>
imap <M-k> <C-o><PageUp>
vmap <M-j> <S-PageDown>
vmap <M-k> <S-PageUp>

"noremap <M-h> <Home>
"noremap <M-l> <End>
"vnoremap <M-h> <S-Home>
"vnoremap <M-l> <S-End>
inoremap <A-h> <Home>
inoremap <A-l> <End>
noremap <M-h> 0
noremap <M-l> $
vnoremap <M-h> 0
vnoremap <M-l> $

vmap <C-f> <S-PageDown>
vmap <C-b> <S-PageUp>

"窗口间移动 h window-moving
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

"ctrl-n 切换到下一缓冲区
"nmap <silent><C-n> :bn<cr>
"ctrl-p 切换到上一缓冲区
"nmap <silent><C-p> :bp<cr>
"ctrl-l 显示所有缓冲区
"nmap <C-l> :ls<cr>
"ctrl-k 删除当前缓冲区
"nmap <C-k> :bd<cr>

nnoremap <C-F3> :next<cr>
nnoremap <C-F2> :prev<cr>

"用在buffer之间切换,Ctrl+^在两个buf中切换
nnoremap <M-F3> :bn<cr>
nnoremap <M-F2> :bp<cr>
"alt+G关闭buf
map <M-g> :bd!<cr>
imap <M-g> <esc>:bd!<cr>
"保存文件名
map <M-s> :w z:\<C-R>".txt

"ctags cscope quickfix 窗口列表
":cl 显示列表
nmap <silent> <Leader>cn :cn<CR>
nmap <silent> <Leader>cp :cp<CR>
nmap <silent> <Leader>cw :cw 10<CR>


""先定义可以跨行
noremap gn j
noremap gm k
""在较长的一行中移动
noremap j gj
noremap k gk
noremap <Up> gk
noremap <Down> gj

"输入状态下移动
imap <Up> <C-o>k
imap <Down> <C-o>j
imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l
imap <C-d> <C-o><DEL>
inoremap <A-b> <C-o>b
inoremap <A-w> <C-o>w

imap <C-F1> <c-o>:reg<cr>
noremap <C-F1> :reg<cr>

"Avoid the escape key
"将;;设置为esc，需要单个输入;的时候不影响，需要输入;;的时候停顿一下  h timeout
"在插入模式下，<ctrl-c> 和 <esc> 功能相同。<ctrl-[> 和 <esc> 类似，但不执行缩写检查。<ctrl-\><ctrl-n> 也可以回到普通模式。
"inoremap jj <Esc>
inoremap ;; <ESC>
cnoremap ;; <ESC>
"nnoremap ;; <Esc>
"vnoremap ;; <Esc>
"先干嘛之后，然后;;作为esc一下，然后继续
"g/xxx/norm kO;;jA

"当前位置新建一行
nnoremap U i<cr><esc>

"打开vi自带的简易计算器
inoremap <A-e> <C-R>=
"在一行计算表达式上例如1+2*3上按 calc
noremap <A-=> ^v$"jyA==j
inoremap <A-=> ^v$"jyA==j


" 在文件名上按,gt时，在新的tab中打开
map <leader>gt :tabnew <cfile><cr>
map <leader>gf :tabe <c-r>=getline('.')<CR><CR>
map gf :e <cfile><CR>

":pu 粘贴在下一行

"重建所有帮助
":helptags $VIM/doc/

"编码相关 set fileencoding fileformat?
map <silent> <leader>ffd :set ff=dos<cr>
map <silent> <leader>ffu :set ff=unix<cr>
map <silent> <leader>fcc :set fenc=cp936<cr>
map <silent> <leader>fcu :set fenc=utf-8<cr>
iab imeta <meta charset="utf-8">
"高亮相关filetype
map <silent> <leader>ftk :set ft=<cr>
map <silent> <leader>ftt :set ft=txt<cr>
map <silent> <leader>fth :set ft=html<cr>
map <silent> <leader>ftp :set ft=python<cr>
map <silent> <leader>ftj :set ft=javascript<cr>
"scb scrollbind 同步滚屏
"map <silent> <leader>sg :set scb<cr>
"map <silent> <leader>st :set noscb<cr>

"Switch to current dir
map <leader>cd :cd %:p:h<cr>
map <silent> <M-d> :cd %:p:h<cr>

"tab mappings
map <M-1> 1gt
map <M-2> 2gt
map <M-3> 3gt
map <M-4> 4gt
map <M-5> 5gt
map <M-6> 6gt
map <M-7> 7gt
map <M-8> 8gt
map <M-9> 9gt
noremap <M-t> :tabnew<CR>"+gP
"noremap <M-w> :tabclose<CR>
imap <M-1> <C-O>1gt
imap <M-2> <C-O>2gt
imap <M-3> <C-O>3gt
imap <M-4> <C-O>4gt
imap <M-5> <C-O>5gt
imap <M-6> <C-O>6gt
imap <M-7> <C-O>7gt
imap <M-8> <C-O>8gt
imap <M-9> <C-O>9gt
imap <M-t> <C-O>:tabnew<CR>"+gP
"imap <M-w> <esc>:tabclose<CR>
map tl :silent! tabnext<cr>
map th :silent! tabprevious<cr>
map tt :tabnew<cr>
map tw :tabclose<cr>
map td :bd!<cr>
map tp :tabnew<cr>"+gP

"新建一个在下部的窗口
map tj <C-W>n<C-W>J
map tk <C-W>n<C-W>K

map <F1> :tabnew<CR>
map <F2> :silent! tabprevious<cr>
map <F3> :silent! tabnext<cr>
imap <F1> <esc>:tabnew<cr>
imap <F2> <esc>:silent! tabprevious<cr>
imap <F3> <esc>:silent! tabnext<cr>
"map <F4> :tabclose<cr>
"imap <F4> <esc>:tabclose<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 鼠标
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"help mouse-swap-buttons
"在所有模式下都允许使用鼠标，还可以是n,v,i,c等
set mouse=a
set selection=exclusive
set selectmode=mouse,key
"选中后按住右键点左键，复制
"按住左键点右键，粘贴
"鼠标双击三击四击

" 侧边键
map <X1Mouse> <C-B>
map <X2Mouse> <C-F>

"右键直接粘贴
"noremap <RightMouse> <LeftMouse><MiddleMouse> "对应系统剪贴板
noremap <RightMouse> <LeftMouse>p
"inoremap <RightMouse> <LeftMouse><C-R>*
inoremap <RightMouse> <LeftMouse><esc>pi

"在鼠标中键点击的位置粘贴 (不然，粘贴在光标所在的位置进行)。
"noremap <MiddleMouse> <LeftMouse><MiddleMouse>  "对应系统剪贴板
noremap <MiddleMouse> <LeftMouse>p

"左键一拖后自动复制，在可视模式下立即抽出选择区。
"noremap <LeftRelease> <LeftRelease>y<esc>
"选中后右键复制，中间剪切
vnoremap <RightMouse> y<esc>
vnoremap <MiddleMouse> d<esc>



""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
let javaScript_fold=1 "启用javascript文件的折叠

augroup vimrcEx
au!

au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> console.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold()
	setl foldmethod=indent "syntax
	setl foldlevelstart=1
	syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

	function! FoldText()
	return substitute(getline(v:foldstart), '{.*', '{...}', '')
	endfunction
	setl foldtext=FoldText()
endfunction

au FileType txt setl foldmethod=indent
au FileType txt setl fen
au FileType txt setl nocindent

"ini文件折叠
au FileType dosini setl foldexpr=getline(v:lnum)[0]!=\"\[\"
au FileType dosini setl fdm=expr
":set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
":set foldtext=foldtext().v:folddashes.getline(v:foldstart+1) "多显示一行
function! MyFoldText()
    let line = getline(v:foldstart)
    let line2 = getline(v:foldstart + 1)
    let sub = substitute(line . "|" . line2, '/\*\|\*/\|{{{\d\=', '', 'g')
    let ind = indent(v:foldstart)
    let lines = v:foldend-v:foldstart + 1
    let i = 0
    let spaces = ''
    while i < (ind - ind/4)
        let spaces .= ' '
        let i = i+1
    endwhile
    return spaces . sub . ' --------(' . lines . ' lines)'
endfunction
set foldtext=foldtext()
"txt格式
"au FileType txt setl foldmethod=indent
"au FileType txt setl fen
"au FileType txt setl nocindent

"markdown  {{{2
highlight mkdCode guibg=#666666 guifg=#33CC33 guisp=#839496
highlight mkdURL guibg=#778899 guifg=#073642 guisp=#839496
""""""""""""""""""""""""""""""
" 各种插件 {{{1
" showmarks setting {{{2
""""""""""""""""""""""""""""""
" Enable ShowMarks
let showmarks_enable = 1
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1
"  Default keymappings are:
"  <Leader>mt  - Toggles ShowMarks on and off.
"  <Leader>mo  - Turns ShowMarks on, and displays marks.
"  <Leader>mh  - Clears a mark.
"  <Leader>ma  - Clears all marks.
"  <Leader>mm  - Places the next available mark.
""""""""""""""""""""""""""""""
" markbrowser setting
""""""""""""""""""""""""""""""
map <silent> <leader>mk :MarksBrowser<cr>
map <silent> <M-m> :MarksBrowser<cr>
""""""""""""""""""""""""""""""
" fencview plugin {{{2
""""""""""""""""""""""""""""""
"在.vimrc中加入上面安装的fencview插件指令,复制到iconv.dll到windows的path目录之中
let g:fencview_autodetect=0        "打开文件时自动识别编码
let g:fencview_auto_patterns='*'        "扩展名
let g:fencview_checklines = 10        "检查前后10行来判断编码
":FencAutoDetect 自动识别文件编码
":FencView 打开一个编码列表窗口，用户选择编码reload文件
":FencManualEncoding coding 手动设置文件编码，用你想使用的编码代替coding
map <silent> <leader>fa :FencAutoDetect<cr><cr>
map <silent> <leader>fv :FencView<cr>
""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
"be BufExplorer, bs  BufExplorerHorizontalSplit, bv BufExplorerVerticalSplit
map <leader>o :BufExplorer<cr>
map <silent> <M-b> :BufExplorer<cr>
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber


""""""""""""""""""""""""""""""
" lookupfile setting {{{2
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
if filereadable("./tags")                       "设置tag文件的名字，默认是filenametags
	let g:LookupFile_TagExpr = '"./tags"'
endif
"映射LookupFile为,lk
nmap <silent> <leader>lk :LUTags<cr>
"映射LUBufs为,ll
nmap <silent> <leader>ll :LUBufs<cr>
"映射LUWalk为,lw
nmap <silent> <leader>lw :LUWalk<cr>

" lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
	let _tags = &tags
	try
		let &tags = eval(g:LookupFile_TagExpr)
		let newpattern = '\c' . a:pattern
		let tags = taglist(newpattern)
	catch
		echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
		return ""
	finally
		let &tags = _tags
	endtry

	" Show the matches for what is typed so far.
	let files = map(tags, 'v:val["filename"]')
	return files
endfunction
let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'
""""""""""""""""""""""""""""""
" autocomplpop plugin {{{2
""""""""""""""""""""""""""""""
"option 'omnifunc' is notset 错误:
"vim7下Omnicompletion默认情况下是没有开启的，有时候自定义的vimrc文件会实现自动补齐，
"例如vim-autocomplpop等等，在编辑html/css文件的时候可能会出现 option 'omnifunc' is not set的错误提示，解决方法就是开启completion。
highlight Pmenu guibg=LightMagenta guifg=black
highlight PmenuSel guibg=Cyan guifg=black
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

"filetype plugin indent on 头已有
if has("autocmd") && exists("+omnifunc")
     autocmd Filetype *
   \ if &omnifunc == "" |
   \   setlocal omnifunc=syntaxcomplete#Complete |
   \ endif
endif
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

"vim自带的补全
"Ctrl+X Ctrl+L 整行补全
"Ctrl+X Ctrl+N 根据当前文件里关键字补全
"Ctrl+X Ctrl+K 根据字典补全
"Ctrl+X Ctrl+T 根据同义词字典补全
"Ctrl+X Ctrl+I 根据头文件内关键字补全
"Ctrl+X Ctrl+] 根据标签补全
"Ctrl+X Ctrl+F 补全文件名
"Ctrl+X Ctrl+D 补全宏定义
"Ctrl+X Ctrl+V 补全vim命令
"Ctrl+X Ctrl+U 用户自定义补全方式
"Ctrl+X Ctrl+S 拼写建议


""""""""""""""""""""""""""""""
" SuperTab plugin {{{2
""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
" 设置按下<Tab>后默认的补全方式,默认是<C-P>,
" 现在改为<C-X><C-O>. 关于<C-P>的补全方式,
" 还有其他的补全方式,你可以看看下面的一些帮助:
" :help ins-completion
" :help compl-omni
let g:SuperTabRetainCompletionType=2
" 0 - 不记录上次的补全方式
" 1 - 记住上次的补全方式,直到用其他的补全命令改变它
" 2 - 记住上次的补全方式,直到按ESC退出插入模式为止

""""""""""""""""""""""""""""""
" NERDTree plugin {{{2
""""""""""""""""""""""""""""""
"where NERD tree window is placed on the screen
let NERDTreeWinPos = "left"
"size of the NERD tree
"let NERDTreeWinSize = 31
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeBookmarksFile=$VIM.'/NerdBookmarks.txt'
" Open and close the NERD_tree.vim separately
"nmap <F7> <ESC>:NERDTreeToggle<CR>
nmap <F7> <ESC>:NERDTree<CR>
"在tree窗口中才能执行
nmap <M-F7> <ESC>:Bookmark 

"================================================================================
"let NERDChristmasTree=1
"let NERDTreeAutoCenter=1
"let NERDTreeMouseMode=2
"let NERDTreeShowBookmarks=1
"let NERDTreeShowFiles=1
"let NERDTreeShowHidden=1
"let NERDTreeShowLineNumbers=1
"let NERDTreeWinPos="left"
"let NERDTreeWinSize=25
"
""""""""""""""""""""""""""""""
" NERD Commenter {{{2
""""""""""""""""""""""""""""""
"先设置系统全局默认变量
set commentstring=//%s "cms(缺省在未知或者没有扩展名的时候为 "/*%s*/")
"h NERDCommenter
"Normal模式下，几乎所有命令前面都可以指定行数
"Visual模式下执行命令，会对选中的特定区块进行注释/反注释
"<leader>c  空格切换注释/非注释状态*/
"<leader>ca 在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
"<leader>cc 注释当前行
"<leader>cs 以”性感”的方式注释
"<leader>cA 在当前行尾添加注释符，并进入Insert模式
"<leader>cu 取消注释
"Normal模式下，几乎所有命令前面都可以指定行数
"Visual模式下执行命令，会对选中的特定区块进行注释/反注释

""""""""""""""""""""""""""""""
" Tag list (ctags) {{{2
""""""""""""""""""""""""""""""
if g:isWin == 1
	let Tlist_Ctags_Cmd = 'ctags'
else
	let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口
"let Tlist_Use_Left_Window=0

let Tlist_Auto_Open=0 "启动VIM后，自动打开taglist窗口
let Tlist_Auto_Update=1
let Tlist_Hightlight_Tag_On_BufEnter=1
let Tlist_Display_Prototype=0
let Tlist_Compact_Format=1             "不显示F1帮助
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_WinWidth = 30

"Tlist_Exit_OnlyWindow "最后一个窗口时退出VIM
"Tlist_Show_Menu "显示taglist菜单
"Tlist_Max_Submenu_Items和Tlist_Max_Tag_Length;菜单条目数和所显示tag名字的长度；
"Tlist_Use_SingleClick "单击tag就跳转
"Tlist_Close_On_Select "选择了tag后自动关闭taglist窗口
"Tlist_File_Fold_Auto_Close "只显示当前文件tag，其它文件的tag都被折叠起来。
"Tlist_GainFocus_On_ToggleOpen "希望输入焦点在taglist窗口中
"Tlist_Process_File_Always "taglist始终解析文件中的tag，不管taglist窗口有没有打开
"Tlist_WinHeight和Tlist_WinWidth可以设置taglist窗口的高度和宽度。
"Tlist_Use_Horiz_Window为１设置taglist窗口横向显示；
map <silent> <leader>tl :TlistOpen<cr>
nmap <F8> <ESC>:TlistToggle<CR>
"在taglist窗口中，可以使用下面的快捷键：
"<CR> 跳到光标下tag所定义的位置，用鼠标双击此tag功能也一样
"o 在一个新打开的窗口中显示光标下tag
"<Space> 显示光标下tag的原型定义
"u 更新taglist窗口中的tag
"s 更改排序方式，在按名字排序和按出现顺序排序间切换
"x taglist窗口放大和缩小，方便查看较长的tag
"+ 打开一个折叠，同zo
"- 将tag折叠起来，同zc
"* 打开所有的折叠，同zR
"= 将所有tag折叠起来，同zM
"[[ 跳到前一个文件
"]] 跳到后一个文件
"q 关闭taglist窗口
"<F1> 显示帮助

"ctrl+] 查找光标下的标签（可查看函数定义）
"ctrl+t 返回跳转到标签的前一次位置（即上一个标签）
"ctrl+o 返回源文件

"ctags for windows
"http://ctags.sourceforge.net
"cscope for windows
"http://sourceforge.net/projects/mslk/files/Cscope/

""""""""""""""""""""""""""""""
" CtrlP {{{2
""""""""""""""""""""""""""""""
"Bundle 'ctrlpvim/ctrlp.vim'
"Run :CtrlP or :CtrlP [starting-directory] to invoke CtrlP in find file mode.
"Run :CtrlPBuffer or :CtrlPMRU to invoke CtrlP in find buffer or find MRU file mode.
"Run :CtrlPMixed to search in Files, Buffers and MRU files at the same time.
"Check :help ctrlp-commands and :help ctrlp-extensions for other commands.
"Once CtrlP is open:
"Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
"Press <c-f> and <c-b> to cycle between modes.
"Press <c-d> to switch to filename only search instead of full path.
"Press <c-r> to switch to regexp mode.
"Use <c-j>, <c-k> or the arrow keys to navigate the result list.
"Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
"Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
"Use <c-y> to create a new file and its parent directories.
"Use <c-z> to mark/unmark multiple files and <c-o> to open them.
"Run :help ctrlp-mappings or submit ? in CtrlP for more mapping help.
"Change t0he default mapping and the default command to invoke CtrlP:
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"When invoked without an explicit starting directory, CtrlP will set its local working directory according to this variable:

let g:ctrlp_working_path_mode = 'ra'
"'c' - the directory of the current file.
"'a' - the directory of the current file, unless it is a subdirectory of the cwd
"'r' - the nearest ancestor of the current file that contains one of these directories or files: .git .hg .svn .bzr _darcs
"'w' - modifier to "r": start search from the cwd instead of the current file's directory
"0 or '' (empty string) - disable this feature.

"If none of the default markers (.git .hg .svn .bzr _darcs) are present in a project, you can define additional ones with g:ctrlp_root_markers:
"let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']
"If more than one mode is specified, they will be tried in order until a directory is located.

"Exclude files and directories using Vim's wildignore and CtrlP's own g:ctrlp_custom_ignore. If a custom listing command is being used, exclusions are ignored:

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn|rvm)$','file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$'}
"Use a custom file listing command:
"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
"Ignore files in .gitignore
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
"Check :help ctrlp-options for other options.
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1


""""""""""""""""""""""""""""""
" CtrlP-funky {{{2
""""""""""""""""""""""""""""""
"模糊搜索当前文件中所有函数
"Bundle 'tacahiroy/ctrlp-funky'
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']



""""""""""""""""""""""""""""""
" HTML Tidy (Tidy) {{{2
""""""""""""""""""""""""""""""
"if g:isWin == 1
"	let Tidy_Cmd = $VIMRUNTIME . "/unix/tidy.exe"
"	let Tidy_Para = " -q -i --show-errors 0 -config "
"	let Tidy_Config_File = $VIMRUNTIME . "/unix/Tidy_HTML.CFG"
"else
"	let Tidy_Cmd = '/usr/bin/tidy'
"endif
"function! Tidy(...)
"call 
"endfunction
"map <silent> <leader>vg :!$VIMRUNTIME -q -i --show-errors 0 -config $Tidy_Config -raw<cr>
"vmap <silent> <leader>vg :!$VIMRUNTIME -q -i --show-errors 0 -config $Tidy_Config -raw<cr>
"map <silent> <leader>vg :!$Tidy_Cmd -q -i --show-errors 0 -config $Tidy_Config -raw<cr>
"vmap <silent> <leader>vg :!$Tidy_Cmd -q -i --show-errors 0 -config $Tidy_Config -raw<cr>

"map <leader>vg :%!tidy -q -i --show-errors 0 -config d:\Tools\Office\vim\Tidy_HTML_nowrap_noindent.CFG -raw<cr>
"vmap <leader>vg :!tidy -q -i --show-errors 0 -config d:\Tools\Office\vim\Tidy_HTML_nowrap_noindent.CFG -raw<cr>

"tidy帮助 :r!tidy -?
map <leader>vg :%!tidy -q --show-errors 0 -w 0 -i -utf8 -ashtml
vmap <leader>vg :!tidy -q --show-errors 0 -w 0 -i -utf8 -ashtml

"let g:js_indent = $VIMRUNTIME . "/indent/javascript.vim"
"let g:js_indent_log = 0

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

"只用utf-8编码，格式化html代码
"tidy ,vg
"先去行首，在合并所有行,vh,vJ
"再执行全部换行 %s/>\s*</>\r</gg
"去掉属性,ra
"再格式化 gg=G

"去掉html中的属性，默认有alt class style
map <Leader>ra :exec '%s/' . input("Attributes to remove?","\\(alt\\\|class\\\|style\\)") . '="[^"]*"'<CR>
"全部换行 %s/>\s*</>\r</gg
map <Leader>rr :%s/>\s*</>\r</gg

" zz regexp 正则表达式 {{{2
"/word\c 查找的时候不区分大小写 设置之中可以set ic或者set noic
"/word\C 查找的时候区分大小写
"/\<word\> 查找整字

". 匹配任意一个字符
"[abc] 匹配方括号中的任意一个字符。可以使用-表示字符范围， 如[a-z0-9]匹配小写字母和阿拉伯数字。
"[^abc] 在方括号内开头使用^符号，表示匹配除方括号中字符之外的任意字符。
"\d 匹配阿拉伯数字，等同于[0-9]。
"\D 匹配阿拉伯数字之外的任意字符，等同于[^0-9]。
"\x 匹配十六进制数字，等同于[0-9A-Fa-f]。
"\X 匹配十六进制数字，等同于[^0-9A-Fa-f]。
"\w 匹配单词字母，等同于[0-9A-Za-z_]。
"\W 匹配单词字母之外的任意字符，等同于[^0-9A-Za-z_]。
"\t 匹配字符。
"\s 匹配空白字符，等同于[ \t]。
"\S 匹配非空白字符，等同于[^ \t]。
"\a 所有的字母字符. 等同于[a-zA-Z]
"\l 小写字母 [a-z]
"\L 非小写字母 [^a-z]
"\u 大写字母 [A-Z]
"\U 非大写字母 [^A-Z]
"\r 匹配回车符
"\n 匹配换行符


"另外，如果要查找字符 *、.、/等，则需要在前面用 \ 符号，表示这不是元字符，而只是普通字符而已。
"元字符 说明
"\* 匹配 * 字符。
"\. 匹配 . 字符。
"\/ 匹配 / 字符。
"\\ 匹配 \ 字符。
"\[ 匹配 [ 字符。

"h ordinary-atom
"普通匹配原 ~ magic nomagic	匹配 ~
"^|	^	^	行首 (在模式起始) |/zero-width|
"\^|	\^	\^	按本义出现的 '^'
"\_^|	\_^	\_^	行首 (用于任何地方) |/zero-width|
"$|	$	$	行尾 (在模式结尾) |/zero-width|
"\$|	\$	\$	按本义出现的 '$'
"\_$|	\_$	\_$	行尾 (用于任何地方) |/zero-width|
".|	.	\.	任何单个字符 (不包括换行)
"\_.|	\_.	\_.	任何单个字符，包括换行，跨行
"\<|	\<	\<	单词的起始 |/zero-width|
"\>|	\>	\>	单词的结尾 |/zero-width|
"\zs|	\zs	\zs	任何字符，设定匹配部分起始
"\ze|	\ze	\ze	任何字符，设定匹配部分结束
"\%^|	\%^	\%^	文件首 |/zero-width|
"\%$|	\%$	\%$	文件尾 |/zero-width|
"\%V|	\%V	\%V	可视区域内 |/zero-width|
"\%#|	\%#	\%#	光标位置 |/zero-width|
"\%'m|	\%'m	\%'m	位置标记 m 的位置 |/zero-width|
"\%l|	\%23l	\%23l	在第 23 行 |/zero-width|
"\%c|	\%23c	\%23c	在第 23 列 |/zero-width|
"\%v|	\%23v	\%23v	在虚拟第 23 列 |/zero-width|

"/\%d|	\%d	\%d	匹配用十进制指定的字符 (如 \%d123)
"/\%x|	\%x	\%x	匹配用十六进制指定的字符 (如 \%x2a)
"/\%o|	\%o	\%o	匹配用八进制指定的字符 (如 \%o040)
"/\%u|	\%u	\%u	匹配指定的多字节字符 (如 \%u20ac)
"/\%U|	\%U	\%U	匹配指定的巨大多字节字符 (如 \%U12345678)
"默认为贪婪模式
"\{n,m}	匹配 n 至 m 个前面的匹配原。尽可能多
"\{n}	匹配 n 个前面的匹配原
"\{n,}	匹配至少 n 个前面的匹配原。尽可能多
"\{,m}	匹配 0 至 m 个前面的匹配原。尽可能多
"\{}	匹配 0 个以上前面的匹配原。尽可能多 (和 * 等价)

"\{-n,m}	匹配 n 至 m 个前面的匹配原。尽可能少
"\{-n}	匹配 n 个前面的匹配原
"\{-n,}	匹配至少 n 个前面的匹配原。尽可能少
"\{-,m}	匹配 0 至 m 个前面的匹配原。尽可能少
"\{-}	匹配 0 个以上前面的匹配原。尽可能少，


"call plug#begin('~/.vim/plugged')

call plug#begin('$Vim/vimfiles/plugged')
" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align

" Any valid git URL is allowed

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'davidhalter/jedi-vim' 
"Plug 'davidhalter/jedi-vim' 
Plug 'airblade/vim-gitgutter'
"Plug 'tpope/vim-fugitive'
"Plug 'dkprice/vim-easygrep'
"Plug 'vim-scripts/EasyGrep'
"Plug 'conweller/findr.vim'
"Plug 'yegappan/findstr'
"Plug 'mileszs/ack.vim'
"Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'https://gitee.com/zgpio/LeaderF.git'
Plug 'https://gitee.com/snowindz/vim-gitgutter.git'
Plug 'git://github.com/dyng/ctrlsf.vim.git'
" On-demand loading

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()
"增加python的运行f5快捷键
filetype plugin on
" 按 F5 执行当前 Python 代码"
map <F6> :call PRUN()<CR>
func! PRUN()
    exec "w" 
    if &filetype == 'python'
        exec "!python %"
    endif
endfunc
"jedi的配置测试
let g:jedi#auto_initialization = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"




au FileType dosini setl fdl=0
"au FileType txt  setl fdl=1
"set ff=unix,dos
":%s/^A//g
function! TabMessage()
"function! TabMessage(cmd)
  redir => message
let cmdd=input("请输入:")
  silent execute cmdd
  "silent execute a:cmd
  redir END
  tabnew
  silent put=message
  set nomodified
endfunction
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)
map <F1> :call TabMessage()<CR>
"qq聊天记录处理程序
function! Dealwithqqy()
"let cmd=input("请输入":)
  silent execute '!dos2unix %<CR>'
  "silent execute !dos2unix %
  "实现txt中^M的自动替换
  :%s###ge
  :%s###ge
  "删除所有的空格
  :%s/\s\+//ge
  :g/^$/d
  "execute 's#\vpdf##g<CR>'
  "silent execute a:cmd
  "tabnew
  "silent put=message
  "set n0omodified
endfunction
command! -nargs=0 -complete=command Dealwithqqy call Dealwithqqy(<q-args>)
map <F2> :call Dealwithqqy()<CR>


function! TabMessage2()
"function! TabMessage(cmd)
  "redir => message
  let @x=''
let cmdd2=input("请输入:")
  "silent execute cmdd
  "silent execute a:cmd
  ":execute "g#" . cmdd2 . ".*\\n.\\+#norm " . "\"Xy2j"
let realtime=strftime("%F")
  let nowtime=strftime("%y%m%d")
"strftime("%F")
  :execute "g#" . cmdd2 . "\.\*\\n\.\\+#norm " . "\"Xy2j"  
  ":execute "g#" . cmdd2 . "\.\*\\n\.\\+#norm " . "@Xy2j"  
"@赫觅忒g/xxx.*\n.\+/norm "Xy2j
  "redir END
  tabnew
  :sleep 1
  :normal "Xp
  :sleep 1
  :execute "w " . cmdd2 . nowtime . "\.txt"
  ":execute "w " . cmdd2 . 11 . realtime . "\.txt"
  "silentnt put=message
  "set nomodified
endfunction
command! -nargs=+ -complete=command TabMessage2 call TabMessage2(<q-args>)
map <F4> :call TabMessage2()<CR>




function! TabMessage3()
"function! TabMessage(cmd)
  "redir => message
  let @x=''
let cmdd3=input("请输入:")
  "silent execute cmdd
  "silent execute a:cmd
  ":execute "g#" . cmdd2 . ".*\\n.\\+#norm " . "\"Xy2j"

  :execute "g#" . cmdd3 . "\.\*\\n\.\\+#norm " . "\"Xyy"  
  ":execute "g#" . cmdd2 . "\.\*\\n\.\\+#norm " . "@Xy2j"  
"@赫觅忒g/xxx.*\n.\+/norm "Xy2j
  "redir END
  tabnew
  let nowtime=strftime("%y%m%d")
  :sleep 1
  :normal "Xp
  :sleep 1
  :execute "w " . cmdd3 . nowtime . "\.txt"
  "silentnt put=message
  "set nomodified
endfunction
command! -nargs=+ -complete=command TabMessage2 call TabMessage2(<q-args>)
map <F10> :call TabMessage3()<CR>






hi cursor guifg=NONE guibg=Orange
hi cursorIM guifg=NONE guibg=Green
" 禁止光标闪
set gcr=a:block-blinkon0
" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
" 启动 vim 时自动全屏
autocmd VimEnter * call ToggleFullscreen()

if has('gui_running') && has("win32")
map <F12> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif
imap <F12> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
au GUIEnter * simalt ~x
"@赫觅忒g/xxx.*\n.\+/norm "Xy2j
function! TabMessage()
"function! TabMessage(cmd)
  redir => message
let cmdd=input("请输入:")
  silent execute cmdd
  "silent execute a:cmd
  redir END
  tabnew
  silent put=message
  set nomodified
endfunction
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)
map <F1> :call TabMessage()<CR>
"让文本逆序
":g/^/mo0
" copy  到 vimrc 里就可以了
set viminfo+=!  " Save and restore global variables.
set sessionoptions=sesdir,help,tabpages,winsize,winpos,folds,resize
let $VIMSESSION = '~/session.vim'
autocmd VimLeave * mksession! $VIMSESSION
autocmd VimLeave * let save_cursor = getpos(".")
autocmd VimEnter  call setpos('.', save_cursor)
nmap	<F7>	:so $VIMSESSION<cr>
"nmap <F6> :exec 'start "C:\Program Files\AutoHotkey\AutoHotkey.exe" %'
nmap <F6> :exec 'silent !start "C:\Program Files (x86)\AutoHotkey\AutoHotkey.exe" "%"'

colorscheme solarized

func SetTitle()
let $appname=input("请输入程序名:")
let $apppath=input("请输入程序路径:")
call setline(1,"[Version]")
call append(line("."),"Signature=CHICAGO")
call append(line(".")+1,"Provider=lj")
call append(line(".")+2,"[DefaultInstall]")
call append(line(".")+3,"AddReg=1_AddReg")
call append(line(".")+4,"[1_AddReg]")
call append(line(".")+5,"HKLM,\"Software\\Microsoft\\Windows\\CurrentVersion\\Run\",\".$appname\"")
"call append(line(".")+5,"HKLM,\"Software\\Microsoft\\Windows\\CurrentVersion\\Run\",\"".$appname)
"call append(line(".")+5,"HKLM,\"Software\\Microsoft\\Windows\\CurrentVersion\\Run\",".$appname)
endfunc
map <F7> :call SetTitle()<CR>
func Newdir()
let newdirname=input("请输入新建文件夹批处理文件名:")
tabnew
:%normal Imkdir 
:set fenc=gbk
:w

":w
:w! test.bat
:sleep
:!test.bat
":!cmd /c test.bat
endfunc
map <F9> :call Newdir()<CR>

" 当新建 .h .c .hpp .cpp .mk .sh等文件时自动调用SetTitle 函数
autocmd BufNewFile *.[ch],*.hpp,*.cpp,Makefile,*.mk,*.sh exec ":call SetTitle2()" 
" 加入注释 
func SetComment()
	call setline(1,"/*================================================================") 
	call append(line("."),   "*   Copyright (C) ".strftime("%Y")." Sangfor Ltd. All rights reserved.")
	call append(line(".")+1, "*   ") 
	call append(line(".")+2, "*   文件名称：".expand("%:t")) 
	call append(line(".")+3, "*   创 建 者：LuZhenrong")
	call append(line(".")+4, "*   创建日期：".strftime("%Y年%m月%d日")) 
	call append(line(".")+5, "*   描    述：") 
	call append(line(".")+6, "*")
	call append(line(".")+7, "================================================================*/") 
	call append(line(".")+8, "")
	call append(line(".")+9, "")
endfunc
" 加入shell,Makefile注释
func SetComment_sh()
	call setline(3, "#================================================================") 
	call setline(4, "#   Copyright (C) ".strftime("%Y")." Sangfor Ltd. All rights reserved.")
	call setline(5, "#   ") 
	call setline(6, "#   文件名称：".expand("%:t")) 
	call setline(7, "#   创 建 者：LuZhenrong")
	call setline(8, "#   创建日期：".strftime("%Y年%m月%d日")) 
	call setline(9, "#   描    述：") 
	call setline(10, "#")
	call setline(11, "#================================================================")
	call setline(12, "")
	call setline(13, "")
endfunc 
" 定义函数SetTitle，自动插入文件头 
func SetTitle2()
	if &filetype == 'make' 
		call setline(1,"") 
		call setline(2,"")
		call SetComment_sh()
 
	elseif &filetype == 'sh' 
		call setline(1,"#!/system/bin/sh") 
		call setline(2,"")
		call SetComment_sh()
		
	else
	     call SetComment()
	     if expand("%:e") == 'hpp' 
		  call append(line(".")+10, "#ifndef _".toupper(expand("%:t:r"))."_H") 
		  call append(line(".")+11, "#define _".toupper(expand("%:t:r"))."_H") 
		  call append(line(".")+12, "#ifdef __cplusplus") 
		  call append(line(".")+13, "extern \"C\"") 
		  call append(line(".")+14, "{") 
		  call append(line(".")+15, "#endif") 
		  call append(line(".")+16, "") 
		  call append(line(".")+17, "#ifdef __cplusplus") 
		  call append(line(".")+18, "}") 
		  call append(line(".")+19, "#endif") 
		  call append(line(".")+20, "#endif //".toupper(expand("%:t:r"))."_H") 
 
	     elseif expand("%:e") == 'h' 
	  	call append(line(".")+10, "#pragma once") 
	     elseif &filetype == 'c' 
	  	call append(line(".")+10,"#include \"".expand("%:t:r").".h\"") 
	     elseif &filetype == 'cpp' 
	  	call append(line(".")+10, "#include \"".expand("%:t:r").".h\"") 
	     endif
	endif
endfunc

	
set splitright    "新打开的窗口放在右边
inoremap jj <ESC>
"Ack和rg
let g:ackprg = 'rg '
nnoremap <A-s> :Ack<space>
let g:EclimLocateFileNonProjectScope = 'ag'
com! -nargs=0 SmallFont :let &gfn=substitute(&gfn,"\\(\\D*\\)\\(\\d\\+\\)", "\\=submatch(1).(submatch(2)-2)","")
com! -nargs=0 LargeFont :let &gfn=substitute(&gfn,"\\(\\D*\\)\\(\\d\\+\\)", "\\=submatch(1).(submatch(2)+2)","")
autocmd BufRead *.html call Dealwithhtml()
function! Dealwithhtml()
"exec "Normal /comment-ti\<CR>" *.html call Dealwithhtml()
"function! Dealwithhtml()
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
"默认编码部分
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,chinese,gb18030,gbk,cp936,big5,euc-jp,euc-kr,latin1
	silent exe "sleep 3000m"
execute "normal 100G"
execute "normal /分类\<CR>"

	silent exe "sleep 300m"
endfunction

# 第一次使用magit修改
# 第二次使用magit 很爽，使用了思否一曲广陵散的教程