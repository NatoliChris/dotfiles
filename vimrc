"  vim: set sw=4 ts=4 sts=4 et tw=80 foldmarker={,} foldlevel=0 foldmethod=marker spell:

" Environment {

    " Basics {
        set nocompatible        " Must be first line
        if !(has('win16') || has('win32') || has('win64'))
            set shell=/bin/sh
        endif
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if has('win32') || has('win64')
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }

    " Setup Bundle Support {
        " The next three lines ensure that the ~/.vim/bundle/ system works
        filetype on
        filetype off
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#rc()
    " }

" }
"
" General {

    if !has('gui')
        "set term=$TERM          " Make arrow and other keys work
    endif
    filetype plugin indent on   " Automatically detect file types.
    filetype plugin on
    filetype indent on
    syntax on                   " Syntax highlighting
    syntax enable
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8

    if has ('x') && has ('gui') " On Linux use + register for copy-paste
        set clipboard=unnamedplus
    elseif has ('gui')          " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif

    " Most prefer to automatically switch to the current file directory when
    " a new buffer is opened; to prevent this behavior, add the following to
    " your .vimrc.bundles.local file:
    " let g:spf13_no_autochdir = 1
    if !exists('g:spf13_no_autochdir')
        autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
        " Always switch to the current file directory
    endif

    "set autowrite                       " Automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    set spell                           " Spell checking on
    set hidden                          " Allow buffer switching without saving
    set nofoldenable                    " Stop autofolding when editing
    set modifiable
    set encoding=UTF-8

    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
    
    " Setting the colour scheme

    " Setting up the directories {
        set backup                  " Backups are nice ...
        if has('persistent_undo')
            set undofile                " So is persistent undo ...
            set undolevels=1000         " Maximum number of changes that can be undone
            set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
        endif

        " To disable views add the following to your .vimrc.bundles.local file:
        "   let g:spf13_no_views = 1
        if !exists('g:spf13_no_views')
            " Add exclusions to mkview and loadview
            " eg: *.*, svn-commit.tmp
            let g:skipview_files = [
                \ '\[example pattern\]'
                \ ]
        endif
    " }

" }

" Vim UI {
    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode

    set cursorline                  " Highlight current line

    highlight clear SignColumn      " SignColumn should match background for
                                    " things like vim-gitgutter

    " autocmd VimEnter * NERDTree

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

       " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

        let g:airline_theme='powerlineish'       " airline users use the powerline theme
        let g:airline_powerline_fonts=1          " and the powerline fonts
    endif

    set backspace=indent,eol,start                  " Backspace for dummies
    set linespace=0                                 " No extra spaces between rows
    set nu                                          " Line numbers on
    " set relativenumber                              " Sets relative number
    set colorcolumn=80                              " Set the maximum characters on a line to 100
    set showmatch                                   " Show matching brackets/parenthesis
    set incsearch                                   " Find as you type search
    set hlsearch                                    " Highlight search terms
    set winminheight=0                              " Windows can be 0 line high
    set ignorecase                                  " Case insensitive search
    set smartcase                                   " Case sensitive when uc present
    set wildmenu                                    " Show list instead of just completing
    set whichwrap=b,s,h,l,<,>,[,]                   " Backspace and cursor keys wrap too
    set scrolljump=5                                " Lines to scroll when cursor leaves screen
    set scrolloff=3                                 " Minimum lines to keep above and below cursor
    set foldenable                                  " Auto fold code
    set list
    set listchars=tab:>\ ,trail:•,extends:#,nbsp:• " Highlight problematic whitespace
" }

" NERDTree {
    let g:nerdtree_tabs_open_on_console_startup = 0
    let g:nerdtree_tabs_synchronize_view = 1
    let g:nerdtree_tabs_focus_on_files = 1

" }

" Tables {
    let g:table_mode_corner="|"
" }

