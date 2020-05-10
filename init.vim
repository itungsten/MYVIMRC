" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|
"
" Author: @tungsten
" Reference: @theniceboy
" ===
" === 总思想
" ===
"让麻烦的按键变得简单
"让简单但是常用的按键更加简单
"总键位不超过3，同一键不超过2



" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"Attention Please!!!
" ===
" === machine related stuff to change
" ===
let s:plugins_path='D:\Neovim\share\nvim\pluggedd'
let s:plug_vim_path='C:/Users/tungsten/AppData/Local/nvim/autoload/plug.vim'
let g:python3_host_prog='C:\Users\tungsten\AppData\Local\Programs\Python\Python38\python.exe'
let g:python_host_prog='C:\Users\tungsten\AppData\Local\Programs\Python\Python38\python.exe'
let g:tagbar_ctags_bin = 'D:/ctags/ctags.exe'
let g:undodir_path='C:/Users/tungsten/undofile'
source C:/Users/tungsten/AppData/Local/nvim/md-snippets.vim
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


" ===
" === 最基本的操作
" ===
set nocompatible "取消与vi的兼容，减少bug，提高功能
filetype on
filetype plugin on
filetype plugin indent on "文件类型识别，是很多相应插件工作的基础


" ===
" === 自动下载plug.vim
" ===
if empty(glob(s:plug_vim_path))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


            " ===
            " === 有关显示的设置
            " ===


" ===
" === 语言和乱码
" ===
"设置文件的编码形式 utf8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
"vim的菜单乱码解决
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"vim提示信息乱码的解决
language messages zh_CN.utf-8
"设置中文帮助
set helplang=cn


" ===
" === 基本组件
" ===
set go= "不要图形按钮
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set nu      "设置显示行号
set cursorline "显示光标行
set mouse= "设置在任何模式下鼠标都不可用 设置为"a"是全部可以使用
set ruler "在编辑过程中，在右下角显示光标位置的状态行
" set rnu   "相对行号
" set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "显示文件名：总行数，总的字符数,这里被airline覆盖了
" set cursorcolumn "启用光标列


" ===
" === 查找/替换相关设置 
" ===
set nohlsearch "不高亮显示查找结果
set incsearch "增量查找
set ignorecase "忽略大小写，但是与下面的智能大小写可以同时使用(如果你输入的时候考虑了大小写
set smartcase



" ===
" === 显示
" ===
syntax on "打开语法高亮
set showmatch "设置匹配模式，相当于括号匹配
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set guicursor+=a:blinkon0 "设置光标不闪烁
set fdm=indent "foldmethod
" set foldlevel=99


" ===
" === 编辑
" ===
set autoindent "设置自动对齐
set smartindent "智能对齐
set softtabstop=4   "insert模式下插入几个字符
set tabstop=4       "设置tab的跳数
set expandtab       "设置使用空格作为缩进否则是制表符
set shiftwidth=4    "使用空格作为缩进的宽度
set formatoptions-=tc
set backspace=2
" 0 same as “:set backspace=” (Vi compatible)
" 1 same as “:set backspace=indent,eol”
" 2 same as “:set backspace=indent,eol,start”


" ===
" === 持久化
" ===
set noswapfile "I write down per second
set nobackup  "I have git
if has('persistent_undo')
	set undofile
	set undodir=undodir_path
else 
    set noundofile
endif
" silent !mkdir -p ~/.config/nvim/tmp/backup
" silent !mkdir -p ~/.config/nvim/tmp/undo
" silent !mkdir -p ~/.config/nvim/tmp/sessions
" set backupdir=~/.config/nvim/tmp/backup,.
" set directory=~/.config/nvim/tmp/backup,.


call plug#begin(s:plugins_path)
" 配色主题
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
" Plug 'tomasr/molokai'

" Plug 'vim-latex/vim-latex'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
" Plug 'ycm-core/YouCompleteMe'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'dense-analysis/ale'
Plug 'dhruvasagar/vim-table-mode'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'kien/rainbow_parentheses.vim'
Plug 'sirver/UltiSnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
" Plug 'vim-scripts/fcitx.vim'
call plug#end()

