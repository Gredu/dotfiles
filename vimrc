"""""""""""
" Plugins "
"""""""""""

call plug#begin('~/.vim/plugged')

" Javascript {{{

" Better indentation
" Plug 'gavocanov/vim-js-indent', {
" \   'for': ['javascript']
" \ }

" JS syntax, supports ES6
Plug 'othree/yajs.vim', {'for': ['javascript'] }

" JS syntax for common libraries
Plug 'othree/javascript-libraries-syntax.vim', {'for': ['javascript'] }

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


Plug 'fatih/vim-go', {'for': ['go']}
Plug 'ap/vim-css-color', {'for': ['css', 'sass']}
Plug 'derekwyatt/vim-scala', {'for': ['scala']}
Plug 'mattn/emmet-vim', {'for': ['html']}
Plug 'junegunn/goyo.vim', {'for': ['markdown', 'text']}
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'Shougo/unite.vim'
Plug 'shougo/vimfiler.vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline-themes'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tomtom/tcomment_vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/Vimchant'
Plug 'benekastah/neomake'
Plug 'christoomey/vim-tmux-navigator'
Plug 'w0ng/vim-hybrid'
Plug 'Yggdroot/indentLine'
Plug 'bling/vim-airline'
Plug 'plasticboy/vim-markdown'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
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
set conceallevel=0

if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    lan en_US
  endif
endif

let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

""""""""""
"Mappings"
""""""""""

" Fast switching between buffers
nnoremap <C-n> :bn <CR>
nnoremap <C-p> :bp <CR>

" Go to link in Vim help, easier for Finnish keyboard
nnoremap <Leader>g <C-]>

" Quickly enter to command line, easier for Finnish keyboard
nnoremap , :

" Vimfiler Toggler
nnoremap <Leader>n :VimFilerExplorer <CR>

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

" vimfiler
let g:vimfiler_as_default_explorer = 1
let g:loaded_netrwPlugin = 1
let g:vimfiler_quick_look_command = 'qlmanage -p'  " for Mac
" Reserver for moving right
autocmd FileType vimfiler nunmap <buffer> <C-l>
" Reserved for leader
autocmd FileType vimfiler nunmap <buffer> <Space>
let g:vimfiler_quick_look_command = 'qlmanage -p'
" For reference: 
" autocmd FileType vimfiler nunmap <buffer> za
" autocmd FileType vimfiler nmap <buffer> za <Plug>(vimfiler_toggle_visible_dot_files)
" autocmd FileType vimfiler nmap <buffer> <C-r>  <Plug>(vimfiler_redraw_screen)
" <Plug>(vimfiler_toggle_mark_current_line)
" <S-Space>		<Plug>(vimfiler_toggle_mark_current_line_up)
" autocmd FileType vimfiler nmap <buffer> <C-r>  <Plug>(vimfiler_redraw_screen)

" Beautify VimFiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_restore_alternate_file = 1
let g:vimfiler_tree_indentation = 1
let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_tree_opened_icon = '▼'
let g:vimfiler_tree_closed_icon = '▷'
let g:vimfiler_readonly_file_icon = '*'
let g:vimfiler_marked_file_icon = '√'
"let g:vimfiler_preview_action = 'auto_preview'
let g:vimfiler_ignore_pattern = [
            \ '^\.git$',
            \ '^\.DS_Store$',
            \ '^\.init\.vim-rplugin\~$',
            \ '^\.netrwhist$',
            \ '\.class$'
            \]

call vimfiler#custom#profile('default', 'context', {
            \ 'explorer' : 1,
            \ 'winwidth' : 30,
            \ 'winminwidth' : 30,
            \ 'toggle' : 1,
            \ 'columns' : 'type',
            \ 'auto_expand': 1,
            \ 'direction' : 'rightbelow',
            \ 'parent': 0,
            \ 'explorer_columns' : 'type',
            \ 'status' : 1,
            \ 'safe' : 0,
            \ 'split' : 1,
            \ 'hidden': 1,
            \ 'no_quit' : 1,
            \ 'force_hide' : 0,
						\ })


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
