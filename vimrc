set nocompatible
filetype off


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'motemen/git-vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'Raimondi/delimitMate'
Plugin 'walm/jshint.vim'
Plugin 'plasticboy/vim-markdown'

Plugin 'scrooloose/syntastic'
let g:syntastic_javascript_checkers=['jshint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 0


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


syntax on
set number
set splitbelow splitright
set cursorline
set showcmd
set ruler
set textwidth=79
set colorcolumn=+1,+2,+3
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

" copy and paste text to system clipboard
vmap <C-x> :!pbcopy<CR>  
vmap <C-c> :w !pbcopy<CR><CR> 
map <C-v> :r !pbpaste<CR><CR> 

au BufRead,BufNewFile *.ejs set filetype=html

"share buffers between instances
map <C-y> <Esc>:'<,'>! cat \| tee ~/.vim/.myvimbuf<CR>
map <C-p> o<Esc>:.!cat ~/.vim/.myvimbuf<CR>
map <C-P> O<Esc>:.!cat ~/.vim/.myvimbuf<CR>

autocmd BufWritePre  *.{js,md,ejs,html,css,jade,json,txt,php}  call StripTrailingWhite()

function StripTrailingWhite()
  let l:winview = winsaveview()
  silent! %s/\s\+$//
  call winrestview(l:winview)
endfunction


" Map to esc
inoremap jk <Esc>

" Load up templates!
function LoadTemplate()
  silent! 0r ~/.vim/skel/tmpl.%:e
  " Highlight %VAR% placeholders with the Todo colour group
  syn match Todo "%\u\+%" containedIn=ALL
endfunction
autocmd! BufNewFile * call LoadTemplate()

"Jump between %VAR% placeholders in Normal mode with
" <Ctrl-p>
nnoremap <c-l> /%\u.\{-1,}%<cr>c/%/e<cr>

"Jump betweeen %VAR% placeholders in Insert mode with
" <Ctrl-p>
inoremap <c-l> /%\u.\{-1,}%<cr>c/%/e<cr>

filetype plugin on
set tags+=tags;
