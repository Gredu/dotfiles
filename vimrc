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


Plug 'majutsushi/tagbar'
Plug 'fatih/vim-go'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
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
Plug 'w0ng/vim-hybrid'
Plug 'Yggdroot/indentLine'
Plug 'bling/vim-airline'
Plug 'vim-scripts/VimRepress'
Plug 'plasticboy/vim-markdown'
Plug 'derekwyatt/vim-scala'
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

set showmatch
set ruler
set ignorecase                  " You always want this
set smartcase                   " Smarter case search
set incsearch                   " Jumps right to the search
set cursorline
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
set laststatus=2                " Status is always on
set scrolloff=5
set sidescrolloff=5
set foldenable                  " Autofold
set bs=2                        " Makes backspace work again
set lazyredraw                  " Don't update display while executing macros
set mouse=a                     " Enable mouse
set mousehide                   " Hide when characters typed
set number                      " Show line numbers
set rnu                         " Use relative numbers
" set spelllang=fi
set shell=/bin/zsh
set splitbelow                  " Use more natural splitting
set splitright
set wildmode=full


""""""""""
"Mappings"
""""""""""

" Fast switching between buffers
nmap <C-n> :bn <CR>
nmap <C-p> :bp <CR>

" Go to link in Vim help, easier for Finnish keyboard
nmap <Leader>g <C-]>

" Quickly enter to command line, easier for Finnish keyboard
nmap , :

" NERDtree toggling
nmap <Leader>n :NERDTreeToggle <CR>

" Tmux bugging around
if has('nvim')
  nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
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

" tagbar toggle
nnoremap <Leader>t :Tagbar<CR>


"""""""
"Looks"
"""""""

let g:hybrid_custom_term_colors = 1
colors hybrid
set background=dark


"""""""""""
"Functions"
"""""""""""


"""""""""""""""""
"Plugin settings"
"""""""""""""""""

" YCM
let g:UltiSnipsExpandTrigger = '<C-Space>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
let g:UltiSnipsSnippetDirectories = ['~/.vim/plugged/vim-snippets/UltiSnips', '~/.vim/UltiSnips', 'UltiSnips']

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

" Vimchant
let g:vimchant_spellcheck_lang = 'fi'

" Bufferline
" let g:bufferline_echo = 0

" Emmet
let g:user_emmet_leader_key='<C-e>'

" IndentLine
let g:indentLine_color_term = 236

" Neomake
" Use Neomake when writing to a file
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_go_enabled_makers = ['golint']
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

" Tagbar for golang
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


""""""""""
"Filetype"
""""""""""

au Filetype javascript nnoremap <Leader>r :!node %<CR>

au Filetype scala nnoremap <Leader>r :w<CR> :!scala %:p<CR>

au Filetype go nnoremap <leader>r :w<CR>:GoRun<CR>

au FileType markdown,mkd set wrap lbr 
au FileType markdown,mkd,txt nnoremap j gj
au FileType markdown,mkd,txt nnoremap k gk

au InsertEnter *.md setlocal conceallevel=0 concealcursor=
au InsertLeave *.md setlocal conceallevel=2 concealcursor=inc
