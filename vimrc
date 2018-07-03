" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"======================================================================
"my configuration start from this line!
"Description: Optimized for C/C++ development, but useful for other things.
"Author: Yue Fang 
"reference https://gist.github.com/rocarvaj/2513367
"======================================================================

"set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=80
" turn syntax highlighting on
set t_Co=256
syntax on
" colorscheme wombat256
" turn line numbers on
set number

" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <F8> :make clean all<CR>
" goto definition with F12
map <F12> <C-]>
" in diff mode we use the spell check keys for merging

"add a highlight column agetr 'textwidth'
:set colorcolumn=+1        " highlight column after 'textwidth'
:highlight ColorColumn ctermbg=blue guibg=blue


"=============================================================
"install vundle and youcompleteme
"=============================================================
filetype off                  " required
"设置Vundle的运行路径并初始化
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle安装位置与插件路径不同时，需要Vundle插件的路径
"call vundle#begin('~/some/path/here')
"------------------要安装的插件不能写在此行前！------------------
 
"Vundle对自己的调用，不可删去
Plugin 'VundleVim/Vundle.vim'
"以下是所支持的各种不同格式的示例
"需要安装的插件应写在调用的vundle#begin和vundle#end之间
"如果插件托管在Github上，写在下方，只写作者名/项目名就行了
 
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-airline/vim-airline'
 
"如果插件来自vim-scripts(官方)，写插件名就行了
" Plugin 'L9'
 
"如果Git仓库不在Github上，需要提供完整的链接
" Plugin 'git://git.wincent.com/command-t.git'
 
"本地的插件需要提供文件路径
" Plugin 'file:///home/gmarik/path/to/plugin'
"一定要确保插件就在提供路径的文件夹中(没有子文件夹，直接在这层目录下)
"运行时目录的路径
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"避免插件间的命名冲突
"Plugin 'ascenator/L9', {'name': 'newL9'}
"------------------要安装的插件不能写在此行后！------------------
call vundle#end()            " required
filetype plugin indent on    " required
"要忽略插件缩进更改，请改用：
"filetype plugin on
"
" 安装插件的相关指令
":PluginList			- 列出已安装插件
":PluginInstall			- 安装新添加的插件;添加`!`或使用`:PluginUpdate`来更新已安装插件
":PluginSearch xxx		- 寻找名字带有xxx的插件;添加`!`刷新本地缓存
":PluginClean			- 删除已经从列表移除的插件;添加`!`静默卸载
":h						- 帮助和说明文档 
"Vundle的设置到此为止了

"disable Youcompleteme if the next command is not commentted
"let g:loaded_youcompleteme = 1





