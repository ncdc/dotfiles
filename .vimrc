set nocompatible
" filetype off

" work around https://github.com/vim/vim/issues/3117
if has('python3')
  silent! python3 1
endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')


" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

" let Vundle manage Vundle, required
" Plugin 'gmarik/Vundle.vim'

" Misc
Plug 'quanganhdo/grb256'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'

" File/nav Plugins
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'christoomey/vim-tmux-navigator'
Plug 'Lokaltog/vim-easymotion'
Plug 'yssl/QFEnter'
Plug '/usr/local/opt/fzf'

" Completion
Plug 'ervandew/supertab'

" Tags
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

" Colors
Plug 'altercation/vim-colors-solarized'

" Languages
Plug 'fatih/vim-go', {'tag': '*', 'do': ':GoUpdateBinaries'}
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-markdown'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'saltstack/salt-vim'
Plug 'w0rp/ale'

" Text
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'embear/vim-foldsearch'
Plug 'bronson/vim-visual-star-search'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-syntastic/syntastic'

let g:syntastic_sh_shellcheck_args = "-x"

if has('nvim')
  Plug 'Shougo/deoplete.nvim'
  Plug 'zchee/deoplete-go', { 'do': 'make'}
endif

" Builds
" Plugin 'tpope/vim-dispatch.git'

" Snippets
Plug 'SirVer/ultisnips'


" Disabled
" Plugin 'jeffkreeftmeijer/vim-numbertoggle.git'
" Plugin 'tpope/vim-pathogen.git'
" Plugin 'nelstrom/vim-textobj-rubyblock.git'
" Plugin 'kana/vim-textobj-user.git'
" Plugin 'wesQ3/vim-windowswap.git'
" Plugin 'tomtom/tcomment_vim'
" Plugin 'tomtom/tlib_vim.git'
" Plugin 'MarcWeber/vim-addon-local-vimrc.git'
" Plugin 'MarcWeber/vim-addon-mw-utils.git'

" All of your Plugins must be added before the following line
"call vundle#end()            " required

call plug#end()

" filetype plugin indent on

"runtime bundle/vim-pathogen/autoload/pathogen.vim
"execute pathogen#infect()

set modeline
set modelines=5
" syntax on
set t_Co=256
set bg=dark
color grb256
"color solarized
set ai
set copyindent
set showmatch
set smartcase
set si
set is
set hls
set et
set sr
set ts=2
set sts=2
set sw=2
set ruler
set number
set bs=2
set laststatus=2
set hidden
set title
set nobackup
set noswapfile
set textwidth=100
set splitbelow
set splitright

let mapleader=","

augroup vimrc_autocmds
  " clear
  au!

  " autocmd vimenter * if !argc() | NERDTree | endif
  au BufRead,BufNewFile *.ru,Gemfile setfiletype ruby
  "au FileType go au BufWritePre <buffer> Fmt
  au FileType go setlocal noexpandtab
  "au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
  "au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
  "au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <leader>f  <Plug>(go-test-func)
  au FileType go nmap gd <Plug>(go-def)
  au FileType go nmap gb <Plug>(go-build)
  au FileType go nmap <Leader>gd <Plug>(go-doc)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <Leader>yb V$%$y$%
  au FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)

augroup END

" let g:go_auto_type_info = 1
let g:go_bin_path = expand("$HOME/go/bin")
let g:go_def_mode = "gopls"

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" don't skip over wrapped lines
nmap j gj
nmap k gk

match ErrorMsg '\s\+$'
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

nnoremap <F6> :set invpaste paste?<CR>
set pastetoggle=<F6>
set showmode
map <F5> :NERDTreeFind<CR>o
map <S-F5> :NERDTreeToggle<CR>
map <S-F17> :NERDTreeToggle<CR>
nmap <silent> <leader>m :TagbarToggle<CR>
map <S-T> :TagbarCurrentTag<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

nmap <silent> <leader>rf vipgq

set mouse=a
if !has('nvim')
  set ttymouse=sgr
endif

runtime macros/matchit.vim

