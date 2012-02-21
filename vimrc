syntax on
set number
set splitbelow splitright
set cursorline
set showcmd
set ruler
set textwidth=79
set formatoptions=cqrnw1

"filetype plugin indent on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent
set autoindent

map <C-Right> :bn<CR>
map <C-Left> :bp<CR>
map <C-J> <C-W>j
map <C-K> <C-W>k

set incsearch
set hlsearch
set showmatch
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching lowercase

au BufRead,BufNewFile *.ejs set filetype=html

"share buffers between instances
map <C-y> <Esc>:'<,'>! cat \| tee ~/.vim/.myvimbuf<CR>
map <C-p> o<Esc>:.!cat ~/.vim/.myvimbuf<CR>
map <C-P> O<Esc>:.!cat ~/.vim/.myvimbuf<CR>

autocmd BufWritePre  *.{js,md,ejs,html,css}  call StripTrailingWhite()

function! StripTrailingWhite()
  let l:winview = winsaveview()
  silent! %s/\s\+$//
  call winrestview(l:winview)
endfunction
