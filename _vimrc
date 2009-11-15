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
"tabռ��4���ַ����
set tabstop=4
set softtabstop=4
set shiftwidth=4

"ʹ���Զ�����ʱswitch��case��ͬһ����
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

"�Զ���λ�ϴ��ļ��༭λ��
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif

"��ʾ�������
set showmatch

""""""""""""""""""""""""""""�ַ�����/����&&����֧��""""""""""""""""""""""""""""
"�ַ�����/����
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"���Ĳ˵�֧��
set langmenu=zh_CN.utf-8
language message zh_CN.utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"""""""""""""""""""""""""""""""""������&&״̬��"""""""""""""""""""""""""""""""""
"����������:�ļ�������ǡ�������������ϵͳ
set titlestring=%f\%h%m%r%w\ -\ %{v:progname}\

"��ʾ״̬��
set laststatus=2

"״̬������:�ļ�·�����ļ�������ǡ��ļ����͡��ַ����롢�ļ���ʽ����ǰλ�á���ǰ���λ�á��ļ������������ڡ�����
set statusline=%F\ %h%1*%m%r%w%0*[%{strlen(&filetype)?&filetype:'none'},%{&encoding},%{&fileformat}]%=%-14.(%l,%c%V%)\ %<%p%%\ \ \ [%L]\ \ \ %{strftime('%y-%m-%d\ %A')}

"���벹ȫ(Ctrl-x+Ctrl-o��Ctrl-x+Ctrl-p��ʵ����صĴ��벹ȫ������ʹ��һ�������������)
"ӳ���ݼ�:<F5>ʵ��Ctrl+x-Ctrl+o���벹ȫ,<F5>�����л����벹ȫ,Alt+<F5>�����л����벹ȫ
inoremap <expr> <F5> pumvisible()?"\<Down>":"\<C-X><C-O>"
inoremap <expr> <M-F5> pumvisible()?"\<Up>":"\<M-F5>"

"ӳ���ݼ�:<F6>ʵ��Ctrl+x-Ctrl+p��ȫ,<F6>�����л���ȫ,Alt+<F6>�����л���ȫ
inoremap <expr> <F6> pumvisible()?"\<Down>":"\<C-X><C-P>"
inoremap <expr> <M-F6> pumvisible()?"\<Up>":"\<M-F6>"

"�ص����ܲ�ȫʱ��Ԥ������
set completeopt=longest,menu

"��gui�Ĺ�����ȥ��
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
"ֻ��ʾ��ǰ�ļ���tag
let Tlist_Show_One_File = 1
"���taglist���������һ�����ڣ����˳�vim
let Tlist_Exit_OnlyWindow = 1
"���Ҳര������ʾtaglist����
let Tlist_Use_Right_Window = 1
"�õ�ǰ�����༭���ļ��ķ����б��Զ��۵�����
let Tlist_File_Fold_Auto_Close=1
"ӳ���ݼ�<F11>
nmap <F11> :Tlist<cr>
"ʹtaglist�������ʾ��ߵ��۵���
let Tlist_Enable_Fold_Column = 0
"taglist���ڿ��
"let Tlist_WinWidth = 20

"winmanager
let g:winManagerWindowLayout='FileExplorer|TagList'
"ӳ���ݼ�<F12>
nmap <F12> :WMToggle<cr>

"���ļ��༭
"let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowsNavVim=1
"let g:miniBufExplMapWindowNavArrows=1

".h and .c
nnoremap <silent> <F10> :A<CR>

"grep in the project
"nnoremap <silent> <F3> :Grep<CR>

"����SuperTab����tab����cppcomplet���Զ���ȫ���ܡ�
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"�ص����ܲ�ȫʱ��Ԥ�����ڣ��������Է�ֹ��������
set completeopt=longest,menu

"���õ��û�Ԥ������namespaceʱҲ���Զ���ȫ���루��ʹ��using std::string��
let OmniCpp_DefaultNamespaces = ["std"]

"��ݼ�ӳ��
"ɾ����ĩ������ַ�
nmap <silent> <F2> :%s/\s\+$//<CR>
"��ʾ��ǰ�����Ķ���
nmap <silent> <F3> [i
"��ʽ����ǰ{}֮�ڵ��ı�
nmap <silent> <F4> =a{
"make ��ǰĿ¼���ļ�
nmap <silent> <F5> :make<CR>
"������һ���������
nmap <silent> <F8> :cnext<CR>
"�������Ĵ�����Ϣ
nmap <silent> <F6> :cc<CR>
"�����д�����Ϣ
nmap <silent> <F7> :clist<CR>
