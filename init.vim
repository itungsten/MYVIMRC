let g:python3_host_prog='C:\Users\tungsten\AppData\Local\Programs\Python\Python38\python.exe'
let g:python_host_prog='C:\Users\tungsten\AppData\Local\Programs\Python\Python38\python.exe'

set nocompatible
" source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
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
" set guifont=新宋体:16	
" set guifont=Arial_monospaced_for_SAP:h9:cANSI
" set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
" set guifont=Monospace:h14
" bad fixed metrics is caused by chinese
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
set mouse= 		"设置在任何模式下鼠标都(bu)可用
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




" set rnu
call plug#begin('D:\Neovim\share\nvim\pluggedd')
"In terms of pluggedd, it's a mistake but I am lazy to fix it 
" Plug 'soft-aesthetic/soft-era-vim'
" Plug 'connorholyday/vim-snazzy'
" Plug 'tomasr/molokai'
" color-scheme
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'ycm-core/YouCompleteMe'
Plug 'dense-analysis/ale'
" Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'kien/rainbow_parentheses.vim'
Plug 'sirver/UltiSnips'
Plug 'honza/vim-snippets'

" Plug 'vim-scripts/fcitx.vim'
" Plug 'luochen1990/rainbow'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'tacahiroy/ctrlp-funky'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


" Plug 'junegunn/fzf'
" powerful utilities

Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'

call plug#end()


" let g:SnazzyTransparent = 1

color desert
let mapleader="\<space>"
set clipboard=unnamed
set nu
set smartindent

nnoremap <leader>tt :TagbarToggle<CR>
nnoremap <leader>nn :NERDTreeToggle<CR>

nnoremap <leader>h <C-w>h 
nnoremap <leader>j <C-w>j 
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

nnoremap <up>  <C-w>+
nnoremap <down>  <C-w>-
nnoremap <left>  <C-w><
nnoremap <right>  <C-w>>
nnoremap <leader>rv :source $MYVIMRC<CR>
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>gd :GitGutterToggle<CR>
nnoremap <leader>hl :set hls!<CR>
" inoremap jj <ESC>
" this is not used anymore I changed registersheet to implement this function

let g:sneak#s_next = 1
let g:gitgutter_terminal_reports=0

" let g:ctrlp_map = '<leader>p'
" let g:ctrlp_cmd = 'CtrlP'
" map <leader>f :CtrlPMRU<CR>
" let g:ctrlp_custom_ignore = {
"     \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
"     \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
"     \ }
" let g:ctrlp_working_path_mode=0
" let g:ctrlp_match_window_bottom=1
" let g:ctrlp_max_height=15
" let g:ctrlp_match_window_reversed=0
" let g:ctrlp_mruf_max=500
" let g:ctrlp_follow_symlinks=1
" nnoremap <C-p> :CtrlP<CR>
" nnoremap <Leader>fu :CtrlPFunky<Cr>
" " narrow the list down with a word under cursor
" nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

"<Leader>f在当前目录搜索文件
nnoremap <silent> <Leader>f :Files<CR>
"<Leader>bBuffer中的文件
nnoremap <silent> <Leader>b :Buffers<CR>
"<Leader>p在当前所有加载的Buffer中搜索包含目标词的所有行，:BLines只在当前Buffer中搜索
nnoremap <silent> <Leader>p :Lines<CR>
"<Leader>h在Vim打开的历史文件中搜索，相当于是在MRU中搜索，:History：命令历史查找
" nnoremap <silent> <Leader>h :History<CR>
"调用Rg进行搜索，包含隐藏文件
"command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case --hidden '.shellescape(<q-args>), 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%:hidden', '?'),
            \   <bang>0)

set cursorline
nnoremap <leader>fl :simalt ~x<CR>
" nnoremap <ESC> <tab>
" nnoremap <tab> <ESC> 
set noundofile
set noswapfile
set nobackup
nnoremap <leader>sp :set spell!<CR>
nnoremap <leader>mt :set scb!<CR>
" move together
nnoremap <leader>cm :!start cmd <CR>
nnoremap <leader>ma :RainbowParenthesesToggle<CR>:RainbowParenthesesLoadRound<CR>:RainbowParenthesesLoadSquare<CR>:RainbowParenthesesLoadBraces<CR>
" match

let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
" 不加入这行, 防止黑色括号出现, 很难识别
" \ ['black',       'SeaGreen3'],
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
"ale
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告 <Leader>d查看错误或警告的详细信息
nnoremap <leader>ep : ALEPrevious<CR>
nnoremap <leader>en : ALENext<CR>
nnoremap <Leader>ei : ALEDetail<CR>
autocmd VIMENTER *  : GitGutterDisable
inoremap <C-x> <C-x>s
"目前补全方法<C-n> <C-x>f <C-x>s
"修改有z=
"winpos winsize
"移动有(,) { .}
"[s ]s 拼写移动
"gf打开文件 go to file
"23G goto 23th-line
"cd
"<C-o> 可以快速打开上一次打开的文件
nnoremap <leader><leader> <Esc>/<++><CR>:noh<CR>c4l
"placeholder
"TOhtml
"<C-a> number+1 // in neovim ,all is selected
nnoremap <leader>rn :set rnu!<CR>
nnoremap <leader>uu :UndotreeToggle<CR>

nnoremap <leader>p "+p
nnoremap <leader>y "+y
"communicate with clipboard

if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif

let g:tagbar_ctags_bin = 'D:/ctags/ctags.exe'
"zc zo zm zr zM zR zi
nnoremap <leader>ta :Tabular/

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger      = "<S-Esc>"
let g:UltiSnipsJumpForwardTrigger = "<S-Esc>"
let g:UltiSnipsEditSplit="vertical"
set termguicolors
autocmd guienter * call libcallnr("vimtweak","SetAlpha",122) 

"colorscheme gruvbox
set background=dark
highlight Normal guibg=NONE ctermbg=None
