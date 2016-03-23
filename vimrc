"""""""""""
" Plugins "
"""""""""""

call plug#begin('~/.vim/plugged')

" Javascript {{{

" JS syntax, supports ES6
Plug 'othree/yajs.vim', {
\   'for': ['javascript']
\ }

" Better indentation
" Plug 'gavocanov/vim-js-indent', {
" \   'for': ['javascript']
" \ }

" JS syntax for common libraries
Plug 'othree/javascript-libraries-syntax.vim', {
\   'for': ['javascript']
\ }

" Tern auto-completion engine for JS (requires node/npm)
if executable('node')
  Plug 'marijnh/tern_for_vim', {
\     'do': 'npm install',
\     'for': ['javascript', 'coffee']
\   }
endif

" Makes gf work on node require statements
Plug 'moll/vim-node', {
\   'for': ['javascript']
\ }
" }}}

" Plug 'flowtype/vim-flow'
" Plugin 'bling/vim-bufferline'
" Plug 'easymotion/vim-easymotion'
" Plug 'justinmk/vim-sneak'

Plug 'vim-airline/vim-airline-themes'
Plug 'lervag/vimtex'
Plug 'ap/vim-css-color'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tomtom/tcomment_vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'vim-scripts/Vimchant'
Plug 'benekastah/neomake'
Plug 'christoomey/vim-tmux-navigator'
Plug 'terryma/vim-expand-region'
Plug 'scrooloose/nerdtree'
Plug 'w0ng/vim-hybrid'
Plug 'Yggdroot/indentLine'
Plug 'bling/vim-airline'
Plug 'vim-scripts/VimRepress'
Plug 'plasticboy/vim-markdown'
Plug 'derekwyatt/vim-scala'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
call plug#end()

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

set clipboard+=unnamedplus
let mapleader = "\<Space>"

" set encoding=utf8
set showmatch
set ruler
" set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
set ignorecase                  " You always want this
set smartcase                   " Smarter case search
set incsearch                   " Jumps right to the search
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
" set autochdir                 " Always switch to the current file directory
set hidden                      " You don't have to save constantly when switching between buffers
set wildmenu                    " Enchanced completion
" set hlsearch                  " Hilight the search matches
set laststatus=2                " Status is always on
set scrolloff=5
set sidescrolloff=5
set foldenable                  " Autofold
set bs=2                        " Makes backspace work again
set lazyredraw                  " Don't update display while executing macros
" Powerline
" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" set t_Co=256                  " Set this only if your terminal supports 256 colors
set mouse=a                     " Enable mouse
set mousehide                   " Hide when characters typed
set number                      " Show line numbers
" set rnu                       " Use relative numbers
" set t_ut=                     " Disable Background Color Erase
" set spelllang=fi
set shell=/bin/zsh
set splitbelow                  " Use more natural splitting
set splitright
set wildmode=full


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

" Tmux bugging around
 if has('nvim')
     nmap <BS> <C-W>h
 endif

" tnoremap <S-CR> <C-\><C-n>
tnoremap å <C-\><C-n>

" Eclim project tree toggle
" nmap <Leader>e :ProjectTreeToggle <CR>

" Resize current buffer
nnoremap <down> :resize -1<cr>
nnoremap <up> :resize +1<cr>
nnoremap <left> :vertical resize -1<cr>
nnoremap <right> :vertical resize +1<cr>

" vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" run in node
" nmap <Leader>j :!node %<CR>



"""""""
"Looks"
"""""""

let g:hybrid_use_Xresources = 1
colors hybrid
set background=dark

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
map <Leader>w :call Browser ()<CR>


" netrw
" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1

" Default to tree mode
" let g:netrw_liststyle=3



"""""""""""""""""
"Plugin settings"
"""""""""""""""""

" Sneak
" nmap f <Plug>Sneak_s
" nmap F <Plug>Sneak_S
" xmap f <Plug>Sneak_s
" xmap F <Plug>Sneak_S
" omap f <Plug>Sneak_s
" omap F <Plug>Sneak_S
" let g:sneak#s_next = 1

" YCM
let g:UltiSnipsExpandTrigger = '<C-Space>'
let g:UltiSnipsJumpForwardTrigger = 'ö'
let g:UltiSnipsJumpBackwardTrigger = 'ä'


" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme= 'hybrid'
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'


" Ctrlp
" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>
let g:ctrlp_map = ''

"YouCompleteMe
let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_filetype_specific_completion_to_disable = 'mkd'

" Python
let g:pthon_host_prog = '/usr/bin/python2.7'

" Vimchant
let g:vimchant_spellcheck_lang = 'fi'

" Bufferline
" let g:bufferline_echo = 0

" Emmet
let g:user_emmet_leader_key='<C-e>'

" IndentLine
let g:indentLine_color_term = 236

" NerdTree, to open if no file is open
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Neomake
" Use Neomake when writing to a file
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
" let g:neomake_open_list = 2

" let g:neomake_open_list = m
" let g:neomake_list_height = 4
" let g:neomake_javascript_jshint_maker = {
    " \ 'args': ['--verbose'],
    " \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    " \ }
" let g:neomake_javascript_flow_maker = {
    " \ 'args': ['check', '--all'],
    " \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    " \ }
" let g:neomake_javascript_enabled_makers = ['jshint']
" let g:neomake_javascript_enabled_makers = ['jslint']
" let g:neomake_javascript_enabled_makers = ['flow']

" vim-markdown
let g:vim_markdown_folding_disabled = 1

""""""""""
"Filetype"
""""""""""

au FileType markdown,mkd set wrap lbr 
au FileType markdown,mkd,txt nnoremap j gj
au FileType markdown,mkd,txt nnoremap k gk

au InsertEnter *.md setlocal conceallevel=0 concealcursor=
au InsertLeave *.md setlocal conceallevel=2 concealcursor=inc

