"==============function begin================
function _chdir(flag)
	let dir = ""
	if a:flag == "game"  
		let dir = "z:\\zhurong\\program\\game"
	elseif a:flag == "design" 
		let dir = "z:\\zhurong\\design"
	elseif a:flag == "etc" 
		let dir = "z:\\zhurong\\program\\etc"
	elseif a:flag == "engine"
		let dir = "z:\\zhurong\\program\\engine"
	elseif a:flag == "arkpipe"
		let dir = "Z:\\zhurong\\program\\engine\\src\\ArkPipe"
	endif
	let cmd = 'cd ' . dir
	execute(cmd)
endfunction
command! -nargs=* Mycd :call _chdir(<f-args>)

function _replaceall(s,t)
	let cmd = ':args ' . getcwd() . '\*.*'
	execute(cmd)
	let cmd = ':argdo %s/' . a:s . '/' . a:t . '/ge | update'
	execute(cmd)
	let cmd = ':args ' . getcwd() . '\**\*.*'
	execute(cmd)
	let cmd = ':argdo %s/' . a:s . '/' . a:t . '/ge | update'
	execute(cmd)
endfunction
command! -nargs=* Replaceall :call _replaceall(<f-args>)
"==============function end================
"
"祝融
source $HOME/vimfiles/game.vim

"编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set encoding=utf-8"这个是vim内部用的编码,Vim内部所有的buffer、寄存器、脚本中的字符串等，全都使用这个编码.所以，当插件读取buffer中的文件内容的时候，编码是以这个编码为准，而不是filencoding的编码。坑大发了。
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

let workingdir = "z:\\zhurong\\program\\game"
"let workingdir = "z:\\zhurong\\design"
exe 'cd ' workingdir

"===================================
function _opendir()  
    if ( expand("%") != "" )  
        execute "!start explorer /select, %"   
    else  
        execute "!start explorer /select, %:p:h"  
    endif  
endfunction  
command! -nargs=* Opendir :call _opendir()

"python path
let $PYTHONPATH = "C:\\Python27\\Lib;C:\\Python27\\DLLs;C:\\Python27\\Lib\\lib-tk"

"==================pathogen===============
"execute pathogen#infect() 
"==================vundle插件 begin===============
filetype off  
" 此处规定Vundle的路径  
set rtp+=$HOME/vimfiles/bundle/vundle/  
call vundle#rc('$HOME/vimfiles/bundle/')  
Bundle 'gmarik/vundle'  

filetype plugin indent on  
"插件路径    
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'
"先要安装the silver searcher.
"linux版:https://github.com/ggreer/the_silver_searcher
"linux可以直接用命令安装,详见上述网页
"windows版:https://github.com/kjk/the_silver_searcher
"windows版一个现成的安装exe网址:http://blog.kowalczyk.info/software/the-silver-searcher-for-windows.html,然后配置一下环境变量path以包含ag.exe就阔以了
Bundle 'rking/ag.vim'
"Bundle 'mileszs/ack.vim'
Bundle 'easymotion/vim-easymotion'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
"Bundle 'scrooloose/syntastic'
filetype plugin indent on     " required!  
"==================vundle插件 end===============

"语法高亮
syntax on

"行号
set nu

"换行
"set nowrap

"隐藏工具栏
set guioptions -=T
set guioptions -=m

"tab
set ts=2
set shiftwidth=2
"set expandtab tab转空格

"搜索高亮
set hlsearch

"搜索忽略大小写ignore case
set ic

"设置leader键
let mapleader=";"

"配色
colorscheme solarized
set cursorline
hi CursorLine guibg=black guifg=white
set cursorcolumn
hi CursorColumn guibg=black 
hi Comment gui=none
hi Cursor guibg=white guifg=black

"ctrlp
"设置搜索路径为固定目录
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window = 'results:20'
let g:ctrlp_regrexp = 0

"ycm
"nnoremap <leader>g :YcmCompleter GoTo<CR> 
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"先选中文本,然后在当前文本查找
map <F2> yq:i/<esc>p<cr>

"ag
map <leader>f :Ag 
"先选中文本,然后全局查找
map <f3> yq:iAg <esc>p<cr>
map <f4> yiwq:iAg <esc>p<cr>

"窗口宽度
map <c-d><c-d> :vertical res+3<cr>
map <c-x><c-x> :vertical res-3<cr>
"窗口高度
map <c-g><c-g> :res+3<cr>
map <c-a><c-a> :res-3<cr>

"替换文本中所有当前光标所在单词:复制单词然后在q窗口里面构造 :%s /source/target/g
map <leader>r yiwq:i%s /<esc>pa//g<esc>hha


"easymotion
map <leader>q <plug>(easymotion-b)
map <leader>m <plug>(easymotion-w)
"nmap <leader>w <plug>(easymotion-overwin-w)

"杂项
map <leader>a <esc>
vmap <leader>a <esc>
smap <leader>a <esc>
xmap <leader>a <esc>
omap <leader>a <esc>
imap <leader>a <esc>
lmap <leader>a <esc>
cmap <leader>a <esc>

imap <leader>h <esc>i
imap <leader>l <esc>la
imap <leader><leader> <leader><esc>a<esc>

"nerdtree
map <f10> :NERDTree<cr>
nn <silent><f11> :exec("NERDTree ".expand('%:h'))<CR>

"字体
set guifont=Consolas:h10


