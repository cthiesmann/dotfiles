" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

set nobackup	" do not keep a backup file, use versions instead
set undofile	" keep an undo file (undo changes after closing)

" Switch on highlighting the last used search pattern.
set hlsearch
set incsearch 

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

set sidescroll=10

noremap <C-p> :Files<CR>
noremap <C-o> :NERDTreeToggle %<CR>
noremap <C-f> :NERDTreeFind<CR>
noremap <C-i> :IndentGuidesToggle<CR>
