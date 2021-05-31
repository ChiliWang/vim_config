" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in 


" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'. Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible

set ffs=unix,dos,mac
set ff=unix

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
syntax on " 语法高亮
endif
"colorscheme ron " elflord ron peachpuff default 设置配色方案，vim自带的配色方案保存在/usr/share/vim/vim72/colors目录下

" detect file type
filetype on
filetype plugin on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"have Vim load indentation rules and plugins according to the detected filetype
"filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.

"set ignorecase " 搜索模式里忽略大小写
"set smartcase " 如果搜索模式包含大写字符，不使用 'ignorecase' 选项。只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用。
set autowrite " 自动把内容写回文件: 如果文件被修改过，在每个 :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、:!、:make、CTRL-] 和 CTRL-^命令时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9} 命令转到别的文件时亦然。
"set autoindent " 设置自动对齐(缩进)：即每行的缩进值与上一行相等；使用 noautoindent 取消设置
"set smartindent " 智能对齐方式
set tabstop=4 " 设置制表符(tab键)的宽度
set softtabstop=4 " 设置软制表符的宽度
set shiftwidth=4 " (自动) 缩进使用的4个空格
"set cindent " 使用 C/C++ 语言的自动缩进方式
"set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s "设置C/C++语言的具体缩进方式
"set backspace=2 " 设置退格键可用
set showmatch " 设置匹配模式，显示匹配的括号
set linebreak " 整词换行
set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去
"set hidden " Hide buffers when they are abandoned
set mouse=i " Enable mouse usage (all modes) "使用鼠标
set number " Enable line number "显示行号
set previewwindow " 标识预览窗口
set history=50 " set command history to 50 "历史记录50条
set formatoptions-=cro "disable auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o "disable auto comment
set fo-=cro
"set noautoindent
"set nocindent

"
"--状态行设置--
set laststatus=2 " 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
set ruler " 标尺，用于显示光标位置的行号和列号，逗号分隔。每个窗口都有自己的标尺。如果窗口有状态行，标尺在那里显示。否则，它显示在屏幕的最后一行上。

"--命令行设置--
set showcmd " 命令行显示输入的命令
set showmode " 命令行显示vim当前模式

"--find setting--
set incsearch " 输入字符串就显示匹配点
set hlsearch

"===========================================================
"===========================================================
"-- Cscope setting --
if has("cscope")
set csprg=/usr/bin/cscope " 指定用来执行cscope的命令
set csto=0 " 设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库
set cst " 同时搜索cscope数据库和标签文件
set cscopequickfix= " 不使用QuickFix窗口来显示cscope查找结果,直接显示候选项，否则需要输入命令cw显示,如果不生效需要在cscope.vim中注释
set nocsverb
if filereadable("cscope.out") " 若当前目录下存在cscope数据库，添加该数据库到vim
cs add cscope.out
elseif $CSCOPE_DB != "" " 否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim
cs add $CSCOPE_DB
endif
set csverb
endif


"""""""""""""""""""""""" cscope """"""""""""""""""""""""""""""""""""""""
map <F4> :cscope -Rbkq ; cs add cscope.out <CR><CR><CR> :cs reset<CR>
imap <F4> <ESC>: cscope -Rbkq; cs add cscope.out <CR><CR><CR> :cs reset<CR>

"s: 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
"g: 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
"d: 查找本函数调用的函数
"c: 查找调用本函数的函数
"t: 查找指定的字符串
"e: 查找egrep模式，相当于egrep功能，但查找速度快多了
"f: 查找并打开文件，类似vim的find功能
"i: 查找包含本文件的文
"将:cs find c等Cscope查找命令映射为<C-_>c等快捷键（按法是先按Ctrl+Shift+-, 然后很快再按下c）
nmap <C-M> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-G> :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-H> :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-C> :cs find c <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-G> :cs find t <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-E> :cs find e <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
"nmap <C-F> :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-I> :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>

"===========================================================
"===========================================================
"--ctags setting--
"" 按下F5重新生成tag文件，并更新taglist
map <F5> :!ctags -R --c-kinds=+cdefglmnpstuvx --c++-kinds=+cdefglmnpstuvx  --fields=+ialS --extra=+q . ; cscope -Rbkq ;  <CR><CR> :TlistUpdate<CR>
imap <F5> <ESC>:!ctags -R  --c-kinds=+cdefglmnpstuvx --c++-kinds=+cdefglmnpstuvx --fields=+ialS --extra=+q . ; cscope -Rbkq ;  <CR><CR> :TlistUpdate<CR>
set tags=tags

"===========================================================
"===========================================================
"--Tlist setting--
 " 按F10按钮，在窗口的左侧出现taglist的窗口,像vc的左侧的workpace
  nnoremap <silent> <F10> :TlistToggle<CR><CR>
 " " :Tlist              调用TagList
  let Tlist_Show_One_File=0                    " 只显示当前文件的tags
  let Tlist_Exit_OnlyWindow=1                  "
 " 如果Taglist窗口是最后一个窗口则退出Vim
  let Tlist_Use_Right_Window=0               " 在右侧窗口中显示
  let Tlist_File_Fold_Auto_Close=1             " 自动折叠
"是否一直处理tags.1:处理;0:不处理
  let Tlist_Process_File_Always=1 "实时更新tags
  let Tlist_Inc_Winwidth=0
  let Tlist_Ctags_Cmd="/usr/bin/ctags" "将taglist与ctags关联  


"===========================================================
"===========================================================
	"" winManager setting
	 
	"设置界面分割
	let g:winManagerWindowLayout = "FileExplorer|BufExplorer"
	"   
	"设置winmanager的宽度，默认为25
	"       
	let g:winManagerWidth = 30
    let g:bufExplorerMaxHeight=30

	"           
	"定义打开关闭winmanager按键
	"            
	nmap <silent> <F8> :WMToggle<cr>
	"set auto open Winmanager
	let g:AutoOpenWinManager = 1 

	let Tlist_Auto_Open=1
""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=1        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
let g:bufExplorerDisableDefaultKeyMapping =0 " Do not disable default key mappings.
nnoremap <silent> <F9> :BufExplorer<CR>


	set fo-=cro
	set tags+=./tags,./../tags,./*/tags
	set tags+=~/.vim/tags/c_cpp_tags
	set tags+=~/.vim/tags/cpp_src_tags
	set tags+=~/.vim/tags/cpp_tags
	set mouse=a

	"""""""""""""""""""""""""""""""""""""""""""""""" Vundle   """"""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                 	     " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"YCM not support in vim80, disable it
"Bundle 'Valloric/YouCompleteMe'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'scrooloose/nerdcommenter'
Plugin 'taghighlight'
"Plugin 'thinktainer/omnicppcomplete'
Plugin 'Shougo/neocomplete.vim'
Plugin 'mbbill/echofunc'
Plugin 'jiangmiao/auto-pairs'
Plugin 'DoxygenToolkit.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ackyshake/VimCompletesMe'
Plugin 'godlygeek/tabular'
Plugin 'Yggdroot/indentLine'
let g:indentLine_noConcealCursor = 0
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_term = 239
let g:indentLine_char = '┊'
Plugin 'brookhong/cscope.vim'

"below error
"Plugin 'Yggdroot/LeaderF'
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

""""""""""""""""""""""""""""""""""""""highlighting """"""""""""""""""""""""""""""""""
if has("TagHighLight")
UpdateTypesFile
endif

