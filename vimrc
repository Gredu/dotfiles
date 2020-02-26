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

" JS syntax, supports ES6
Plug 'othree/yajs.vim', { 'for': ['javascript'] }

" JS syntax for common libraries
Plug 'pangloss/vim-javascript'

" Makes gf work on node require statements
Plug 'moll/vim-node', { 'for': ['javascript'] }

" }}}

" Writing {{{

Plug 'junegunn/goyo.vim', { 'for': ['markdown', 'text', 'tex', 'fountain'] }
Plug 'vim-scripts/fountain.vim'

" }}}

Plug 'fatih/vim-go', { 'for': ['go'] }
Plug 'cakebaker/scss-syntax.vim'
Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }
Plug 'mattn/emmet-vim', { 'for': ['html'] }
Plug 'Shougo/unite.vim'
Plug 'shougo/vimfiler.vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tomtom/tcomment_vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/Vimchant'
Plug 'christoomey/vim-tmux-navigator'
Plug 'micke/vim-hybrid'
Plug 'chriskempson/base16-vim'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'plasticboy/vim-markdown'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'rhysd/vim-grammarous'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
set shell=/bin/zsh
set splitbelow                  " Use more natural splitting
set splitright                  " --
set conceallevel=0
set updatetime=300
set shortmess+=c
set signcolumn=yes
set termguicolors

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

" Disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


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

" let g:hybrid_custom_term_colors = 1
colorscheme base16-default-dark
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
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline_left_sep=' '
let g:airline_right_sep=' '

" Show git branch from statusline
" https://github.com/vim-airline/vim-airline/issues/605#issue-43567680
let g:airline#extensions#branch#enabled = 1

" Enable coc integration
let g:airline#extensions#coc#enabled = 1


" Ctrlp
" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>
let g:ctrlp_map = ''
let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Store|git|hg|svn|optimized|compiled|node_modules)$'

" FZF
nnoremap <Leader>o :Files<CR>

" Vimchant
let g:vimchant_spellcheck_lang = 'fi'

" Bufferline
" let g:bufferline_echo = 0

" Emmet
let g:user_emmet_leader_key='<C-e>'

" IndentLine
let g:indentLine_color_term = 236
let g:indentLine_concealcursor=""

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

" COC
" Install extensions
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#install-extensions
let g:coc_global_extensions = ['coc-eslint', 'coc-tsserver', 'coc-css']

" Navigate through autocomplete suggestions and add them
" https://github.com/Shougo/deoplete.nvim/issues/246#issuecomment-344463696
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr><C-l> pumvisible() ? "\<C-y>" : "\<C-l>"

" Skip delimitMate on pop-up menus
"
" Select an option from popup menu with CR (Enter) without doing a return.
" When no entry selected, <CR> closes pum (default)
" Otherwise, use delimitMate <CR> expansion
"
" https://github.com/Raimondi/delimitMate/blob/master/doc/delimitMate.txt
imap <expr> <CR> pumvisible()
                 \ ? "\<C-Y>"
                 \ : "<Plug>delimitMateCR"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


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
