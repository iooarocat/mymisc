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
"ף��
source $HOME/vimfiles/game.vim

"����
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set encoding=utf-8"�����vim�ڲ��õı���,Vim�ڲ����е�buffer���Ĵ������ű��е��ַ����ȣ�ȫ��ʹ���������.���ԣ��������ȡbuffer�е��ļ����ݵ�ʱ�򣬱��������������Ϊ׼��������filencoding�ı��롣�Ӵ��ˡ�
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
"==================vundle��� begin===============
filetype off  
" �˴��涨Vundle��·��  
set rtp+=$HOME/vimfiles/bundle/vundle/  
call vundle#rc('$HOME/vimfiles/bundle/')  
Bundle 'gmarik/vundle'  

filetype plugin indent on  
"���·��    
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'
"��Ҫ��װthe silver searcher.
"linux��:https://github.com/ggreer/the_silver_searcher
"linux����ֱ�������װ,���������ҳ
"windows��:https://github.com/kjk/the_silver_searcher
"windows��һ���ֳɵİ�װexe��ַ:http://blog.kowalczyk.info/software/the-silver-searcher-for-windows.html,Ȼ������һ�»�������path�԰���ag.exe��������
Bundle 'rking/ag.vim'
"Bundle 'mileszs/ack.vim'
Bundle 'easymotion/vim-easymotion'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
"Bundle 'scrooloose/syntastic'
filetype plugin indent on     " required!  
"==================vundle��� end===============

"�﷨����
syntax on

"�к�
set nu

"����
"set nowrap

"���ع�����
set guioptions -=T
set guioptions -=m

"tab
set ts=2
set shiftwidth=2
"set expandtab tabת�ո�

"��������
set hlsearch

"�������Դ�Сдignore case
set ic

"����leader��
let mapleader=";"

"��ɫ
colorscheme solarized
set cursorline
hi CursorLine guibg=black guifg=white
set cursorcolumn
hi CursorColumn guibg=black 
hi Comment gui=none
hi Cursor guibg=white guifg=black

"ctrlp
"��������·��Ϊ�̶�Ŀ¼
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window = 'results:20'
let g:ctrlp_regrexp = 0

"ycm
"nnoremap <leader>g :YcmCompleter GoTo<CR> 
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"��ѡ���ı�,Ȼ���ڵ�ǰ�ı�����
map <F2> yq:i/<esc>p<cr>

"ag
map <leader>f :Ag 
"��ѡ���ı�,Ȼ��ȫ�ֲ���
map <f3> yq:iAg <esc>p<cr>
map <f4> yiwq:iAg <esc>p<cr>

"���ڿ��
map <c-d><c-d> :vertical res+3<cr>
map <c-x><c-x> :vertical res-3<cr>
"���ڸ߶�
map <c-g><c-g> :res+3<cr>
map <c-a><c-a> :res-3<cr>

"�滻�ı������е�ǰ������ڵ���:���Ƶ���Ȼ����q�������湹�� :%s /source/target/g
map <leader>r yiwq:i%s /<esc>pa//g<esc>hha


"easymotion
map <leader>q <plug>(easymotion-b)
map <leader>m <plug>(easymotion-w)
"nmap <leader>w <plug>(easymotion-overwin-w)

"����
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

"����
set guifont=Consolas:h10


