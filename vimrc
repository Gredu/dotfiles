set nocompatible                " Use Vim settings, and no vi
filetype off

" Pathogen
" call pathogen#incubate()
" hcall pathogen#infect()
" call pathogen#helptags()

" Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'Shougo/neocomplete'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
Bundle 'vim-scripts/VimRepress'
Bundle 'vim-scripts/Vimchant'
Bundle 'mhinz/vim-startify'
Bundle 'plasticboy/vim-markdown'
Bundle 'derekwyatt/vim-scala'
Bundle 'tpope/vim-fugitive'

" Looks out the type of the file, and sets correct indenting
filetype plugin indent on


""""""""""""""
" Basic sets "
""""""""""""""

syntax on                       " Syntax colors are on

" More standard
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
" set guifont=Monaco\ 11
" set guifont=Ubuntu\ Mono\ 11
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 11
" set guifont=UbuntuMonoPowerline\ 11
" set guifont=Monospace\ 8
" set guifont=DejaVu\ Sans\ Mono\ 10
set backup                      " Make backup files
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set wildignore=*.o,*.obj,*.bak,*.exe
set linespace=0
set showcmd
set nowrap
set showmode                    " Show current mode
set autochdir                   " Always switch to the current file directory
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
set spelllang=en

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
nmap <Leader>c :!scala %:p<CR>


" Fast swapping
nmap <Leader>3 :b# <CR>
nmap <C-N> :bn <CR>
nmap <C-P> :bp <CR>

" Easier in help link with Finnish keyboard
nmap <Leader>g <C-]>

" Quickly enter to command line, easier in Finnish keyboard
nmap , :

" NERDtree toggling
nmap <Leader>n :NERDTreeToggle <CR>

""""""""""""""
"Abbrevations"
""""""""""""""

abbr /*** /*****************************************************************************/


"""""""""""
"Behaviors"
"""""""""""

colorscheme xoria256

" Start these commands only if gui is running
if has('gui_running')
	" Clearing GUI bars
	set go-=m
	set go-=T
	set go-=r
	set go-=b
	set go-=l
endif

" If no omnifunction plugin is detected, just use omnifunction based on syntax
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
                \	if &omnifunc == "" |
                \		setlocal omnifunc=syntaxcomplete#Complete |
                \	endif
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
  exec ':silent !google-chrome ' . "\"" . line . "\""
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

" Change directory to the current buffer when opening files.
set autochdir



"""""""""""""""""
"Plugin settings"
"""""""""""""""""

" NerdTree
" autocmd vimenter * if !argc() | NERDTree | endif

" Vim-notes
let g:notes_directories = ['~/Documents/Notes']

" Startify custom header
let g:startify_custom_header =
            \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']

" Powerline
let g:airline_powerline_fonts = 1

" Startify
let g:startify_bookmarks = [ '~/Documents/Notes/' ]

" Airline
let g:airline_theme= 'wombat'


" Neocomplete
"""
" Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
 

""" Neocomplete end


" Neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets'

" Neosnippet end
""

" Vimchant
let g:vimchant_spellcheck_lang = 'fi'
