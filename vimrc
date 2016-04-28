"""""""""""""""""""""""""""""""""  Vundle Config  """"""""""""""""""""""""""""""""" 
""""  -- how to use vundle --
""""  1. install git, curl
""""  2. $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
""""  3. edit ~/.vimrc and paste the following lines
""""  4. Launch vim and run :PluginInstall. Or just invoke `vim +PluginInstall +qall` from command line.
""""  5. See the `:h vundle` Vimdoc for more detail
""""  -- over --
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}
"
"" -- 我的Plugins --
Plugin 'taglist.vim'     "查看tag树
Plugin 'AutoClose'       "输入[, (, {, ", '的自动补全配对
Plugin 'ShowTrailingWhitespace'     "显示行末的空白字符
Plugin 'winmanager'      "文件浏览器和缓冲区管理器
"Plugin 'fholgado/minibufexpl.vim'   "buffer管理器MiniBufferExplorer(亲自验证不好用)

"Plugin 'Valloric/YouCompleteMe' "迄今位置最好的自动VIM自动补全插件了吧
Plugin 'The-NERD-tree'              "树状显示文件目录
Plugin 'The-NERD-Commenter'         "快速给代码加注释，选中，`ctrl+h`即可注释多种语言代码
Plugin 'ctrlp.vim'      "查找文件
Plugin 'matchit.zip'    "在()、""、甚至HTML标签之间快速跳转
Plugin 'EasyMotion'     "高效移动光标
"Plugin 'UltiSnips'      "解放生产力的神器，简单配置，就可以按照自己的风格快速输入大段代码(需要VIM 7.4版本)
"Plugin 'Tabular'        "让代码更加易于纵向排版，以=或,符号对齐
"Plugin 'ZenCoding.vim'  "写HTML、CSS等 (还未配置)
Plugin 'FencView.vim'   "自动识别文件编码
"" -- 我的Plugins over --

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"""""""""""""""""""""""""""""""""  Vundle Config Over """"""""""""""""""""""""""""""""" 

"""" -- 简单配置 --
set nocompatible    " VIM模式，不兼容旧式VI
syntax on           " 语法高亮
set ignorecase      " search/replace 忽略大小写
set smartcase       " 如果搜索词包含大写字母，那么ignorecase会被设为off
set hlsearch        " 高亮搜索
set incsearch       " 输入字符串就显示匹配点
set autowrite       " 自动把内容写回文件: 如果文件被修改过，在每个 :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、:!、:make、CTRL-] 和 CTRL-^命令时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9} 命令转到别的文件时亦然。

set autoindent      " 自动缩进，即缩进保持与上一行缩进量相同
set smartindent     " 智能缩进(如何智能?)
set cindent         " 使用 C/C++ 语言的自动缩进方式

set tabstop=4       " 设置制表符(tab键)的显示的宽度
set shiftwidth=4    " 每一级缩进是多少个空格
set expandtab       " 把tabs转换为空格
set smarttab        " 智能tag（根据文件中其他地方的缩进空格个数来确定一个 tab 是多少个空格)
"retab               " 若设置了expandtab则将所有 tab 扩展成空格，慎用！

set number          " 显示行号
"set nowrap          " 不换行
set ruler           " 显示标尺，即状态栏显示光标位置的行号和列号
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)    " 设置标尺格式,可以显示百分比哦

highlight LineNr  ctermbg=green
set encoding=utf-8      " 设置字符编码
set pastetoggle=<F10>   " 按此键切换set paste和set nopaste
colorscheme murphy  " 设定配色. 墨菲定律?(任何事都没有表面看起来那么简单,所有的事都会比你预计的时间长,会出错的事总会出错,如果你担心某种情况发生那么它就更有可能发生)
set mouse=a     " 使用鼠标，可以用Mac的触摸板来滑动代码，感动哭了
if has('autocmd')   " 记忆上次编辑的位置
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
let mapleader=','   " 设置map leader键
"""" -- 简单配置 OVER --

"""" -- ctags配置 --
"" 按下F5重新生成tag文件，并更新taglist
"" ctags -R后跟的选项主要是为了生成的tags文件可以与OmniCppComplete配合运作
"" --c++-kinds=+p : 为C++文件增加函数原型的标签
"" --fields=+iaS  : 在标签文件中加入继承信息(i)、类成员的访问控制信息(a)、以及函数的指纹(S)
"" --extra=+q     : 为标签增加类修饰符。注意，如果没有此选项，OmniCppComplete将不能对类成员补全
map <F5> :!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=./tags   " 在当前目录下搜索tags文件
set tags+=/usr/include/tags " 在/usr/include目录下搜索tags文件
"""" -- ctags配置 --

"""" -- taglist --
let Tlist_Exit_OnlyWindow=1  "tagList窗口是最后一个窗口，则退出Vim
let Tlist_Use_Right_Window=1 "在Vim窗口右侧显示taglist窗口
let Tlist_Sort_Type='name'   "使taglist以tag名字进行排序，缺省是按tag在文件中出现的顺序进行排序，按s可以切换
let Tlist_Auto_Open=1        "启动VIM自动打开taglist
let Tlist_File_Fold_Auto_Close=1     "使taglist只显示当前文件tag，其它文件的tag都被折叠起来
let Tlist_Process_File_Always=1      "始终解析文件中的tag,不管taglist窗口有没有打开
"let Tlist_Use_SingleClick=1  "单击tag跳转
"let Tlist_Show_One_File=1    "只显示当前文件的tags
"let Tlist_WinHeight=                "设置taglist窗口的高度和宽度
"let Tlist_WinWidth=                 "设置taglist窗口的高度和宽度
"let Tlist_Use_Horiz_Window=         "设置taglist窗口横向显示
"let Tlist_Show_One_File=1           "不同时显示多个文件的tag，缺省显示多个文件的tag
"let Tlist_Close_On_Select=1         "选择了tag后自动关闭taglist窗口
"let Tlist_GainFocus_On_ToggleOpen=1 "打开taglist使输入焦点在taglist窗口中

