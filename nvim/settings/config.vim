set nocompatible

runtime macros/matchit.vim

filetype plugin indent on

set encoding=UTF-8

set termguicolors
syntax on
colorscheme dracula

let g:node_host_prog = '/usr/local/bin/neovim-node-host'
let g:rustfmt_autosave = 1

hi htmlArg gui=italic
hi Comment gui=italic
hi Type    gui=italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type    cterm=italic

set ttyfast " faster redrawing
set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set hlsearch                                                 " highlight search results
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=space:·,tab:▸\ ,trail:▫,ext***REMOVED***s:>,precedes:<,nbsp:+,eol:¬
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=2 shiftwidth=2 expandtab
set lazyredraw
set synmaxcol=200
set updatetime=250
set nowb
set nobackup
set noswapfile

set conceallevel=0
let g:indentLine_conceallevel = 0

set splitbelow splitright
set fillchars+=vert:\ 

set undofile
set undodir=~/.config/nvim/undo

set nowrap
set linebreak

" turn relative line numbers on
:set number relativenumber

" auto turn on realtive numbers when focus window
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" force javascript syntax
autocmd BufRead *.js set filetype=javascript
autocmd BufRead *.es6 set filetype=javascript
autocmd BufRead *.jsx set filetype=javascript
" autocmd BufRead *.prisma set filetype=javascript

set mouse=a

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
***REMOVED***if

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP

" Don't change to directory when selecting a file
let g:startify_files_number = 5
let g:startify_change_to_dir = 0
let g:startify_custom_header = [ ]
let g:startify_relative_path = 1
let g:startify_use_env = 1

let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | ***REMOVED***if
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | ***REMOVED***if

let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "✹",
  \ "Staged"    : "✚",
  \ "Untracked" : "✭",
  \ "Renamed"   : "➜",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "✗",
  \ "Clean"     : "✔︎",
  \ 'Ignored'   : '☒',
  \ "Unknown"   : "?"
  \ ***REMOVED***

let g:LanguageClient_autoStop = 0
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['tcp://localhost:7658']
    \ ***REMOVED***

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

autocmd FileType ruby setlocal omnifunc=LanguageClient#complete

"Auto focus new nerdtree opened file"
autocmd BufNew * wincmd l

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

au BufWrite *.rb :Autoformat

au BufNewFile,BufRead *.prisma setfiletype graphql

" disable quickfix pop up
let g:prettier#quickfix_enabled = 0

" disable auto formatting
let g:prettier#autoformat = 0

" force async (vim 8+)
" let g:prettier#exec_cmd_async = 1
"
let g:prettier#nvim_unstable_async=1

let $FZF_DEFAULT_OPTS .= ' --border --margin=0,2'
let $FZF_DEFAULT_COMMAND = 'rg --files --follow -g "!{.config,etc,node_modules,.git,target,.reast,.d,.cm***REMOVED***/*"'

function! FloatingFZF()
  let width = float2nr(&columns * 0.9)
  let height = float2nr(&lines * 0.6)
  let opts = { 'relative': 'editor',
             \ 'row': (&lines - height) / 2,
             \ 'col': (&columns - width) / 2,
             \ 'width': width,
             \ 'height': height ***REMOVED***

  let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')
***REMOVED***function

" let g:fzf_layout = { 'down': '~25%' ***REMOVED***
let g:fzf_layout = { 'window': 'call FloatingFZF()' ***REMOVED***

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


"Use ripgrep
let g:ackprg = 'rg --vimgrep --no-heading'
let g:grepprg='rg --vimgrep'

let g:rg_find_command = 'rg --files --follow  -g "!{.config,etc,node_modules,.git,target,.reast,.d,.cm***REMOVED***/*"'

command! -bang -nargs=* Rg call fzf#vim#files('.', {'source': g:rg_find_command***REMOVED***, 0)

command! -bang -nargs=* Find call fzf#vim#grep(
  \ 'rg --column --line-number --no-heading --follow --ignore-case --color=always '.<q-args>, 1,
  \ <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q***REMOVED***')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]***REMOVED***
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
***REMOVED***function

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

command! LS call fzf#run(fzf#wrap({'source': 'ls'***REMOVED***))

let g:rg_find_command = 'rg --files --follow  -g "!{.config,etc,node_modules,.git,target,.reast,.d,.cm***REMOVED***/*"'
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=* Rg call fzf#vim#files('.', {'source': g:rg_find_command***REMOVED***, 0)

" LightLine Config
let g:lightline = {
  \ 'colorscheme': 'dracula'
\***REMOVED***