set statusline=%t              "tail of the filename
set statusline+=%h             "help file flag
set statusline+=%m             "modified flag
set statusline+=%r             "read only flag
set statusline+=%y             "file type
set statusline+=%=             "left/right separator
set statusline+=%c,            "cursor column
set statusline+=%l/%L          "cursor line/total lines
set statusline+=[%o]           "byte offset
" go command status (requires vim-go)
set statusline+=%#goStatuslineColor#
set statusline+=%{go#statusline#Show()}
set statusline+=%*


if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --ignore Godeps'
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0

  function! CtrlPUserCommandToggle()
    let match = matchstr(g:ctrlp_user_command, "Godeps")
    if empty(match)
      let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --ignore Godeps --ignore vendor'
    else
      let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    endif
    let g:ctrlp_user_command
  endfunction
  nnoremap <Leader>pgd :call CtrlPUserCommandToggle()<CR>

  let s:agWithIgnores="ag --nogroup --nocolor --ignore '*test*' --ignore '*generated*' --ignore '*protobuf*' --ignore '*.pb.go' --ignore _output --ignore staging --ignore vendor"
  let s:fullAg="ag --nogroup --nocolor"
  let &grepprg=s:agWithIgnores
  function! AgCommandToggle()
    let match = matchstr(&grepprg, "test")
    if empty(match)
      let &grepprg=s:agWithIgnores
    else
      let &grepprg=s:fullAg
    endif
    set grepprg
  endfunction
  nnoremap <Leader>grep :call AgCommandToggle()<CR>
endif

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

let g:ctrlp_extensions = ['buffertag']

set wildignore+=*.pyc

let g:ctrlp_custom_ignore = {
\ 'dir': '\v[\/]\.(git|hg|svn)$',
\ 'file': '\v\.(pyc|a)$'
\ }

let g:ctrlp_buftag_types = {
\ 'go' : '--language-force=go --golang-types=ftv'
\ }

let g:ctrlp_buftag_types = {
  \ 'go' : {
    \ 'bin': 'gotags',
    \ 'args': '-sort -silent'
  \ }
\ }

" force the cwindow to be on the very bottom
autocmd FileType qf wincmd J

" bind K to grep word under cursor
"nnoremap <C-K> :grep! "\b<C-R><C-W>\b"<CR>:cwindow<CR>

" bind \ to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

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

let g:tagbar_position = 'leftabove vertical'

call xolox#easytags#filetypes#add_mapping('go', 'go')
" let g:easytags_dynamic_files = 2
let g:easytags_file = '~/.vim/tags'

let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "camelcase"

if &term =~ '^screen'
"  " allow mouse to resize splits in tmux
"  set ttymouse=xterm2
  execute "set <F1>=\eOP"
  execute "set <F2>=\eOQ"
  execute "set <F3>=\eOR"
  execute "set <F4>=\eOS"
  execute "set <xF1>=\eO1;*P"
  execute "set <xF2>=\eO1;*Q"
  execute "set <xF3>=\eO1;*R"
  execute "set <xF4>=\eO1;*S"
  execute "set <F5>=\e[15;*~"
  execute "set <F6>=\e[17;*~"
  execute "set <F7>=\e[18;*~"
  execute "set <F8>=\e[19;*~"
  execute "set <F9>=\e[20;*~"
  execute "set <F10>=\e[21;*~"
  execute "set <F11>=\e[23;*~"
  execute "set <F12>=\e[24;*~"
endif

let NERDTREEIgnore = ['\.pyc$', '^tags$']

" enable per-directory .vimrc files
set exrc
" disable unsafe commands in local .vimrc files
set secure

let g:go_autodetect_gopath = 0

hi StatusLineNC ctermbg=green ctermfg=black

" go lint support
" set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
" autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

" exit insert mode by pressing jj
imap jj <esc>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>d :GoDecls<CR>
autocmd FileType go nmap <leader>D :GoDeclsDir<CR>

" let g:go_auto_sameids = 1

set autowrite

let g:qfenter_vopen_map = ['<C-v>']
let g:qfenter_hopen_map = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_topen_map = ['<C-t>']

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#whitespace#enabled = 0

" When yanking, put it in the unnamed register, which is the system clipboard!!!
" set clipboard=unnamed
