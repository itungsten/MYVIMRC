set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
 
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
 
 
"设置文件的代码形式 utf8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
 
"vim的菜单乱码解决
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
 
"vim提示信息乱码的解决
language messages zh_CN.utf-8
 
filetype on
filetype plugin indent on
set helplang=cn		"设置中文帮助
set history=500		"保留历史记录
"set guifont=新宋体:h22	"设置字体为Monaco，大小10
set guifont=Courier_new:h14:b:cDEFAULT
set tabstop=4		"设置tab的跳数
set expandtab
set backspace=2 	"设置退格键可用
"set nu! 		"设置显示行号
"set wrap 		"设置自动换行
set nowrap 		"设置不自动换行
set linebreak 		"整词换行，与自动换行搭配使用
"set list 		"显示制表符
set autochdir 		"自动设置当前目录为正在编辑的目录
set hidden 		"自动隐藏没有保存的缓冲区，切换buffer时不给出保存当前buffer的提示
set scrolloff=5 	"在光标接近底端或顶端时，自动下滚或上滚
"Toggle Menu and Toolbar 	"隐藏菜单栏和工具栏
"set guioptions-=m
"set guioptions-=T
set showtabline=2 	"设置显是显示标签栏
set autoread 		"设置当文件在外部被修改，自动更新该文件
set tabstop=4         
set softtabstop=4     
set shiftwidth=4     
set expandtab       
set mouse=a 		"设置在任何模式下鼠标都可用
set nobackup 		"设置不生成备份文件
"set go=				"不要图形按钮
set guioptions-=T           " 隐藏工具栏
"set guioptions-=m           " 隐藏菜单栏
 
"===========================
"查找/替换相关的设置
"===========================
set hlsearch "高亮显示查找结果
set incsearch "增量查找

 
"===========================
"状态栏的设置
"===========================
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "显示文件名：总行数，总的字符数
set ruler "在编辑过程中，在右下角显示光标位置的状态行
 
"===========================
"代码设置
"===========================
syntax on "打开语法高亮
set showmatch "设置匹配模式，相当于括号匹配
set smartindent "智能对齐
"set shiftwidth=4 "换行时，交错使用4个空格
set autoindent "设置自动对齐
set ai! "设置自动缩进
"set cursorcolumn "启用光标列
"set cursorline "设置高亮当前行(这里我注释了)
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set guicursor+=a:blinkon0 "设置光标不闪烁
set fdm=indent "
 
 

" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=21
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1



set rnu
call plug#begin('D:/vim/vim82/plugged')
" Plug 'soft-aesthetic/soft-era-vim'
" Plug 'connorholyday/vim-snazzy'
" Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'ycm-core/YouCompleteMe'
Plug 'dense-analysis/ale'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'junegunn/fzf'
" Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
" Plug 'majutsushi/tagbar'
call plug#end()

color desert

let g:SnazzyTransparent = 1
let mapleader="\<space>"
set clipboard=unnamed
set nu
set smartindent

nnoremap tt :NERDTreeToggle<CR>
noremap <leader>h <C-w>h 
noremap <leader>j <C-w>j 
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l
nnoremap <up>  <C-w>+
nnoremap <down>  <C-w>-
nnoremap <left>  <C-w><
nnoremap <right>  <C-w>>
noremap <leader>j <C-w>j 
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l
"nnoremap <leader>ff :TagbarToggle<CR>

noremap <Caps_Lock>:source $MYVIMRC<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>
nnoremap <leader>ev :e $MYVIMRC<CR>
inoremap jj <ESC>
let g:sneak#s_next = 1
let g:gitgutter_terminal_reports=0
nnoremap <leader>gd :GitGutterToggle<CR>

let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
nnoremap <C-p> :CtrlP<CR>