" Formatting {
"
    " git commit
    "
    autocmd FileType gitcommit DiffGitCached | wincmd L | wincmd p

    set nowrap                      " Wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    "set noexpandtab                 " Don't expand the tab
    set softtabstop=4               " Let backspace delete indent
    "set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    " autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()
    " autocmd FileType go autocmd BufWritePre <buffer> Fmt
    autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
    autocmd FileType haskell setlocal expandtab shiftwidth=2 softtabstop=2
    " preceding line best in a plugin but here for now. 

    autocmd BufNewFile,BufRead *.coffee set filetype=coffee

    " Workaround vim-commentary for Haskell
    autocmd FileType haskell setlocal commentstring=--\ %s

    " Workaround broken colour highlighting in Haskell
    autocmd FileType haskell setlocal nospell
    autocmd FileType javascript setlocal nospell

    " Setting Solidity
    autocmd BufNewFile,BufRead *.sol set syntax=solidity

    " Setting LaTeX to spell
    autocmd FileType tex setlocal spell

" }

" Vim-LaTeX {
    let g:tex_flavor='latex'
    let g:Tex_MultipleCompileFormats = "pdf,bibtex,dvi"
    let g:Tex_ViewRule_pdf = "xdg-open >/dev/null 2>/dev/null"
    let g:Tex_FormatDependency_pdf="pdf"
    let g:Tex_DefaultTargetFormat = "pdf"
    let g:Tex_GotoError=0
    let g:Tex_Debug = 0
    let g:Tex_DebugLog = "Debug.log"
    let g:TCLevel = 4
    " let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode -file-line-error-style $*'
    let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode -file-line-error-style $*'
    let g:Tex_IgnoredWarnings =
                \"Underfull\n".
                \"Overfull\n".
                \"Font shape\n".
                \"Size substitutions with differences\n".
                \"specifier changed to\n".
                \"You have requested\n".
                \"Missing number, treated as zero.\n".
                \"There were undefined references\n".
                \"A float is stuck\n".
                \"Citation %.%# undefined\n"
" }

" YouCompleteMe {
"     let g:loaded_youcompleteme = 1
"     let g:ycm_semantic_triggers = {
"                 \ 'tex'  : ['{', '\']
"                 \}
"     let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"     let g:ycm_min_num_of_chars_for_completion = 1
"     let g:ycm_auto_trigger = 1
"     set completeopt=longest,menuone
" 
" }
"

" TagBar {
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
" }

