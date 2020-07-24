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
  \ "Unknown"   : "?"
  \ ***REMOVED***

" autocmd FileType ruby setlocal omnifunc=LanguageClient#complete
" au BufWrite *.rb :Autoformat

"Auto focus new nerdtree opened file"
autocmd BufNew * wincmd l

" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

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


" coc {{{
    let g:coc_global_extensions = [
    \ 'coc-yaml',
    \ 'coc-css',
    \ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-git',
    \ 'coc-eslint',
    \ 'coc-tslint-plugin',
    \ 'coc-pairs',
    \ 'coc-sh',
    \ 'coc-vimlsp',
    \ 'coc-emmet',
    \ 'coc-prettier',
    \ 'coc-ultisnips',
    \ 'coc-explorer',
    \ 'coc-diagnostic',
    \ 'coc-tailwindcss',
    \ 'coc-reason',
    \ 'coc-tabnine',
    \ 'coc-solargraph'
    \ ]

    autocmd CursorHold * silent call CocActionAsync('highlight')

    " coc-prettier
    command! -nargs=0 Prettier :CocCommand prettier.formatFile
    nmap <leader>f :CocCommand prettier.formatFile<cr>

    " coc-git
    nmap [g <Plug>(coc-git-prevchunk)
    nmap ]g <Plug>(coc-git-nextchunk)
    nmap gs <Plug>(coc-git-chunkinfo)
    nmap gu :CocCommand git.chunkUndo<cr>

    nmap <silent> <leader>k :CocCommand explorer<cr>

    "remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    nmap <silent> gh <Plug>(coc-doHover)

    " diagnostics navigation
    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)

    " rename
    nmap <silent> <leader>rn <Plug>(coc-rename)

    " Remap for format selected region
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    " organize imports
    command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
    ***REMOVED***if
***REMOVED***function

    "tab completion
    inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
***REMOVED***function

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    if exists('*complete_info')
        inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
        imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
***REMOVED***if

    " For enhanced <CR> experience with coc-pairs checkout :h coc#on_enter()
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
          \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" ***REMOVED******REMOVED******REMOVED***
