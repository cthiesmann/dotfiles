" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim
" Plugins {{{
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
" Declare the list of plugins.
" Fuzzy search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Undo tree visualization
Plug 'sjl/gundo.vim'
" File tree
Plug 'scrooloose/nerdtree'
" Status bar
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
" Git commands and highlighting
Plug 'airblade/vim-gitgutter'
" Class outline viewer
Plug 'majutsushi/tagbar'
" Code completion and snippets
Plug 'mbbill/code_complete'
" Lint support
Plug 'dense-analysis/ale'
" Autotag, automatically update ctags on save
Plug 'craigemery/vim-autotag'
" Spacegray colorscheme
Plug 'ajh17/Spacegray.vim'
" JSON syntax support
Plug 'leshill/vim-json'
" Better javasctipt highlighting
Plug 'pangloss/vim-javascript'
" Intellisense integration
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" List ends here. Plugins become visible to Vim after this call.
call plug#end()
" }}}
" GitGutter {{{
set updatetime=100
" }}}
" Airline {{{
let g:airline_powerline_fonts = 1 " populate airline icons with powerine-font icons
" }}}
" Colors {{{
set termguicolors
"colorscheme spacegray
"let g:spacegray_underline_search = 1
"let g:spacegray_use_italics = 1
"let g:spacegray_low_contrast = 1
colorscheme apprentice " set color scheme
"colorscheme badwolf
syntax enable " enable syntax processing
" }}}
" Spaces & Tabs {{{
set tabstop=2 " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
set shiftwidth=2 " number of spaces when shifting whole lines left/right
set smarttab " ???
"set expandtab " tabs are spaces
set breakindent " start line wraps indneted
"add two spaces infront ofeach linebreak
set showbreak=↳\ 
filetype indent on " load filetype-specific indent files
set smartindent " do smart autoindenting when starting a new line
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣ "set indentation highlight characters
" }}}
" UI Config {{{
set number " show line numbers
"set relativenumber " show relative line numbers
set showcmd " shows command in bottom bar
set cursorline " highlight current line
set scrolloff=5 "999 for centered cursor" number of screen lines to keep above and below the cursor
set sidescrolloff=999 " number of screen columns to keep left and right of the cursor
set wildmenu " visual autocomplete for command menu
"set lazyredraw " redraw only when we need to
set showmatch " highlight matching [{()}]
set mouse=a " enable mouse
" }}}
" Searching {{{
set incsearch " search as characters are entered
set hlsearch " highlight matches
set ignorecase " ignore capital letters
set smartcase " do not ignore intentionally cased searches
" }}}
" Folding {{{
set foldenable " enable folding
set foldlevelstart=1 " open most folds by default
set foldnestmax=2 " 10 nested fold max
set foldmethod=syntax "fold based on { } level
"set foldmarker={,}
" bind space to open/close folds
nnoremap <space> za
" }}}
" Movement {{{
" jk is escape
inoremap jk <esc>
" move vertically by visual line (won't skip wrapped lines)
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" }}}
" Fzf {{{
" Fuzzy file search
noremap <C-f> :Files<CR>
" Fuzzy tag search
noremap <C-t> :Tags<CR>
" }}}
" Omnicomplete {{{
" Enable filetype syntax completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete
" Show popup even if only one match was found & don't auto insert
set completeopt=menuone ",noinsert
" Bind CTRL SPACE to open completion popup
inoremap <C-@> <C-x><C-o>
" }}}
" Tab movement {{{
nnoremap <C-l> :tabn<CR>
nnoremap <C-h> :tabp<CR>
nnoremap <C-n> :tabe<CR>
" }}}
" Leader Shortcuts {{{
" leader is comma"
let mapleader="," 
" NERDTree keybinds
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <leader>o :NERDTreeFind<CR>
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" bind ,u to gundo's undo tree
nnoremap <leader>u :GundoToggle<CR>
" save session (current windows), reopen with vim -S
nnoremap <leader>s :mksession! ~/session.vim<CR>
" keybind for opening .vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
" keybind for reloading .vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>
" toggle relative line numbers
nnoremap <leader>n :call ToggleNumber()<CR>
" toggle indentation characters
nnoremap <leader>i :call ToggleList()<CR>
" toggle tag bar
nnoremap <leader>t :TagbarToggle<CR>
" toggle gitgutter fold
nnoremap <leader>h<space> :GitGutterFold<CR>
" }}}
" Functions {{{
" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
" toggle tab list 
function! ToggleList()
    if(&list == 1)
        set nolist
    else
        set list
    endif
endfunc
" }}}
" coc.nvim {{{
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" }}}
" vim:foldmethod=marker:foldlevel=0:foldmarker={{{,}}}
