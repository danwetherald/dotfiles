call functions#PlugLoad()
call plug#begin('~/dotfiles/nvim/plugged')

" General {{{
    " Abbreviations
    abbr funciton function
    abbr teh the
    abbr tempalte template
    abbr fitler filter
    abbr cosnt const
    abbr attribtue attribute
    abbr attribuet attribute

    set modifiable

    set autoread " detect when a file is changed

    set history=2000 " change history to 2000
    set textwidth=120

    set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set nobackup
    set nowritebackup
    set noswapfile

    if (has('nvim'))
        " show results of substition as they're happening
        " but don't open a split
        set inccommand=nosplit
***REMOVED***if

    set backspace=indent,eol,start " make backspace behave in a sane manner

    if has('mouse')
        set mouse=a
***REMOVED***if

    " Searching
    set ignorecase " case insensitive searching
    set smartcase " case-sensitive if expresson contains a capital letter
    set hlsearch " highlight search results
    set incsearch " set incremental search, like modern browsers
    set nolazyredraw " don't redraw while executing macros

    set magic " Set magic on, for regex

    " error bells
    set noerrorbells
    set visualbell
    set t_vb=
    set tm=500

    " Use persistent history.
    if !isdirectory("/tmp/.vim-undo-dir")
        call mkdir("/tmp/.vim-undo-dir", "", 0700)
***REMOVED***if
    set undodir=/tmp/.vim-undo-dir
    set undofile

" ***REMOVED******REMOVED******REMOVED***

" Appearance {{{
    set ttyfast " faster redrawing
    set nowrap
    set linebreak
    set showbreak=↪
    set diffopt+=vertical,iwhite,internal,algorithm:patience,hiddenoff
    set laststatus=2 " show the status line all the time
    set so=10 " set 10 lines to the cursors - when moving vertical
    set wildmenu " enhanced command line completion
    set hidden " current buffer can be put into background
    set showcmd " show incomplete commands
    set noshowmode " don't show which mode disabled for PowerLine
    set wildmode=list:longest " complete files like a shell
    set shell=$SHELL
    set cmdheight=1 " command bar height
    set title " set terminal title
    set showmatch " show matching braces
    set mat=2 " how many tenths of a second to blink
    set updatetime=250
    set synmaxcol=200
    set signcolumn=yes
    set shortmess+=c
    set number relativenumber
    set clipboard=unnamed
    set splitbelow splitright
    set ruler

    " Tab control
    set autoindent " automatically set indent of new line
    set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
    set tabstop=2 shiftwidth=2 expandtab
    set softtabstop=2

    " code folding settings
    " set foldmethod=syntax " fold based on indent
    " set foldlevelstart=99
    " set foldnestmax=10 " deepest fold is 10 levels
    " set nofoldenable " don't fold by default
    " set foldlevel=1

    " toggle invisible characters
    set list
    " set listchars=tab:→\ ,eol:¬,trail:⋅,ext***REMOVED***s:❯,precedes:❮

    " Explicitly tell vim that the terminal supports 256 colors
    set t_Co=256

    " switch cursor to line when in insert mode, and block when not
    set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175

    if &term =~ '256color'
        " disable background color erase
        set t_ut=
