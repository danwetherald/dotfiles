call plug#begin('~/.config/nvim/plugged')

Plug 'Yggdroot/indentLine'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' ***REMOVED***
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' ***REMOVED***
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'zxqfl/tabnine-vim'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ ***REMOVED***

Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'branch': 'release/1.x' ***REMOVED***

Plug 'Chiel92/vim-autoformat'

" Comments
Plug 'tomtom/tcomment_vim'

" Git
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

" Javascript
Plug 'https://github.com/othree/javascript-libraries-syntax.vim', { 'for': [ 'javascript', 'js', 'jsx' ]***REMOVED***
Plug 'thinca/vim-textobj-function-javascript',    { 'for': [ 'javascript', 'js', 'jsx' ]***REMOVED***
Plug '1995eaton/vim-better-javascript-completion', { 'for': [ 'javascript', 'js', 'jsx' ]***REMOVED***
Plug 'chemzqm/vim-jsx-improve', { 'for': [ 'javascript', 'js', 'jsx' ]***REMOVED***
Plug 'gavocanov/vim-js-indent', { 'for': [ 'javascript', 'js', 'jsx' ]***REMOVED***

" Graphql
Plug 'jparise/vim-graphql'

Plug 'cakebaker/scss-syntax.vim'

" HTML
Plug 'tpope/vim-ragtag'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'skwp/vim-html-escape'

Plug 'ryanoasis/vim-devicons'

Plug 'dracula/vim', { 'as': 'dracula' ***REMOVED***

call plug#***REMOVED***()
