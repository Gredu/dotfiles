"""""""""""""
" Reference "
"""""""""""""
"
" settings for javascript
" https://www.gregjs.com/vim/2016/neovim-deoplete-jspc-ultisnips-and-tern-a-config-for-kickass-autocompletion/
"
" settings for go
" https://coolaj86.com/articles/getting-started-with-golang-and-vim/
" https://github.com/alecthomas/gometalinter

"""""""""""
" Plugins "
"""""""""""

" Install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Javascript {{{

" Better indentation
" Plug 'gavocanov/vim-js-indent', {
" \   'for': ['javascript']
" \ }

" JS syntax, supports ES6
Plug 'othree/yajs.vim', { 'for': ['javascript'] }

" JS syntax for common libraries
Plug 'othree/javascript-libraries-syntax.vim', {'for': ['javascript'] }

" Makes gf work on node require statements
Plug 'moll/vim-node', { 'for': ['javascript'] }
" }}}


Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'fatih/vim-go', { 'for': ['go'] }
Plug 'zchee/deoplete-go', { 'do': 'make' }
" Plug 'shmargum/vim-sass-colors'
Plug 'cakebaker/scss-syntax.vim'
Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }
Plug 'mattn/emmet-vim', { 'for': ['html'] }
Plug 'junegunn/goyo.vim', { 'for': ['markdown', 'text', 'tex', 'fountain'] }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/unite.vim'
Plug 'shougo/vimfiler.vim'
Plug 'ervandew/supertab'
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
Plug 'vim-scripts/fountain.vim'
Plug 'neomake/neomake'
Plug 'christoomey/vim-tmux-navigator'
Plug 'w0ng/vim-hybrid'
Plug 'Yggdroot/indentLine'
Plug 'bling/vim-airline'
Plug 'plasticboy/vim-markdown'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'rhysd/vim-grammarous'
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

set clipboard+=unnamed
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
set wildignore+=*.o,*.obj,*.bak,*.exe,*.so,*.swp,*.zip,*.so
set wildignore+=*/tmp/*         " MacOSX/Linux
set wildignore+=*\\tmp\\*       " Windows
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
set wildmode=longest,list,full
set conceallevel=0

" OS spesific settings
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    lan en_US
    let g:python_host_prog = '/usr/local/bin/python2'
    let g:python3_host_prog = '/usr/local/bin/python3'
  else 
    let g:python_host_prog = '/usr/bin/python2'
    let g:python3_host_prog = '/usr/bin/python'
  endif
endif


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
" let g:airline_left_sep='\e0cd'
let g:airline_right_sep=''

" Ctrlp
" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>
let g:ctrlp_map = ''
let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Store|git|hg|svn|optimized|compiled|node_modules)$'

" Vimchant
let g:vimchant_spellcheck_lang = 'fi'

" Bufferline
" let g:bufferline_echo = 0

" Emmet
let g:user_emmet_leader_key='<C-e>'

" IndentLine
let g:indentLine_color_term = 236
let g:indentLine_concealcursor=""

" Neomake
" Use Neomake when writing to a file
call neomake#configure#automake('w')
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_open_list = 2

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

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']

" Tern
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" Supertab
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" Vim-go
" use goimports for formatting
let g:go_fmt_command = "goimports"

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Compile less
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>


""""""""""
"Filetype"
""""""""""

au BufNewFile,BufRead *.fountain set filetype=fountain

au Filetype javascript nnoremap <Leader>r :w<CR> :!node %<CR>

au Filetype scala nnoremap <Leader>r :w<CR> :!scala %:p<CR>

au Filetype go nnoremap <leader>r :w<CR>:GoRun<CR>
au Filetype go nnoremap <leader>t :w<CR>:GoTest<CR>

au FileType markdown,mkd,txt,tex,fountain set wrap lbr 
au FileType markdown,mkd,txt,tex,fountain nnoremap j gj
au FileType markdown,mkd,txt,tex,fountain nnoremap k gk
