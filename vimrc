"
" My Personal Vim config file
" Maintainer:	AFONSO Benjamin <hello@benjaminafonso.me>
" Last change:	2017 Jan 8
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc


" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

" Vundle settings
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" Brief help
" :PluginList	- lists configured plugins
" :PluginInstall	-install plugins; '!' to update or :PluginUpdate
" :PluginSearch xxx
" :PluginClean
" For help :h vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Files Tree
Plugin 'scrooloose/nerdtree'
" Futuristic git integration
Plugin 'tpope/vim-fugitive'
" Syntax checker
Plugin 'scrooloose/syntastic'
" Great status line
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
" Js language integration
"Plugin 'pangloss/vim-javascript'
" Autocompletion !
" Plugin 'valloric/youcompleteme'

" Solarized color themes
" Plugin 'altercation/vim-colors-solarized'

" Commenting plugin
Plugin 'scrooloose/nerdcommenter'
" Plugin 'raimondi/delimitmate'

" Plugin 'nathanaelkane/vim-indent-guides'

" Molokai Theme
" Plugin 'tomasr/molokai'

"Plugin 'flazz/vim-colorschemes'


" Git NERDTree plugin
Plugin 'xuyuanp/nerdtree-git-plugin'


" Plugin 'leafgarland/typescript-vim'
" Plugin 'magarcia/vim-angular2-snippets'
Plugin 'majutsushi/tagbar'

" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'


"""""""""""""""""""""""""""""""""""""""""""""""""""
" All the plugins must be added before this line
call vundle#end()		"required
filetype plugin indent on	"required


"syntax enable
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
colorscheme molokai

let mapleader = ","

command EditConf edit ~/.vimrc
:map <silent> <C-n> :NERDTreeToggle<CR>		" Ctrl-n to Toggle the Tree View


let g:airline#extensions#tabline#enabled = 1
:set laststatus=2 	" Fix airline when not in split mode

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Molokay Theme
"let g:molokai_original = 1
"let g:rehash256 = 1

" IdentGuides settings
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
    set nobackup		" do not keep a backup file, use versions instead
else
    set backup		" keep a backup file (restore to previous version)
    set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set nu			" Show line numbers
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        autocmd BufReadPost *
                    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

    augroup END

else

    set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
    " Prevent that the langmap option applies to characters that result from a
    " mapping.  If unset (default), this may break plugins (but it's backward
    " compatible).
    set langnoremap
endif

" Disable backup files xxx.xx~
set nobackup
set nowritebackup

" Key Bindings
" CTRL-C to copy (visual mode)
vmap <C-c> y
" " CTRL-X to cut (visual mode)
vmap <C-x> x
" " CTRL-V to paste (insert mode)
imap <C-v> <esc>P

nmap <C-n> :bn<CR>
nmap <C-p> :bp<CR>
nmap <F2> :TagbarToggle<CR>

