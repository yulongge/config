"显示行号
set number
"显示语法高亮
syntax on
set fileencodings=utf-8,gb2312,gbk,cp936,latin-1
set fileencoding=utf-8
set termencoding=utf-8
set fileformat=unix
set encoding=utf-8
"启用自动对齐功能，把上一行的格式应用到下一行
set autoindent
"设置显示制表符的空格字符个数，改进tab缩进值，默认为8，现在改为4
set tabstop=4
"设置自动缩进为4个字符，程序中自动缩进所使用的空白长度
set shiftwidth=4
"显示括号匹配
set showmatch
"文件缩进及tab个数
au FileType html,python,vim,javascript setl shiftwidth=4
au FileType html,python,vim,javascript setl tabstop=4

"显示高亮搜索
set hlsearch
"突出显示当前行
set cursorline
"突出显示当前列
set cursorcolumn
"共享剪贴板
set clipboard+=unnamed
"文件被改时自动载入
set autoread
"自动保存
set autowrite
inoremap jk <esc>

"可以在buffer的任何地方使用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"显示标尺，就是在右下角显示光标位置
set ruler

"根据语法折叠
set foldenable
" 折叠方法
" " manual    手工折叠
" " indent    使用缩进表示折叠
" " expr      使用表达式定义折叠
" " syntax    使用语法定义折叠
" " diff      对没有更改的文本进行折叠
" " marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
" " 代码折叠自定义快捷键 <leader>zz
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
	if g:FoldMethod == 0
		exe "normal! zM"
		let g:FoldMethod = 1
	else
		exe "normal! zR"
		let g:FoldMethod = 0
	endif
endfun

"自动补全
"":inoremap ( ))<ESC>
filetype plugin indent on
set completeopt=longest,menu

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin '907th/vim-auto-save'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'tern_for_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'ashisha/image.vim'
Plugin 'sudar/comments.vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
"Plugin 'gabrielelana/vim-markdown'
call vundle#end()
filetype plugin indent on


"插件配置

"auto_save_vim
let g:auto_save = 1
let g:auto_save_no_updatetime = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1
let g:auto_save_keep_marks = 0
let g:vim_markdown_frontmatter = 1

"nerdtree
map <C-n> :NERDTreeToggle <CR>
imap <F3> <ESC>: NERDTreeToggle <CR>
"当打开vim且没有文件时自动打开nerdtree
autocmd vimenter * if !argc() | NERDTree | endif
"当剩Nerdtree时自动关闭
autocmd bufenter * if(winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


"nerdcommenter 注释
let g:NERDSpaceDelims=1

"markdown配置
let g:vim_markdown_frontmatter = 1
let g:markdown_enable_folding = 1
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=markdown
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript
"rkdown to HTML  
nmap md :!~/.vim/markdown.pl % > %.html <CR><CR>

"YouCompleteMe
let g:ycm_min_num_of_chars_for_completion = 3 
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_comments = 1
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

function! MyTabFunction ()
	let line = getline('.')
	let substr = strpart(line, -1, col('.')+1)
	let substr = matchstr(substr, "[^ \t]*$")
	if strlen(substr) == 0
		return "\<tab>"
	endif
		return pumvisible() ? "\<c-n>" : "\<c-x>\<c-o>"
endfunction
"inoremap <tab> <c-r>=MyTabFunction()<cr>

"rainbow parentheses
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
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
	\]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"comments.vim
"au FileType * CommentStyle #
"au FileType vim CommentStyle "
"au FileType c,css,js,sql CommentStyle /* @ */
"au FileType html CommentStyle <!-- @ -->