" ===
" === 键盘映射
" ===
let mapleader="\<space>"

" nnoremap <leader>v :set invlist<cr>

" ''special mark to go between
" '. special mark to go last change
" g;
" g,
nnoremap <leader>' viW<esc>a"<esc>hbi"<esc>lel
nnoremap / /\v
nnoremap <leader>ch :update<Bar>silent !start chrome %:p<CR>

nnoremap <leader>yy ggVGy<C-o>
noremap ; o<esc>
noremap <leader>w :w<CR>
noremap Q :q!<CR>
noremap <C-q> :qa!<CR>

noremap <leader>/ :set splitbelow<CR>:split<CR>:res 10<CR>:term<CR>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

nnoremap <C-j> 5j
nnoremap <C-k> 5k

nnoremap <C-h> 5h
nnoremap <C-l> 5l

vnoremap <C-j> 5j
vnoremap <C-k> 5k
vnoremap <C-h> 5h
vnoremap <C-l> 5l

nnoremap <F7> :redraw<CR>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>

nnoremap <up>  <C-w>+
nnoremap <down>  <C-w>-
nnoremap <left>  <C-w><
nnoremap <right>  <C-w>>

nnoremap <leader>oo :TagbarToggle<CR>
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>uu :UndotreeToggle<CR>

nnoremap <leader>a gg=G''
autocmd BufWritePre,BufRead *.cpp normal gg=G
autocmd Filetype vim nnoremap <buffer> <leader>re :source %<CR>
autocmd Filetype markdown nnoremap <buffer> <leader>md :MarkdownPreview<CR>
nnoremap <leader>et :e $MYVIMRC<CR>

nnoremap <leader>p "+p
vnoremap <leader>y "+y
nnoremap <leader>0p "0p
nnoremap Y y$

nnoremap <silent> H 0
nnoremap <silent> L $

vnoremap <silent> H 0
vnoremap <silent> L g_
"g_ will not select the carriage return char

nnoremap < <<
nnoremap > >>

nnoremap <leader>ta :Tabular/
nnoremap <leader>gd :GitGutterToggle<CR>
nnoremap <leader><CR> :set hls!<CR>
nnoremap <leader>sp :set spell!<CR>
nnoremap <leader>mt :set scb!<CR>
nnoremap <leader>cm :!start cmd <CR>
nnoremap <leader>ma :RainbowParenthesesToggle<CR>:RainbowParenthesesLoadRound<CR>:RainbowParenthesesLoadSquare<CR>:RainbowParenthesesLoadBraces<CR>
nnoremap <leader>fl :simalt ~x<CR>
nnoremap <leader>rn :set rnu!<CR>
"nnoremap <LEADER>st :Startify<CR>

" nnoremap <silent> <Leader>f :Files<CR>
" nnoremap <silent> <Leader>b :Buffers<CR>
" nnoremap <silent> <Leader>L :Lines<CR>
" nnoremap <silent> <Leader>i :BLines<CR>

nnoremap <leader>ep : ALEPrevious<CR>
nnoremap <leader>en : ALENext<CR>
nnoremap <Leader>ei : ALEDetail<CR>

