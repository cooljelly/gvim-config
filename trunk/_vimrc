set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

""""""""""""""""""""""""""""Guoliang modified""""""""""""""""""""""
set nu! "line number
colorscheme fnaqevan
syntax enable
syntax on
"tab占用4个字符宽度
set tabstop=4
set softtabstop=4
set shiftwidth=4

"使得自动缩进时switch和case在同一列上
set cinoptions=:N

"file type
filetype on
filetype plugin on
filetype indent on
set nocp

"indent
set autoindent

"window maximum
"au GUIEnter * simalt ~x

"share clipboard with Windows
set clipboard+=unnamed

"close warning
set vb t_vb=

"flush the current file content automatically
set autoread

"using backspace
set backspace=2

"自动定位上次文件编辑位置
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif

"显示括号配对
set showmatch

""""""""""""""""""""""""""""字符编码/解码&&中文支持""""""""""""""""""""""""""""
"字符编码/解码
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"中文菜单支持
set langmenu=zh_CN.utf-8
language message zh_CN.utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"""""""""""""""""""""""""""""""""标题栏&&状态栏"""""""""""""""""""""""""""""""""
"标题栏设置:文件名、标记、程序名、操作系统
set titlestring=%f\%h%m%r%w\ -\ %{v:progname}\

"显示状态栏
set laststatus=2

"状态栏设置:文件路径、文件名、标记、文件类型、字符编码、文件格式、当前位置、当前相对位置、文件总行数、日期、星期
set statusline=%F\ %h%1*%m%r%w%0*[%{strlen(&filetype)?&filetype:'none'},%{&encoding},%{&fileformat}]%=%-14.(%l,%c%V%)\ %<%p%%\ \ \ [%L]\ \ \ %{strftime('%y-%m-%d\ %A')}

"代码补全(Ctrl-x+Ctrl-o和Ctrl-x+Ctrl-p能实现相关的代码补全，配置使得一个按键即可完成)
"映射快捷键:<F5>实现Ctrl+x-Ctrl+o代码补全,<F5>向下切换代码补全,Alt+<F5>向上切换代码补全
inoremap <expr> <F5> pumvisible()?"\<Down>":"\<C-X><C-O>"
inoremap <expr> <M-F5> pumvisible()?"\<Up>":"\<M-F5>"

"映射快捷键:<F6>实现Ctrl+x-Ctrl+p补全,<F6>向下切换补全,Alt+<F6>向上切换补全
inoremap <expr> <F6> pumvisible()?"\<Down>":"\<C-X><C-P>"
inoremap <expr> <M-F6> pumvisible()?"\<Up>":"\<M-F6>"

"关掉智能补全时的预览窗口
set completeopt=longest,menu

"把gui的工具栏去掉
set guioptions-=T
set guioptions-=r
set guioptions-=L

"font
"set guifont=Courier_New:h13:cANSI
set guifont=Consolas:h14:cANSI
"set guifontwide=<d0><c2><cb><ce><cc><e5>:h14:cGB2312
"set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"ctags
set tags=tags;
set autochdir
nmap <F9> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"taglist
"只显示当前文件的tag
let Tlist_Show_One_File = 1
"如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1
"在右侧窗口中显示taglist窗口
let Tlist_Use_Right_Window = 1
"让当前不被编辑的文件的方法列表自动折叠起来
let Tlist_File_Fold_Auto_Close=1
"映射快捷键<F11>
nmap <F11> :Tlist<cr>
"使taglist插件不显示左边的折叠行
let Tlist_Enable_Fold_Column = 0
"taglist窗口宽度
"let Tlist_WinWidth = 20

"winmanager
let g:winManagerWindowLayout='FileExplorer|TagList'
"映射快捷键<F12>
nmap <F12> :WMToggle<cr>

"多文件编辑
"let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowsNavVim=1
"let g:miniBufExplMapWindowNavArrows=1

".h and .c
nnoremap <silent> <F10> :A<CR>

"grep in the project
"nnoremap <silent> <F3> :Grep<CR>

"设置SuperTab，用tab键打开cppcomplet的自动补全功能。
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"关掉智能补全时的预览窗口，这样可以防止闪屏现象
set completeopt=longest,menu

"设置当用户预先声明namespace时也能自动补全代码（如使用using std::string）
let OmniCpp_DefaultNamespaces = ["std"]

"快捷键映射
"删除行末多余空字符
nmap <silent> <F2> :%s/\s\+$//<CR>
"显示当前变量的定义
nmap <silent> <F3> [i
"格式化当前{}之内的文本
nmap <silent> <F4> =a{
"make 当前目录的文件
nmap <silent> <F5> :make<CR>
"跳到下一个编译错误
nmap <silent> <F8> :cnext<CR>
"看完整的错误信息
nmap <silent> <F6> :cc<CR>
"看所有错误信息
nmap <silent> <F7> :clist<CR>
