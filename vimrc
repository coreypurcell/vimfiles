
set shell=bash
set nocompatible
syntax enable
set encoding=utf-8

call pathogen#infect()
filetype plugin indent on 	"load file type plugins + indentation

let &t_Co=256
set background=light
color solarized
set nonumber
set ruler                   "show the cursor position all the time
set cursorline
set showcmd			            "display incomplete commands

"" Whitespace
set nowrap
set tabstop=2 shiftwidth=2
set expandtab
set list                    " show invisible characters
set backspace=indent,eol,start

"" List Chars
set listchars=""              " Reset the listchars
set listchars=tab:\ \         " a tab should be "   "
set listchars+=trail:.        " show trailing spaces as dots
set listchars+=extends:>      " when not wrapping last column should be >
set listchars+=precedes:<

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=80
endfunction

if has("autocmd")
  " Use real tabs inside make files
  au FileType make set noexpandtab

  " JSON files should be javascript
  au BufNewFile,BufRead *.json set ft=javascript

endif

" provide context when editing
set scrolloff=3

" clear search filter when hitting return
:nnoremap <CR> :nohlsearch<cr>

let mapleader=","

map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gf :CommandTFlush<cr>\|:CommandT features<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>

nnoremap <leader><leader> <c-^>

" easier navigation in split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

map <Left> :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up> :echo "no!"<cr>
map <Down> :echo "no!"<cr>

if has("statusline") && !&cp
  set laststatus=2          "always show status bar

  " Start the status line
  set statusline=%f\ %m\ %r

  " Add fugitive
  set statusline+=%{fugitive#statusline()}

  " Finish the statusline
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
endif

let g:CommandTMaxHeight=10