***REMOVED***if

    " enable 24 bit color support if supported
    " if has("termguicolors")
    "     let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    "     let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    "     set termguicolors
    " ***REMOVED***if

    " highlight conflicts
    match ErrorMsg '^\(<\|=\|>\)\{7\***REMOVED***\([^=].\+\)\?$'

    " Dev Icons
    Plug 'ryanoasis/vim-devicons'
    
    " Better syntax
    Plug 'sheerun/vim-polyglot'

    " Load colorschemes
    Plug 'dracula/vim', { 'as': 'dracula' ***REMOVED***
    Plug 'joshdick/onedark.vim', { 'as': 'onedark' ***REMOVED***

    " LightLine {{{
        Plug 'itchyny/lightline.vim'

        let g:lightline = { 'colorscheme': 'solarized' ***REMOVED***

        let g:lightline = {
          \ 'colorscheme': 'onedark',
          \***REMOVED***
    " ***REMOVED******REMOVED******REMOVED***
" ***REMOVED******REMOVED******REMOVED***

" General Mappings {{{
    " set a map leader for more key combos
    let mapleader = ','

    " remap esc
    inoremap jj <esc>

    " shortcut to save
    nmap <leader>, :w<cr>

    " set paste toggle
    set pastetoggle=<leader>v
    
    " edit ~/.config/nvim/init.vim
    map <leader>ev :e! ~/.config/nvim/init.vim<cr>
    " edit gitconfig
    map <leader>eg :e! ~/.gitconfig<cr>

    " clear highlighted search
    noremap <space> :set hlsearch! hlsearch?<cr>

    " activate spell-checking alternatives
    nmap ;s :set invspell spelllang=en<cr>

    " markdown to html
    nmap <leader>md :%!markdown --html4tags <cr>

    " remove extra whitespace
    nmap <leader><space> :%s/\s\+$<cr>
    nmap <leader><space><space> :%s/\n\{2,***REMOVED***/\r\r/g<cr>

    inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
    inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

    nmap <leader>l :set list!<cr>

    " keep visual selection when indenting/outdenting
    vmap < <gv
    vmap > >gv

    " switch between current and last buffer
    nmap <leader>. <c-^>

    " enable . command in visual mode
    vnoremap . :normal .<cr>

    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

    map <leader>wc :wincmd q<cr>

    " move line mappings
    " ∆ is <A-j> on macOS
    " ˚ is <A-k> on macOS
    nnoremap ∆ :m .+1<cr>==
    nnoremap ˚ :m .-2<cr>==
    inoremap ∆ <Esc>:m .+1<cr>==gi
    inoremap ˚ <Esc>:m .-2<cr>==gi
    vnoremap ∆ :m '>+1<cr>gv=gv
    vnoremap ˚ :m '<-2<cr>gv=gv

    vnoremap $( <esc>`>a)<esc>`<i(<esc>
    vnoremap $[ <esc>`>a]<esc>`<i[<esc>
    vnoremap ${ <esc>`>a***REMOVED***<esc>`<i{<esc>
    vnoremap $" <esc>`>a"<esc>`<i"<esc>
    vnoremap $' <esc>`>a'<esc>`<i'<esc>
    vnoremap $\ <esc>`>o*/<esc>`<O/*<esc>
    vnoremap $< <esc>`>a><esc>`<i<<esc>

    " toggle cursor line
    nnoremap <leader>i :set cursorline!<cr>

    " scroll the viewport faster
    nnoremap <C-e> 3<C-e>
    nnoremap <C-y> 3<C-y>

    " moving up and down work as you would expect
    nnoremap <silent> j gj
    nnoremap <silent> k gk
    nnoremap <silent> ^ g^
    nnoremap <silent> $ g$

    " helpers for dealing with other people's code
    nmap \t :set ts=4 sts=4 sw=4 noet<cr>
    nmap \s :set ts=4 sts=4 sw=4 et<cr>

    nnoremap <silent> <leader>u :call functions#HtmlUnEscape()<cr>

    command! Rm call functions#Delete()
    command! RM call functions#Delete() <Bar> q!

    " Custom text objects

    " inner-line
    xnoremap <silent> il :<c-u>normal! g_v^<cr>
    onoremap <silent> il :<c-u>normal! g_v^<cr>

    " around line
    vnoremap <silent> al :<c-u>normal! $v0<cr>
    onoremap <silent> al :<c-u>normal! $v0<cr>

    " Interesting word mappings
    nmap <leader>0 <Plug>ClearInterestingWord
    nmap <leader>1 <Plug>HiInterestingWord1
    nmap <leader>2 <Plug>HiInterestingWord2
    nmap <leader>3 <Plug>HiInterestingWord3
    nmap <leader>4 <Plug>HiInterestingWord4
    nmap <leader>5 <Plug>HiInterestingWord5
    nmap <leader>6 <Plug>HiInterestingWord6
" ***REMOVED******REMOVED******REMOVED***

" AutoGroups {{{
    " file type specific settings
    augroup configgroup
        autocmd!

        " automatically resize panes on resize
        autocmd VimResized * exe 'normal! \<c-w>='
        autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
        autocmd BufWritePost .vimrc.local source %
        " save all files on focus lost, ignoring warnings about untitled buffers
        autocmd FocusLost * silent! wa

        " make quickfix windows take all the lower section of the screen
        " when there are multiple windows open
        autocmd FileType qf wincmd J
        autocmd FileType qf nmap <buffer> q :q<cr>
        " coc  correct comment highlighting
        autocmd FileType json syntax match Comment +\/\/.\+$+
    augroup END
" ***REMOVED******REMOVED******REMOVED***

" General Functionality {{{
    " better terminal integration
    " substitute, search, and abbreviate multiple variants of a word
    Plug 'tpope/vim-abolish'

    " easy commenting motions
    Plug 'tpope/vim-commentary'

    " mappings which are simply short normal mode aliases for commonly used ex commands
    Plug 'tpope/vim-unimpaired'

    " ***REMOVED***ings for html, xml, etc. - ehances surround
    Plug 'tpope/vim-ragtag'

    " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
    Plug 'tpope/vim-surround'

    " tmux integration for vim
    Plug 'benmills/vimux'

    " enables repeating other supported plugins with the . command
    Plug 'tpope/vim-repeat'

    " .editorconfig support
    Plug 'editorconfig/editorconfig-vim'

    " single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
    Plug 'AndrewRadev/splitjoin.vim'

    " https://github.com/norcalli/nvim-colorizer.lua/blob/master/README.md
    Plug 'norcalli/nvim-colorizer.lua'

    " detect indent style (tabs vs. spaces)
    Plug 'tpope/vim-sleuth'

    " Startify: Fancy startup screen for vim {{{
        Plug 'mhinz/vim-startify'

        " Don't change to directory when selecting a file
        let g:startify_files_number = 5
        let g:startify_change_to_dir = 0
        let g:startify_custom_header = [ ]
        let g:startify_relative_path = 1
        let g:startify_use_env = 1

        " Custom startup list, only show MRU from current directory/project
        let g:startify_lists = [
        \  { 'type': 'dir',       'header': [ 'Files '. getcwd() ] ***REMOVED***,
        \  { 'type': function('helpers#startify#listcommits'), 'header': [ 'Recent Commits' ] ***REMOVED***,
        \  { 'type': 'sessions',  'header': [ 'Sessions' ]       ***REMOVED***,
        \  { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]      ***REMOVED***,
        \  { 'type': 'commands',  'header': [ 'Commands' ]       ***REMOVED***,
        \ ]

        let g:startify_commands = [
        \   { 'uc': [ 'Clean Plugins', ':PlugClean' ] ***REMOVED***,
        \   { 'up': [ 'Update Plugins', ':PlugUpdate' ] ***REMOVED***,
        \   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] ***REMOVED***,
        \ ]

        let g:startify_bookmarks = [
            \ { 'd': '~/dotfiles' ***REMOVED***,
            \ { 'c': '~/.config/nvim/init.vim' ***REMOVED***,
            \ { 'h': '/Volumes/config' ***REMOVED***,
            \ { 'g': '~/.gitconfig' ***REMOVED***,
            \ { 'z': '~/.zshrc' ***REMOVED***
        \ ]

        autocmd User Startified setlocal cursorline
        nmap <leader>st :Startify<cr>
    " ***REMOVED******REMOVED******REMOVED***

    " context-aware pasting
    Plug 'sickill/vim-pasta'

    " NERDTree {{{
        Plug 'scrooloose/nerdtree'
        Plug 'Xuyuanp/nerdtree-git-plugin'
        Plug 'ryanoasis/vim-devicons'
        Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

        let g:WebDevIconsOS = 'Darwin'
        let g:WebDevIconsUnicodeDecorateFolderNodes = 1
        let g:DevIconsEnableFoldersOpenClose = 1
        let g:DevIconsEnableFolderExtensionPatternMatching = 1
        let NERDTreeIgnore = ['\.DS_Store$']
        let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
        let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
        let NERDTreeNodeDelimiter = "\u263a" " smiley face
        let NERDTreeShowHidden = 1
        let NERDTreeDirArrowExpandable = '▷'
        let NERDTreeDirArrowCollapsible = '▼'
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
        let g:NERDTreeGitStatusLogLevel = 3
        let g:NERDTreeIgnore = ['^node_modules$']
        
        augroup nerdtree
            autocmd!
            autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
            autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
        augroup END
        
        " Auto open Nerd tree and start fzf
        autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | ***REMOVED***if
        autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'FZF' | ***REMOVED***if

        " Auto close Nerd tree if only window left
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | ***REMOVED***if

        " Toggle NERDTree
        function! ToggleNerdTree()
            if @% != "" && @% !~ "Startify" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
                :NERDTreeFind
            else
                :NERDTreeToggle
        ***REMOVED***if
    ***REMOVED***function

        " toggle nerd tree
        nmap <silent> <leader>n :call ToggleNerdTree()<cr>

        " find the current file in nerdtree without needing to reload the drawer
        nmap <silent> <leader>y :NERDTreeFind<cr>
    " ***REMOVED******REMOVED******REMOVED***

    " FZF {{{
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() ***REMOVED*** ***REMOVED***
        Plug 'junegunn/fzf.vim'

        let g:fzf_layout = { 'down': '~25%' ***REMOVED***
        let g:grepprg='rg --vimgrep'
        " let g:rg_find_command = 'rg --files --follow -g "!{.config,etc,node_modules,.git,target,.reast,.d,.cm,.DS_Store,.bs.js***REMOVED***/*"'
        let $FZF_DEFAULT_COMMAND = 'rg --files --follow -g "!{.config,etc,node_modules,.git,target,.reast,.d,.cm,.DS_Store,.bs.js***REMOVED***/*"'

        function! RipgrepFzf(query, fullscreen)
            let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
            let initial_command = printf(command_fmt, shellescape(a:query))
            let reload_command = printf(command_fmt, '{q***REMOVED***')
            let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]***REMOVED***
            call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
    ***REMOVED***function

        command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
        
        nmap <silent> <leader>t :FZF<cr>
        nmap <silent> <leader>r :RG<cr>
        nmap <silent> <leader>s :GFiles?<cr>
        nmap <leader><tab> <plug>(fzf-maps-n)
        xmap <leader><tab> <plug>(fzf-maps-x)
        omap <leader><tab> <plug>(fzf-maps-o)

        " Insert mode completion
        imap <c-x><c-k> <plug>(fzf-complete-word)
        imap <c-x><c-f> <plug>(fzf-complete-path)
        imap <c-x><c-j> <plug>(fzf-complete-file-ag)
        imap <c-x><c-l> <plug>(fzf-complete-line)

        nnoremap <silent> <Leader>C :call fzf#run({
        \   'source':
        \     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
        \         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-***REMOVED***$', '', '')"),
        \   'sink':    'colo',
        \   'options': '+m',
        \   'left':    30
        \ ***REMOVED***)<CR>

        command! FZFMru call fzf#run({
        \  'source':  v:oldfiles,
        \  'sink':    'e',
        \  'options': '-m -x +s',
        \  'down':    '40%'***REMOVED***)

        command! -bang -nargs=* Find call fzf#vim#grep(
            \ 'rg --column --line-number --no-heading --follow --color=always '.<q-args>, 1,
            \ <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)
        command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)
        command! -bang -nargs=? -complete=dir GitFiles
            \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)
    " ***REMOVED******REMOVED******REMOVED***

    " vim-fugitive {{{
        Plug 'tpope/vim-fugitive'
        nmap <silent> <leader>gs :Gstatus<cr>
        nmap <leader>ge :Gedit<cr>
        nmap <silent><leader>gr :Gread<cr>
        nmap <silent><leader>gb :Gblame<cr>

        Plug 'tpope/vim-rhubarb' " hub extension for fugitive
        Plug 'sodapopcan/vim-twiggy'
        Plug 'rbong/vim-flog'
    " ***REMOVED******REMOVED******REMOVED***

    " UltiSnips {{{
        Plug 'SirVer/ultisnips' " Snippets plugin
        let g:UltiSnipsExpandTrigger="<C-l>"
        let g:UltiSnipsJumpForwardTrigger="<C-j>"
        let g:UltiSnipsJumpBackwardTrigger="<C-k>"
    " ***REMOVED******REMOVED******REMOVED***
    
    " GraphQL {{{
        Plug 'jparise/vim-graphql'
    " ***REMOVED******REMOVED******REMOVED***"
    
    " coc {{{
        Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'***REMOVED***

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
        \ 'coc-rescript',
        \ 'coc-tabnine',
        \ 'coc-solargraph',
        \ 'coc-prisma',
        \ 'coc-html',
        \ 'coc-graphql',
        \ 'coc-go'
        \ ]

        autocmd CursorHold * silent call CocActionAsync('highlight')

        " coc-go
        autocmd BufWritePre *.go :call CocAction('organizeImport')

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
" ***REMOVED******REMOVED******REMOVED***

" Language-Specific Configuration {{{
    " html / templates {{{
        " emmet support for vim - easily create markdup wth CSS-like syntax
        Plug 'mattn/emmet-vim'

        " match tags in html, similar to paren support
        Plug 'gregsexton/MatchTag', { 'for': 'html' ***REMOVED***

        " html5 support
        Plug 'othree/html5.vim', { 'for': 'html' ***REMOVED***

        Plug 'tpope/vim-ragtag'
        Plug 'AndrewRadev/splitjoin.vim'
        Plug 'skwp/vim-html-escape'
        Plug 'cakebaker/scss-syntax.vim'
    " ***REMOVED******REMOVED******REMOVED***

    " JavaScript {{{
        Plug 'https://github.com/othree/javascript-libraries-syntax.vim', { 'for': [ 'javascript', 'js', 'jsx' ]***REMOVED***
        Plug 'thinca/vim-textobj-function-javascript',    { 'for': [ 'javascript', 'js', 'jsx' ]***REMOVED***
        Plug '1995eaton/vim-better-javascript-completion', { 'for': [ 'javascript', 'js', 'jsx' ]***REMOVED***
        Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'js', 'jsx'] ***REMOVED***
        Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx', 'js', 'jsx'] ***REMOVED***
    " ***REMOVED******REMOVED******REMOVED***

    " ReasonML {{{
        Plug 'reasonml-editor/vim-reason-plus'
        Plug 'amiralies/vim-rescript'
        Plug 'ryyppy/vim-rescript'
    " ***REMOVED******REMOVED******REMOVED***

    " TypeScript {{{
        Plug 'leafgarland/typescript-vim'
        Plug 'ianks/vim-tsx'
    " ***REMOVED******REMOVED******REMOVED***

    " Styles {{{
        Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] ***REMOVED***
        Plug 'groenewege/vim-less', { 'for': 'less' ***REMOVED***
        Plug 'hail2u/vim-css3-syntax', { 'for': 'css' ***REMOVED***
        Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' ***REMOVED***
        Plug 'stephenway/postcss.vim', { 'for': 'css' ***REMOVED***
    " ***REMOVED******REMOVED******REMOVED***

    " markdown {{{
        Plug 'tpope/vim-markdown', { 'for': 'markdown' ***REMOVED***
        let g:markdown_fenced_languages = [ 'tsx=typescript.tsx' ]

        " Open markdown files in Marked.app - mapped to <leader>m
        Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' ***REMOVED***
        nmap <leader>m :MarkedOpen!<cr>
        nmap <leader>mq :MarkedQuit<cr>
        nmap <leader>* *<c-o>:%s///gn<cr>
    " ***REMOVED******REMOVED******REMOVED***

    " JSON {{{
        Plug 'elzr/vim-json', { 'for': 'json' ***REMOVED***
        let g:vim_json_syntax_conceal = 0
    " ***REMOVED******REMOVED******REMOVED***
    
    " Docker {{{
        Plug 'ekalinin/Dockerfile.vim'
    " ***REMOVED******REMOVED******REMOVED***
" ***REMOVED******REMOVED******REMOVED***

call plug#***REMOVED***()

" Colorscheme and final setup {{{
    " This call must happen after the plug#***REMOVED***() call to ensure
    " that the colorschemes have been loaded
    colorscheme onedark

    syntax on
    filetype plugin indent on

    " make the highlighting of tabs and other non-text less annoying
    highlight SpecialKey ctermfg=19 guifg=#333333
    highlight NonText ctermfg=19 guifg=#333333

    " make comments and HTML attributes italic
    highlight Comment cterm=italic term=italic gui=italic
    highlight htmlArg cterm=italic term=italic gui=italic
    highlight xmlAttrib cterm=italic term=italic gui=italic
    highlight Type cterm=italic term=italic gui=italic
    highlight Normal ctermbg=none
" ***REMOVED******REMOVED******REMOVED***
