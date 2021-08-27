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
" if empty(glob('~/.vim/autoload/plug.vim'))
"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif
"
" call plug#begin('~/.vim/plugged')

" Javascript {{{

" Makes gf work on node require statements
" Plug 'moll/vim-node', { 'for': ['javascript'] }

" }}}


" Plug 'Yggdroot/indentLine'
" Plug 'airblade/vim-gitgutter'
" Plug 'Shougo/unite.vim'
" Plug 'SirVer/ultisnips'
" Plug 'chriskempson/base16-vim'
" Plug 'honza/vim-snippets'
" Plug 'junegunn/fzf', { 'do': './install --bin' }
" Plug 'junegunn/fzf.vim'
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'shougo/vimfiler.vim'
" Plug 'vim-scripts/Vimchant'

" Writing {{{

" Plug 'junegunn/goyo.vim', { 'for': ['markdown', 'text', 'tex', 'fountain'] }
" Plug 'vim-scripts/fountain.vim'

" }}}

" Plug 'arcticicestudio/nord-vim'
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'fatih/vim-go', { 'for': ['go'] }
" Plug 'itchyny/lightline.vim'
" Plug 'jiangmiao/auto-pairs'
" Plug 'leafOfTree/vim-vue-plugin'
" Plug 'lervag/vimtex'
" Plug 'lewis6991/gitsigns.nvim'
" Plug 'lukas-reineke/indent-blankline.nvim'
" Plug 'majutsushi/tagbar'
" Plug 'mattn/emmet-vim', { 'for': ['html', 'vue', 'javascript'] }
" Plug 'mengelbrecht/lightline-bufferline'
" Plug 'micke/vim-hybrid'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'plasticboy/vim-markdown'
" Plug 'rhysd/vim-grammarous'
" Plug 'ryanoasis/vim-devicons'
" Plug 'tomtom/tcomment_vim'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-surround'
" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'romgrk/barbar.nvim'
" call plug#end()


""""""""""""""
" Basic sets "
""""""""""""""

" Making 'standard'
" set expandtab
" set tabstop=2
" set shiftwidth=2
"
" set clipboard+=unnamed
" let mapleader = \<Space>

" set backup                      " Make backup files
" set backupdir=~/.vim/backup
" set cursorline
" set directory=~/.vim/tmp
" set foldenable                  " Autofold
" set hidden                      " You don't have to save constantly when switching between buffers
" set ignorecase                  " You always want this
" set incsearch                   " Jumps right to the search
" set lazyredraw                  " Don't update display while executing macros
" set mouse=a                     " Enable mouse
" set nofixendofline
" set number                      " Show line numbers
" set rnu                         " Use relative numbers
" set scrolloff=5
" set shortmess+=c
" set showmatch
" set showtabline=2
" set sidescrolloff=5
" set signcolumn=yes
" set smartcase                   " Smarter case search
" set splitbelow                  " Use more natural splitting
" set splitright                  " --
" set termguicolors
" set wildignore+=*.o,*.obj,*.bak,*.exe,*.so,*.swp,*.zip,*.so
" set wildignore+=*/tmp/*         " MacOSX/Linux
" set wildignore+=*\\tmp\\*       " Windows

" Tabs
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect
" set shortmess+=c

" lua require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}
" autocmd BufEnter * lua require'completion'.on_attach()

" Avoid showing message extra message when using completion
" set shortmess+=c


"OS spesific settings
" if has("unix")
"   let s:uname = system("uname")
"   if s:uname == "Darwin\n"
"     lan en_US
"     let g:python_host_prog = '/usr/local/bin/python2'
"     let g:python3_host_prog = '/usr/local/bin/python3'
"   else 
"     let g:python_host_prog = '/usr/bin/python2'
"     let g:python3_host_prog = '/usr/bin/python'
"   endif
" endif

" Disable auto commenting
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


""""""""""
"Mappings"
""""""""""

" Fast switching between buffers
" nnoremap <C-n> :bn <CR>
" nnoremap <C-p> :bp <CR>

" Go to link in Vim help, easier for Finnish keyboard
" nnoremap <Leader>g <C-]>

" Quickly enter to command line, easier for Finnish keyboard
" nnoremap , :

" Vimfiler Toggler
" nnoremap <Leader>n :VimFilerExplorer <CR>

" Tmux bugging around
" if has('nvim')
"   nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
" endif

" Resize current buffer
" nnoremap <down> :resize -1<cr>
" nnoremap <up> :resize +1<cr>
" nnoremap <left> :vertical resize -1<cr>
" nnoremap <right> :vertical resize +1<cr>

" tagbar toggle

" nnoremap <Leader>t :Tagbar<CR>


"""""""
"Looks"
"""""""

" colorscheme hybrid
" set background=dark

let g:lightline                    = {'colorscheme': 'wombat'}
let g:lightline.tabline            = {'left': [['buffers']], 'right': [['']]}
" let g:lightline.component_expand   = {'buffers': 'lightline#bufferline#buffers'}
" let g:lightline.component_type     = {'buffers': 'tabsel'}
let g:lightline.active             = {'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']]}
let g:lightline.component_function = {'gitbranch': 'FugitiveHead'}
let g:lightline.mode_map           = {'n': 'N', 'i': 'I', 'R': 'R', 'v': 'V', 'V': 'VL', "\<C-v>": 'VB', 'c': 'C', 's': 'S', 'S': 'SL', "\<C-s>": 'SB', 't': 'T'}