inoremap `1 <++>
nnoremap <leader><leader> <Esc>/<++><CR>:nohls<CR>c4l
" inoremap <leader><leader> <Esc>/<++><CR>:nohls<CR>c4l

nnoremap <leader>ss :%s/
 

            " ===
            " === 插件配置
            " ===


" ===
" === NERDTree
" ===
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


" ===
" === GitGutter
" ===
let g:gitgutter_map_keys = 0
let g:gitgutter_terminal_reports=0
autocmd VIMENTER *  : GitGutterDisable


" ===
" === fuzzy finder
" ===
"调用Rg进行搜索，包含隐藏文件
"command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case --hidden '.shellescape(<q-args>), 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%:hidden', '?'),
            \   <bang>0)



" ===
" === 彩虹括号
" ===
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


" ===
" === ALE
" ===
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


" ===
" === YouCompeleteMe
" ===
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']


" ===
" === SuperTab
" ===
let g:SuperTabDefaultCompletionType = '<C-n>'


" ===
" === UltiSnippets
" ===
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"


" ===
" === 色彩
" ===
set termguicolors "开启真色
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256

if has('gui_running')
    set background=light
else 
    set background=dark
endif
" color solarized
color gruvbox 
highlight Normal guibg=NONE ctermbg=None


" ===
" === 字体
" ===
set guifont=Monospace:h16
" set guifo宋体:16
" set guifont=Arial_monospaced_for_SAP:h9:cANSI
" set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
" bad fixed metrics is caused by chinese


" ===
" === table_mode
" ===
let g:table_mode_corner='|'


" ===
" === neovim/terminal
" ===
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    let g:neoterm_autoscroll = 1
    autocmd TermOpen term://* startinsert
    tnoremap <C-O> <CR>exit<CR>
endif



" ===
" === gvim
" ===
" source $VIMRUNTIME/mswin.vim
" behave mswin
" nnoremap <C-v> <C-q>


" ===
" === python
" ===
" noremap ; :


" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_path_to_chrome = "C:\Users\tungsten\AppData\Local\Google\Chrome\Application\chrome.exe"
let g:mkdp_browser = 'chrome'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
			\ 'mkit': {},
			\ 'katex': {},
			\ 'uml': {},
			\ 'maid': {},
			\ 'disable_sync_scroll': 0,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 1
			\ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
autocmd BufRead,BufNewFile *.md *.tex setlocal spell
autocmd BufLeave *.tex VimtexClean
" ===
" === latex
" ===
" let g:vimtex_view_method=''
let g:vimtex_quickfix_mode=0
let g:vimtex_enabled=1
let g:tex_flavor='latex'
set conceallevel=1
let g:tex_conceal='abdmg'
" let g:vimtex_view_general_viewer = 'mupdf'
let g:vimtex_view_general_viewer = 'Sumatra'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
let g:vimtex_view_general_options
\ = '-reuse-instance -forward-search @tex @line @pdf'
\ . ' -inverse-search "' . exepath(v:progpath)
\ . ' --servername ' . v:servername
\ . ' --remote-send \"^<C-\^>^<C-n^>'
\ . ':execute ''drop '' . fnameescape(''\%f'')^<CR^>'
\ . ':\%l^<CR^>:normal\! zzzv^<CR^>'
\ . ':call remote_foreground('''.v:servername.''')^<CR^>^<CR^>\""'

" <localleader>lt  vimtex-toc-toggle


" ===
" === trivial stuff
" ===
set hidden "自动隐藏没有保存的缓冲区，切换buffer时不给出保存当前buffer的提示
set scrolloff=5 "在光标接近底端或顶端时，自动下滚或上滚
set showtabline=2 "设置显示标签栏
set autoread "设置当文件在外部被修改，自动更新该文件
set virtualedit=block
set visualbell
set ttyfast         " should make scrolling faster
set lazyredraw      " same as above
set updatetime=500 " 自动更新
set history=500     " 保留历史记录
set autochdir       " 自动设置当前目录为正在编辑的文件所在目录
set ttimeoutlen=0   " 设置terminal mode下没有映射组合键
" set list "显示制表符
set listchars=tab:\|\ ,trail:▫
set wildmenu
set clipboard=unnamed
set wrap "设置自动换行
set viewoptions=cursor,folds,slash,unix "config mkview for dump and restore
" set linebreak "整词换行，与自动换行搭配使用


"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告 <Leader>d查看错误或警告的详细信息
"目前补全方法<C-n> <C-x>f <C-x>s
"修改有z=
"winpos winsize
"移动有(,) { .}
"[s ]s 拼写移动
"gf打开文件 go to file
"23G goto 23th-line
"cd
"<C-o> 可以快速打开上一次打开的文件
"placeholder <++>
"TOhtml
"<C-a> number+1 // in neovim ,all is selected
"zc zo zm zr zM zR zi
"set report=0

" ===
" === Functions
" ===


" ===
" === Abb
" ===
iabb mmail 1019205908@qq.com
    

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