set path=./**

""""""""""""""" doxygen""""""""""""""""""""""""""""
let g:doxygenToolkit_authorName="Chili.Wang"
let g:DoxygenToolkit_briefTag_funcName="yes"
map <leader>da :DoxAuthor<CR>
map <leader>df :Dox<CR>
map <leader>db :DoxBlock<CR>
map <leader>dc a <LEFT><LEFT><LEFT>

let g:DoxygenToolkit_briefTag_funcName = "yes{"

" for C++ style, change the '@' to '\'
"let g:DoxygenToolkit_commentType = "C++"
let g:DoxygenToolkit_briefTag_pre = " brief: "
let g:DoxygenToolkit_templateParamTag_pre = " param: "
let g:DoxygenToolkit_paramTag_pre = " param: "
let g:DoxygenToolkit_returnTag = " return: "
let g:DoxygenToolkit_throwTag_pre = " throw " " @exception is also valid
let g:DoxygenToolkit_fileTag = " file "
let g:DoxygenToolkit_dateTag = " date "
let g:DoxygenToolkit_authorTag = " author "
let g:DoxygenToolkit_versionTag = " version "
let g:DoxygenToolkit_blockTag = " name "
let g:DoxygenToolkit_classTag = " class "
"let g:doxygen_enhanced_color = 1
let g:load_doxygen_syntax = 1
let g:DoxygenToolkit_blockHeader="/**\n*****************************************************************************"
let g:DoxygenToolkit_blockFooter="\n *****************************************************************************/"
let g:DoxygenToolkit_startCommentTag = ""
let g:DoxygenToolkit_interCommentTag = "*"
let g:DoxygenToolkit_endCommentTag = ""
let g:DoxygenToolkit_startCommentBlock = ""
let g:DoxygenToolkit_interCommentBlock = "* "
let g:DoxygenToolkit_endCommentBlock = ""
"""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""neocomplete"""""""""""""""""""""""""""""""""""""""""""""""""""""	
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

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
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.  
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
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

"""""""""""""""""""""""""" ctrlp """"""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_regexp=1
let g:ctrlp_by_filename=1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:30'
let g:ctrlp_use_caching = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.out,*.o


"""""""""""Nerd commenter"""""""""""
let mapleader=","



	""""""""""""""""" disable omini """""""""""""""""
	filetype plugin off
    set omnifunc=



""""""""""""""""""""""""""""""""""""""""""hight ligth cusor""""""""""""""""""""""""""

	set cursorline
	highlight CursorLine cterm=none ctermbg=236
	highlight CursorColumn cterm=none ctermbg=236 
	
	highlight Pmenu guibg=brown gui=bold
	highlight CursorLine cterm=none ctermbg=236
	highlight CursorColumn cterm=none ctermbg=236
	color elflord
	colorscheme evening

	set relativenumber
	set background=dark
	hi PmenuSel ctermbg=lightblue
	"""""""""""""""""vim completer me"""""""""""""""""
	autocmd FileType vim let b:vcm_tab_complete = 'vim'
	setlocal complete=.,w,b,u,t
