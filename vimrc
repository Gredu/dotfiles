" set nocompatible
filetype off


"""""""""""
" Plugins "
"""""""""""

"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'pangloss/vim-javascript'
" Plugin 'vim-pandoc/vim-pandoc'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'terryma/vim-expand-region'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/vimproc'
Plugin 'scrooloose/syntastic'
Plugin 'w0ng/vim-hybrid'
Plugin 'Yggdroot/indentLine'
Plugin 'Shougo/vimshell.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
" Plugin 'bling/vim-bufferline'
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

" call plug#begin('~/.vim/bundle')
"
" call plug#end()

" Looks out the type of the file, and sets correct indenting
filetype plugin indent on


""""""""""""""
" Basic sets "
""""""""""""""

syntax enable                       " Syntax colors are on

" Making 'standard'
set expandtab
set tabstop=2
set shiftwidth=2

set clipboard=unnamedplus
let mapleader = "\<Space>"

set encoding=utf8
set showmatch
set ruler
" set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
set ignorecase                  " You always want this
set smartcase                   " Smarter case search
set incsearch                   " Jumps right to the search
set nu                          " Sets numbers
set cursorline
set guifont=Ubuntu\ Mono\ Powerline\ 12
set backup                      " Make backup files
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set wildignore=*.o,*.obj,*.bak,*.exe
set linespace=0
set showcmd
set nowrap
set showmode                    " Show current mode
" Vimshell needs this to be closed
" set autochdir                 " Always switch to the current file directory
set hidden                      " You don't have to save constantly when switching between buffers
set wildmenu                    " Enchanced completion
set hlsearch                    " Hilight the search matches
set laststatus=2                " Status is always on
set scrolloff=5
set foldenable                  " Autofold
set bs=2                        " Makes backspace work again
set lazyredraw                  " Don't update display while executing macros
" Powerline
" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" set t_Co=256                    " Set this only if your terminal supports 256 colors
set mouse=a                     " Enable mouse
set mousehide                   " Hide when characters typed
" set t_ut=                       " Disable Background Color Erase
" set spelllang=fi



""""""""""
"Mappings"
""""""""""

" Makes it easier to edit this source
" nmap <Leader>sv :so $MYVIMRC<CR>
" nmap <Leader>ev :e $MYVIMRC<CR>

" Runs the current scala code
" nmap <Leader>c :w <CR> :!scala %:p<CR>

" Fast switching between buffers
nmap <C-n> :bn <CR>
nmap <C-p> :bp <CR>

" Go to link in Vim help, easier in Finnish keyboard
nmap <Leader>g <C-]>

" Quickly enter to command line, easier in Finnish keyboard
nmap , :

" NERDtree toggling
nmap <Leader>n :NERDTreeToggle <CR>

" Eclim project tree toggle
" nmap <Leader>e :ProjectTreeToggle <CR>

" Mappings to make it easier to type 
" imap åa {
" imap åf }
" imap ås [
" imap åd ]
" imap åz @
" imap åx $
" imap åc \
" imap åv ~
" imap åb <bar>

" CodingMode changes ö and ä to something more interesting for vim
map ö {
map ä }
map Ö [
map Ä ]
cmap ö {
cmap ä }
cmap Ö [
cmap Ä ]
imap ö {
imap ä }
imap Ö [
imap Ä ]

nnoremap <leader>c :call CodingMode()<cr>

let g:codemode_toggle = 0

function! CodingMode()
    if g:codemode_toggle
        imap ö {
        imap ä }
        imap Ö [
        imap Ä ]
        echo 'CodingMode enabled'
        let g:codemode_toggle = 0
    else
        iunmap ö
        iunmap ä
        iunmap Ö
        iunmap Ä
        echo 'CodingMode disabled'
        let g:codemode_toggle = 1
    endif
endfunction


" Send rspec spec to VimShell
nmap <leader>r :VimShellSendString rspec spec<CR>

" Resize current buffer
nnoremap <down> :resize -1<cr>
nnoremap <up> :resize +1<cr>
nnoremap <left> :vertical resize -1<cr>
nnoremap <right> :vertical resize +1<cr>

" vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)




"""""""""""
"Behaviors"
"""""""""""

colors hybrid

" Clearing GUI bars if GUI is present
if has('gui_running')
	set go-=m
	set go-=T
	set go-=r
	set go-=b
	set go-=l
	set go-=L
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


" netrw
" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1

" Default to tree mode
let g:netrw_liststyle=3



"""""""""""""""""
"Plugin settings"
"""""""""""""""""

" Startify custom header
let g:startify_custom_header =
            \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme= 'hybrid'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Ctrlp
let g:ctrlp_map = ''
map <leader>f :CtrlP<CR>

"YouCompleteMe
let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_filetype_specific_completion_to_disable = 'mkd'

" Vimchant
let g:vimchant_spellcheck_lang = 'fi'

" Bufferline
let g:bufferline_echo = 0

" Emmet
" let g:user_emmet_leader_key='<c-m>'

" IndentLine
let g:indentLine_color_term = 236

" VimShell
let g:vimshell_enable_smart_case   = 1
let g:vimshell_prompt              = '➤ '
" let g:vimshell_cd_command = 'TabpageCD'
" let g:vimshell_user_prompt         = 'fnamemodify(getcwd(), ":~")'
" let g:vimshell_right_prompt        = 'system("date")'
" let g:vimshell_temporary_directory = " '~/tmp/vimshell'
"                                        change these quotes!

" NerdTree, to open if no file is open
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif



""""""""""
"Filetype"
""""""""""

au FileType markdown,mkd set wrap lbr 
au FileType markdown,mkd,txt nnoremap j gj
au FileType markdown,mkd,txt nnoremap k gk
au FileType ruby set tabstop=2 shiftwidth=2
