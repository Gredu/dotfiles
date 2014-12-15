set nocompatible                " Use Vim settings, and no vi
filetype off


" Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'Yggdroot/indentLine'
Plugin 'jnurmine/Zenburn'
Plugin 'Shougo/vimshell.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'vim-scripts/VimRepress'
Plugin 'vim-scripts/Vimchant'
Plugin 'mhinz/vim-startify'
Plugin 'plasticboy/vim-markdown'
Plugin 'derekwyatt/vim-scala'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mattn/emmet-vim'

call vundle#end()

" Looks out the type of the file, and sets correct indenting
filetype plugin indent on


""""""""""""""
" Basic sets "
""""""""""""""

syntax enable                       " Syntax colors are on

" Making 'standard'
set expandtab
set tabstop=4
set shiftwidth=4

set clipboard=unnamedplus
let mapleader = "å"

set encoding=utf8
set showmatch
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
set ignorecase                  " You always want this
set smartcase                   " Smarter case search
set incsearch                   " Jumps right to the search
set nu                          " Sets numbers
set cursorline
" set guifont=Monaco\ 10
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 10
" set guifont=Monospace\ 12
set backup                      " Make backup files
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set wildignore=*.o,*.obj,*.bak,*.exe
set linespace=0
set showcmd
set nowrap
set showmode                    " Show current mode
" set autochdir                 " Always switch to the current file directory
set hidden                      " You don't have to save constantly when switching between buffers
set wildmenu                    " Enchanced completion
set hlsearch                    " Hilight the search matches
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
set laststatus=2                " Status is always on
set scrolloff=5
set foldenable                  " Autofold
set bs=2                        " Makes backspace work again
set lazyredraw                  " Don't update display while executing macros
" Powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set t_Co=256                    " Set this only if your terminal supports 256 colors
set mouse=a                     " Enable mouse
set mousehide                   " Hide when characters typed
" set spelllang=fi

" Avoid ESC timeouts in terminals
" let &t_ti.="\e[?7727h"
" let &t_te.="\e[?7727l"
" noremap <Esc>O[ <Esc>
" noremap! <Esc>O[ <Esc>


""""""""""
"Mappings"
""""""""""

" Makes it easier to edit this source
nmap <Leader>sv :so $MYVIMRC<CR>
nmap <Leader>ev :e $MYVIMRC<CR>

" Runs the current scala code
nmap <Leader>c :w <CR> :!scala %:p<CR>

" Fast swapping
nmap <C-n> :bn <CR>
nmap <C-p> :bp <CR>

" Easier in help link with Finnish keyboard
nmap <Leader>g <C-]>

" Quickly enter to command line, easier in Finnish keyboard
nmap , :

" NERDtree toggling
nmap <Leader>n :NERDTreeToggle <CR>

" Page Down and Up like WebBrowser
nmap <Space> <C-d>
nmap <S-Space> <C-u>

" Characters that needs Alt Gr to type
imap åa {
imap åf }
imap ås [
imap åd ]
imap åat @
imap ådo $
imap ådo $
imap åbs \
imap åcu ~


"""""""""""
"Behaviors"
"""""""""""

let g:zenburn_high_Contrast = 1
colors zenburn

" Start these commands only if gui is running
if has('gui_running')
	" Clearing GUI bars
	set go-=m
	set go-=T
	set go-=r
	set go-=b
	set go-=l
endif



"""""""""""
"Functions"
"""""""""""

" function to open URL, just use <Leader>o
" is next line even needed?
" let $PATH = $PATH . ';c:\Programs\FireFox1.5'
" Evoke a web browser
function! Browser ()
  let line0 = getline (".")
  let line = matchstr (line0, "http[^ ]*")
  :if line==""
  let line = matchstr (line0, "ftp[^ ]*")
  :endif
  :if line==""
  let line = matchstr (line0, "file[^ ]*")
  :endif
  let line = escape (line, "#?&;|%")
  ":if line==""
  " let line = "\"" . (expand("%:p")) . "\""
  ":endif
  exec ':silent !firefox' . "\"" . line . "\""
endfunction
map <Leader>o :call Browser ()<CR>

" Toggle Vexplore with Ctrl-E
" http://modal.us/blog/2013/07/27/back-to-vim-with-nerdtree-nope-netrw/
" removed because of some strange bugs

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Default to tree mode
let g:netrw_liststyle=3



"""""""""""""""""
"Plugin settings"
"""""""""""""""""

" NerdTree
" autocmd vimenter * if !argc() | NERDTree | endif

" Vim-notes
" let g:notes_directories = ['~/Documents/Notes']

" Startify custom header
let g:startify_custom_header =
            \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme= 'zenburn'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 0

" Ctrlp
let g:ctrlp_map = ''
map <leader><leader> :CtrlP<CR>

"YouCompleteMe
let g:EclimCompletionMethod = 'omnifunc'

" Vimchant
let g:vimchant_spellcheck_lang = 'fi'

" Bufferline
let g:bufferline_echo = 0

" Emmet
let g:user_emmet_leader_key='<C-K>'

" Indent Guides
let g:indent_guides_guide_size = 1