" Key (re)Mappings {

    " The default leader is '\', but many people prefer ',' as it's in a standard
    " location. To override this behavior and set it back to '\' (or any other
    " character) add the following to your .vimrc.bundles.local file:
    let g:spf13_leader='\'
    "if !exists('g:spf13_leader')
    "    let mapleader = ','
    "else
    "    let mapleader=g:spf13_leader
    "endif

    " Easier escape
    imap jj <Esc>
    
    map <C-n> :NERDTreeToggle<CR>
    map <C-i> :TagbarToggle<CR>
    " Easier moving in tabs and windows
    " The lines conflict with the default digraph mapping of <C-K>
    " If you prefer that functionality, add let g:spf13_no_easyWindows = 1
    " in your .vimrc.bundles.local file

    if !exists('g:spf13_no_easyWindows')
        map <C-J> <C-W>j<C-W>_
        map <C-K> <C-W>k<C-W>_
        map <C-L> <C-W>l<C-W>_
        map <C-H> <C-W>h<C-W>_
    endif

    " Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk

    " The following two lines conflict with moving to top and
    " bottom of the screen
    " If you prefer that functionality, add the following to your
    " .vimrc.bundles.local file:
    "   let g:spf13_no_fastTabs = 1
    if !exists('g:spf13_no_fastTabs')
        map <S-H> gT
        map <S-L> gt
    endif

    " Stupid shift key fixes
    if !exists('g:spf13_no_keyfixes')
        if has("user_commands")
            command! -bang -nargs=* -complete=file E e<bang> <args>
            command! -bang -nargs=* -complete=file W w<bang> <args>
            command! -bang -nargs=* -complete=file Wq wq<bang> <args>
            command! -bang -nargs=* -complete=file WQ wq<bang> <args>
            command! -bang Wa wa<bang>
            command! -bang WA wa<bang>
            command! -bang Q q<bang>
            command! -bang QA qa<bang>
            command! -bang Qa qa<bang>
        endif

        cmap Tabe tabe
    endif

    " Livedown (Markdown Preview)
    nmap gm :LivedownToggle<CR>

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>

    " Toggle search highlighting
    nmap <silent> <leader>/ :set invhlsearch<CR>

    " Shortcuts
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Fix home and end keybindings for screen, particularly on mac
    " - for some reason this fixes the arrow keys too. huh.
    map [F $
    imap [F $
    map [H g0
    imap [H g0

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=expand('%:h').'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%

    " Adjust viewports to the same size
    map <Leader>= <C-w>=

    " Map <Leader>ff to display all lines with keyword under cursor
    " and ask which one to jump to
    nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

    " Easier horizontal scrolling
    map zl zL
    map zh zH

    " Mapping parenthesis
    inoremap {{ {<CR>}<Esc>O
    inoremap (( ()<Esc>i
    inoremap [[ []<Esc>i
    inoremap "" ""<Esc>i
" }
"
" Syntastic Settings {
    set statusline+=%f

    " Syntastic
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 0
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_python_flake8_args='--ignore=E402,E501,E711'
    let g:syntastic_python_pyflakes_args='--ignore=E402'
    let g:syntastic_sh_shellcheck_args='-x'
    let g:syntastic_c_compiler_options='--std=c11'
    " let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [],'passive_filetypes': ['html', 'ejs'] }
    let g:syntastic_javascript_eslint_exe = './node_modules/.bin/eslint'
    let g:syntastic_javascript_checkers=['eslint']
    let g:syntastic_go_checkers=['go']
    let g:syntastic_rust_checkers=['cargo']
    let g:rust_cargo_check_tests = 1
" }


" Plugins: {
    " Editor Stuff: {
        Plugin 'vim-scripts/PreserveNoEOL'
        Plugin 'editorconfig/editorconfig-vim'
        Plugin 'godlygeek/tabular'
        Plugin 'scrooloose/nerdtree'
        Plugin 'jistr/vim-nerdtree-tabs'
        Plugin 'ryanoasis/vim-devicons'
        Bundle 'scrooloose/syntastic'
        Plugin 'tommcdo/vim-exchange'
        Plugin 'ConradIrwin/vim-bracketed-paste'
        Plugin 'airblade/vim-gitgutter'
        Plugin 'tpope/vim-git'
        Plugin 'honza/vim-snippets'
        Plugin 'tpope/vim-abolish'
        Plugin 'tpope/vim-commentary'
        Plugin 'tpope/vim-endwise'
        Plugin 'tpope/vim-fugitive'
        Plugin 'tpope/vim-repeat'
        Plugin 'tpope/vim-sleuth'
        Plugin 'tpope/vim-surround'
        Plugin 'tpope/vim-unimpaired'
        Plugin 'majutsushi/tagbar'
        Bundle 'ctrlpvim/ctrlp.vim'
        Plugin 'Valloric/YouCompleteMe'
        Plugin 'ternjs/tern_for_vim'
        Plugin 'bitc/vim-bad-whitespace'
    "" }

    " colorschemes {
        Plugin 'altercation/vim-colors-solarized'
        Bundle 'chriskempson/base16-vim'
    " }

    " JavaScript {
        Plugin 'drslump/vim-syntax-js'
        Plugin 'elzr/vim-json'
        Plugin 'pangloss/vim-javascript'
    " }

    " NginX {
        Plugin 'nginx.vim'
    " }

    " Pandoc {
        Plugin 'vim-pandoc/vim-pandoc-syntax'
    " }

    " Markdown {
        Plugin 'plasticboy/vim-markdown'
        Plugin 'dhruvasagar/vim-table-mode'
        Plugin 'shime/vim-livedown'
    " }

    " Python {
        Plugin 'heavenshell/vim-pydocstring'
        Bundle 'nvie/vim-flake8'
    " }

    " Rust {
        Plugin 'rust-lang/rust.vim'
    " }

    " LateX {
        Plugin 'vim-latex/vim-latex'
    " }

    " Solidity {
        Plugin 'tomlion/vim-solidity'
    " }

    " HTML {
        Plugin 'othree/html5.vim'
            Plugin 'Valloric/MatchTagAlways'
            Plugin 'mattn/emmet-vim'
            Plugin 'xmledit'
    " }

" }
" GUI Settings {

    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        set guioptions-=T           " Remove the toolbar
        set lines=40                " 40 lines of text instead of 24
        if has("gui_gtk2")
            set guifont=Andale\ Mono\ Regular\ 16,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
        elseif has("gui_mac")
            set guifont=Andale\ Mono\ Regular:h16,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18
        elseif has("gui_win32")
            set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
        endif
        set transparency=5      " Make the window slightly transparent
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
        "set term=builtin_ansi       " Make arrow and other keys work
    endif

" }

" Functions {

    " UnBundle {
    function! UnBundle(arg, ...)
      let bundle = vundle#config#init_bundle(a:arg, a:000)
      call filter(g:bundles, 'v:val["name_spec"] != "' . a:arg . '"')
    endfunction

    com! -nargs=+         UnBundle
    \ call UnBundle(<args>)
    " }

    " Initialize directories {
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        " To specify a different directory in which to place the vimbackup,
        " vimviews, vimundo, and vimswap files/directories, add the following to
        " your .vimrc.local file:
        "   let g:spf13_consolidated_directory = <full path to desired directory>
        "   eg: let g:spf13_consolidated_directory = $HOME . '/.vim/'
        if exists('g:spf13_consolidated_directory')
            let common_dir = g:spf13_consolidated_directory . prefix
        else
            let common_dir = parent . '/.' . prefix
        endif

        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    " }

    " Initialize NERDTree as needed {
    "function! NERDTreeInitAsNeeded()
    "    redir => bufoutput
    "    buffers!
    "    redir END
    "    let idx = stridx(bufoutput, "NERD_tree")
    "    if idx > -1
    "        NERDTreeMirror
    "        NERDTreeFind
    "        wincmd l
    "    endif
    "endfunction
    " }

    " Strip whitespace {
    function! StripTrailingWhitespace()
        " To disable the stripping of whitespace, add the following to your
        " .vimrc.local file:
        "   let g:spf13_keep_trailing_whitespace = 1
        if !exists('g:spf13_keep_trailing_whitespace')
            " Preparation: save last search, and cursor position.
            let _s=@/
            let l = line(".")
            let c = col(".")
            " do the business:
            %s/\s\+$//e
            " clean up: restore previous search history, and cursor position
            let @/=_s
            call cursor(l, c)
        endif
    endfunction
    " }

" }

" Use fork vimrc if available {
" }

" Use local vimrc if available {
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }

" Use local gvimrc if available and gui is running {
    if has('gui_running')
        if filereadable(expand("~/.gvimrc.local"))
            source ~/.gvimrc.local
        endif
    endif
" }

" Finish local initializations {
    call InitializeDirectories()
" } 

" Colours {
    let base16colorspace=256
    set background=dark
    colorscheme base16-tomorrow
    hi Normal guibg=NONE ctermbg=NONE
"}

" Sass Compile {
    autocmd BufWritePost *.scss execute "!sassc -t compressed <afile> > <afile>.css"
" }



set guifont=FantasqueSansMono\ Nerd\ Font\ 11