"" --- taglist窗口内帮助 ---
""      <enter> : 跳转到tag的定义
""      o : 新窗口跳转到tag的定义
""      p : 预览tag定义
""      <space> : 显示光标下tag的原型定义
""      u : 更新taglist窗口中的tag
""      s : 更改排序方式，在按名字排序和按出现顺序排序间切换
""      d : Remove file from taglist
""      x : taglist窗口放大和缩小，方便查看较长的tag
""      + : 打开一个折叠，同zo
""      - : 将tag折叠起来，同zc
""      * : 打开所有的折叠，同zR
""      = : 将所有tag折叠起来，同zM
""      [[ : 跳到前一个文件
""      ]] : 跳到后一个文件
""      q : 关闭taglist窗口
""      <F1> : 显示帮助
"" --- taglist窗口内帮助 over ---

"" --- 命令帮助 ---
""    :TlistOpen  打开taglist窗口
""    :TlistClose 关闭taglist窗口
""    :Tlist 或 :TlistToggle  打开/关闭taglist窗口切换
"" --- 命令帮助 over ---

map <silent> <leader>tl :TlistToggle<CR>    "按<leader>tl键切换taglist
"""" -- taglist over --

"""" -- winmanager 配置 --
""WinManager貌似会导致w、b前后移动缓慢，先关掉
""let g:winManagerWindowLayout='FileExplorer'     " 设置我们要管理的插件
""let g:persistentBehaviour=0                     " 如果所有编辑文件都关闭了，退出vim
""nmap wm :WMToggle<CR>                           " normal模式下使用wm切换WinManager
"""" -- winmanager 配置 OVER --

"""" -- MiniBufferExplorer 配置 --
" let g:miniBufExplMapWindowNavVim=1      " 按下Ctrl+h/j/k/l，可以切换到当前窗口的上下左右窗口 
" let g:miniBufExplMapWindowNavArrows=1   " 按下Ctrl+箭头，可以切换到当前窗口的上下左右窗口 
" let g:miniBufExplMapCTabSwitchBufs=1    " 启用以下两个功能：Ctrl+tab移到下一个buffer并在当前窗口打开；Ctrl+Shift+tab移到上一个buffer并在当前窗口打开
" let g:miniBufExplMapCTabSwitchWindows=1 " 启用以下两个功能：Ctrl+tab移到下一个窗口；Ctrl+Shift+tab移到上一个窗口
" let g:miniBufExplModSelTarget=1         " 不要在不可编辑内容的窗口（如TagList窗口）中打开选中的buffer
"""" -- MiniBufferExplorer 配置 OVER --

"""" -- NERDTree 配置 --
map <F2> :NERDTreeToggle<CR>    "F2切换NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif  "如果最后窗口是NERDTree则退出VIM
let NERDTreeWinPos=1            "窗口显示在右侧
"""" -- NERDTree 配置 OvER --

"   """" 配置powerline for vim
"   """" http://cenalulu.github.io/linux/mac-powerline/
"   set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim
"
"   " These lines setup the environment to show graphics and colors correctly.
"   set nocompatible
"   set t_Co=256
"
"   let g:minBufExplForceSyntaxEnable = 1
"   python from powerline.vim import setup as powerline_setup
"   python powerline_setup()
"   python del powerline_setup
"
"   if ! has('gui_running')
"      set ttimeoutlen=10
"      augroup FastEscape
"         autocmd!
"         au InsertEnter * set timeoutlen=0
"         au InsertLeave * set timeoutlen=1000
"      augroup END
"   endif
"
"   set laststatus=2 " Always display the statusline in all windows
"   set guifont=Inconsolata\ for\ Powerline:h14
"   set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
"   """" 配置powerline for vim -- OVER