" let g:indent_blankline_show_first_indent_level = v:false

"""""""""""
"Functions"
"""""""""""


"""""""""""""""""
"Plugin settings"
"""""""""""""""""

" let bufferline.icon_seperator_active = '┃'
" Barbar
" let bufferline = get(g:, 'bufferline', {})
" let bufferline.icon_separator_active = '┃'
" let bufferline.icon_separator_inactive = ' '
" let bufferline.icon_close_tab = ''

" Vim Vue
let g:vim_vue_plugin_load_full_syntax = 1

" YCM
" let g:UltiSnipsExpandTrigger = '<C-Space>'
" let g:UltiSnipsJumpForwardTrigger='<C-j>'
" let g:UltiSnipsJumpBackwardTrigger='<C-k>'
" let g:UltiSnipsSnippetDirectories = ['~/.vim/plugged/vim-snippets/UltiSnips', '~/.vim/UltiSnips', 'UltiSnips']

" FZF
" nnoremap <Leader>o :GFiles<CR>
" nnoremap <Leader>b :Buffers<CR>

" Telescope
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Vimchant
" let g:vimchant_spellcheck_lang = 'fi'

" Emmet
" let g:user_emmet_leader_key='<C-e>'

" IndentLine
" let g:indentLine_color_term = 236
" let g:indentLine_concealcursor=""
" let g:indentLine_char = '¦'
" let g:indent_blankline_use_treesitter = v:true
" let g:indent_blankline_show_current_context = v:true
" let g:indent_blankline_context_highlight_list = ['Error', 'Warning']

" let g:indent_blankline_show_current_context = v:true
" let g:indent_blankline_use_treesitter = v:true

" highlight IndentBlanklineChar guifg=#303030 gui=nocombine

" augroup IndentBlanklineContextAutogroup
"     autocmd!
"     autocmd CursorMoved * IndentBlanklineRefresh
" augroup END

" vim-markdown
" let g:vim_markdown_folding_disabled = 1

" vimfiler
" let g:vimfiler_as_default_explorer = 1
" let g:loaded_netrwPlugin = 1
" let g:vimfiler_quick_look_command = 'qlmanage -p'  " for Mac
" " Reserver for moving right
" autocmd FileType vimfiler nunmap <buffer> <C-l>
" " Reserved for leader
" autocmd FileType vimfiler nunmap <buffer> <Space>
" let g:vimfiler_quick_look_command = 'qlmanage -p'
" " For reference: 
" " autocmd FileType vimfiler nunmap <buffer> za
" " autocmd FileType vimfiler nmap <buffer> za <Plug>(vimfiler_toggle_visible_dot_files)
" " autocmd FileType vimfiler nmap <buffer> <C-r>  <Plug>(vimfiler_redraw_screen)
" " <Plug>(vimfiler_toggle_mark_current_line)
" " <S-Space>		<Plug>(vimfiler_toggle_mark_current_line_up)
" " autocmd FileType vimfiler nmap <buffer> <C-r>  <Plug>(vimfiler_redraw_screen)
"
" " Beautify VimFiler
" let g:vimfiler_restore_alternate_file = 1
" let g:vimfiler_tree_indentation = 1
" let g:vimfiler_tree_leaf_icon = ''
" let g:vimfiler_tree_opened_icon = '▼'
" let g:vimfiler_tree_closed_icon = '▷'
" let g:vimfiler_readonly_file_icon = '*'
" let g:vimfiler_marked_file_icon = '√'
" "let g:vimfiler_preview_action = 'auto_preview'
" let g:vimfiler_ignore_pattern = [
"             \ '^\.git$',
"             \ '^\.DS_Store$',
"             \ '^\.init\.vim-rplugin\~$',
"             \ '^\.netrwhist$',
"             \ '\.class$'
"             \]
"
" call vimfiler#custom#profile('default', 'context', {
"             \ 'explorer' : 1,
"             \ 'winwidth' : 30,
"             \ 'winminwidth' : 30,
"             \ 'toggle' : 1,
"             \ 'columns' : 'type',
"             \ 'auto_expand': 1,
"             \ 'direction' : 'rightbelow',
"             \ 'parent': 0,
"             \ 'explorer_columns' : 'type',
"             \ 'status' : 1,
"             \ 'safe' : 0,
"             \ 'split' : 1,
"             \ 'hidden': 1,
"             \ 'no_quit' : 1,
"             \ 'force_hide' : 0,
" 						\ })

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

" Tern
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" Supertab
" let g:SuperTabClosePreviewOnPopupClose = 1
" let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"
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
" nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

" Use highlight scss syntax in
let g:vim_vue_plugin_use_scss = 1


" tex flavor
let g:tex_flavor = 'latex'

""""""""""
"Auto Commands"
""""""""""

au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

au BufNewFile,BufRead *.fountain set filetype=fountain

au Filetype go nnoremap <leader>r :w<CR>:GoRun<CR>
au Filetype go nnoremap <leader>t :w<CR>:GoTest<CR>

au FileType markdown,mkd,txt,tex,fountain set wrap lbr 
au FileType markdown,mkd,txt,tex,fountain nnoremap j gj
au FileType markdown,mkd,txt,tex,fountain nnoremap k gk
