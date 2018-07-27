" .vimrc by othree ( othree AT gmail DOT com )

set viminfo='100,n$HOME/.vim/files/info/viminfo

" Vundle
" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Colors
" Plugin 'tir_black'
Plugin 'jellybeans.vim'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'amdt/vim-niji'
Plugin 'othree/vim-osx-colorpicker'
Plugin 'peaksea'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'osyo-manga/shabadou.vim'

Plugin 'matrix.vim--Yang'

" Improve
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'VisIncr'
Plugin 'Align'
Plugin 'othree/eregex.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mbbill/undotree'
Plugin 'spiiph/vim-space'
Plugin 'SyntaxComplete'
Plugin 'AndrewRadev/switch.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'justinmk/vim-sneak'
Plugin 'terryma/vim-expand-region'

" Complete
" Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'othree/tern_for_vim_coffee'
Plugin 'L9'
Plugin 'othree/vim-autocomplpop'
" Plugin 'vim-scripts/matchit.zip'

Plugin 'kana/vim-operator-user'
Plugin 'kana/vim-operator-replace'

Plugin 'MarcWeber/vim-addon-mw-utils.git'
Plugin 'MarcWeber/vim-addon-local-vimrc'
Plugin 'tomtom/tlib_vim.git'
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'
Plugin 'airblade/vim-gitgutter'

Plugin 'Lokaltog/vim-easymotion'

" 
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/syntastic'
" Plugin 'othree/syntastic'
Plugin 'w0rp/ale'

Plugin 'sbdchd/neoformat'

" Tim Pope
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-characterize'
" Plugin 'tpope/vim-sleuth'

" Filetype
Plugin 'SyntaxRange'
Plugin 'tpope/vim-haml'
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'
Plugin 'othree/xml.vim'
Plugin 'Glench/Vim-Jinja2-Syntax'

" JavaScript
" Plugin 'othree/javascript-syntax.vim'
" Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/yajs.vim'
Plugin 'othree/es.next.syntax.vim'
Plugin 'JSON.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'jiangmiao/simple-javascript-indenter'
" Plugin 'teramako/jscomplete-vim'
" Plugin 'othree/jslint.vim'
Plugin 'othree/jspc.vim'
" Plugin 'bigfish/vim-js-context-coloring'
Plugin 'mxw/vim-jsx'

Plugin 'othree/jsdoc-syntax.vim'

" CoffeeScript
Plugin 'kchmck/vim-coffee-script'
" Plugin 'othree/coffee-check.vim'
Plugin 'othree/fecompressor.vim'

" LiveScript
Plugin 'gkz/vim-ls'

" TypeScript
" Plugin 'leafgarland/typescript-vim'

Plugin 'alunny/pegjs-vim'

Plugin 'othree/nginx-contrib-vim'
" Plugin 'othree/nginx-contrib-vim-patch'

" Plugin 'othree/semantic-highlight.vim'

" CSS, SCSS
Plugin 'hail2u/vim-css3-syntax'
" Plugin 'othree/svg-properties-syntax.vim'
" Plugin 'ap/vim-css-color'
" Plugin 'gko/vim-coloresque'
" Plugin 'cakebaker/scss-syntax.vim'
Plugin 'csscomb/vim-csscomb'
Plugin 'othree/csscomplete.vim'

Plugin 'juvenn/mustache.vim'
Plugin 'mustache/vim-mustache-handlebars'

Plugin 'plasticboy/vim-markdown'

Plugin 'vim-perl/vim-perl'

" ctags
" Plugin 'majutsushi/tagbar'

" python
Plugin 'tell-k/vim-autopep8'

" supertab
Plugin 'ervandew/supertab'

" multiple cursor
Plugin 'terryma/vim-multiple-cursors'

Plugin 'othree/vroom-syntax.vim'

" WebIDL
Plugin 'othree/vim-widl'

" Vim
Plugin 'othree/vim-syntax-enhanced'
Plugin 'vim-scripts/SyntaxAttr.vim'

Plugin 'slim-template/vim-slim'

Plugin 'gerw/vim-HiLinkTrace'

Plugin 'mhinz/vim-startify'

Plugin 'vim-scripts/XML-Folding'

Plugin 'posva/vim-vue'

" For Fun
" Bundle 'mattn/hahhah-vim'
" Bundle 'tyru/banban.vim'

call vundle#end() 
filetype plugin indent on 

" Basic Settings: {{{
syntax on
filetype on
filetype plugin on
filetype indent on
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
" colorscheme solarized
" colors tir_black
colors jellybeans
" colors peaksea
" colors Tomorrow-Night-Bright
language message zh_TW.UTF-8

set nocompatible
set display+=lastline
set wrap
set showtabline=2 " always show tab line
set ruler
set nu
set nuw=5
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set cindent
set hlsearch
set foldmethod=marker
set backspace=indent,eol,start whichwrap+=<,>,[,]
set hidden
set nobomb
set hlsearch

let mapleader = ","

" Status Line
set laststatus=2

" Encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,big5
set ambiwidth=double
set termguicolors
set t_Co=256
let &t_8f="[38;2;%lu;%lu;%lum"
let &t_8b="[48;2;%lu;%lu;%lum"

" Status Line
" set laststatus=2
" set statusline=%f\ %y%r%1*%m%*\ %{g:HahHah()}%=%<\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ x%02B\ %4c\ %4l\ [%P]
" " set statusline=%=%{g:HahHah()}

" Special File Types
au BufRead,BufNewFile *.webidl set ft=widl
" au BufRead,BufNewFile *nginx* set ft=nginx
au BufRead,BufNewFile *.vroom set ft=vroom
au BufRead,BufNewFile *.less set ft=less
au BufRead,BufNewFile *.tpl set ft=html
au BufRead,BufNewFile *.xsl set ft=html
au BufRead,BufNewFile *.json set syntax=json 
au BufRead,BufNewFile *.n3  set ft=n3
" au BufRead,BufNewFile /usr/local/etc/nginx/* set ft=nginx 
" au BufRead,BufNewFile /etc/nginx/* set ft=nginx 
" au BufRead,BufNewFile *.rb set sw=2 sts=2 st=2
" au BufRead,BufNewFile *.rake set sw=2 sts=2 st=2
" au BufRead,BufNewFile *.ls set sw=2 sts=2 st=2
au BufNewFile,BufReadPost *.ls setl foldmethod=indent nofoldenable
au BufRead,BufNewFile *.mjs set ft=javascript
au BufRead,BufNewFile *.ts set ft=javascript
au BufRead,BufNewFile *.tsx set ft=javascript.jsx
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

" highlight line & column
au WinLeave * set nocursorline
au WinEnter * set cursorline
set cursorline

" Color Tweak for highlight
" highlight CursorLine    ctermbg=89
" highlight Comment       ctermfg=246

" }}}

" FileType: {{{
"" omnifunc setting
setlocal omnifunc=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType javascript set omnifunc=jscomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags noci
autocmd FileType css set omnifunc=csscomplete#CompleteCSS noci
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags noci
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType cpp set omnifunc=ccomplete#Complete
autocmd FileType python set complete+=k~/.vim/syntax/python.vim
autocmd FileType scss set sw=2

autocmd FileType coffee set ts=2 sw=2 sts=2
autocmd FileType vim set ts=2 sw=2 sts=2

autocmd FileType go set noet

autocmd FileType *
    \ if &omnifunc != '' |
    \   call SuperTabChain(&omnifunc, "<c-p>") |
    \   call SuperTabSetDefaultCompletionType("<c-x><c-]>") |
    \ endif

let g:omni_syntax_group_include_javascript = 'javascript\w\+,jquery\w\+,underscore\w\+,prelude\w\+,requirejs\w\+'

" }}}

" YCM: {{{
let g:ycm_semantic_triggers =  {
  \   'coffee' : ['.', '["', "['"]
  \ }
" }}}
" JS Libs: {{{
let g:used_javascript_libs = 'react'
" }}}

" Screen Fix: {{{
if &term =~ '^screen' 
    set t_k1=[11~
    set t_k2=[12~
    set t_k3=[13~
    set t_k4=[14~
endif
" }}}

" QuickFix: {{{
" http://vim.wikia.com/wiki/Toggle_to_open_or_close_the_quickfix_window
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction
nnoremap <leader>q :QFix<CR>

" http://vim.wikia.com/wiki/Automatically_open_the_quickfix_window_on_:make
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" http://vim.wikia.com/wiki/Automatically_quit_Vim_if_quickfix_window_is_the_last
au BufEnter * call MyLastWindow()
function! MyLastWindow()
  " if the window is quickfix go on
  if &buftype=="quickfix"
    " if this window is last on screen quit without warning
    if winbufnr(2) == -1
      quit!
    endif
  endif
endfunction
" }}}

" Key Mapping: {{{

" http://vim.wikia.com/wiki/Map_semicolon_to_colon
" map ; :

map Q <Nop>

"" function keys
nmap <F2>  :set nonumber!<CR>
nmap <F3>  :set nopaste!<CR>
nmap <F4>  :set spell!<CR>
" Leave F5 for ctrlp
nmap <F6>  :set wrap!<CR>
nmap <F7>  :QFix<CR>
nmap <F8>  :UndotreeToggle<CR>
nmap <F12> :tab ball<CR>
" F12 > JSLint

"" tab to indent
nmap <tab> V>
vmap <tab> >gv
nmap <s-tab> V<
vmap <s-tab> <gv

"" HOME END
nmap <C-Home> gg
nmap <C-End> G<End>
imap <C-Home> <Esc>ggi
imap <C-End> <Esc>G<End>i

"" up/down base on screen
"noremap  <C-J>       gj
"noremap  <C-K>       gk
"noremap  <Down>      gj
"noremap  <Up>        gk
"inoremap <Down> <C-O>gj
"inoremap <Up>   <C-O>gk

"" Fix up/down in popup
" inoremap <silent><expr><Up> pumvisible() ? "<Up>" : "<C-O>gk"
" inoremap <silent><expr><Down> pumvisible() ? "<Down>" : "<C-O>gj"
" inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"" tab control
"" http://c9s.blogspot.com/2007/08/vim-my-key-mapping-for-tabs.html
nmap    <leader>tn    :tabnew<cr>
nmap    <leader>te    :tabedit
nmap    <leader>tx    :tabedit .<cr>
nmap    <leader>th    :tab help<cr>

" nmap    <C-t>     :tabnew<cr>
" nmap    <C-w>     :tabc<cr>

nmap    <C-left>  :tabp<cr>
nmap    <C-right> :tabn<cr>

imap    <C-j>  <ESC>:tabn<CR>
nmap    <C-j>  :tabn<CR>
imap    <C-k>  <ESC>:tabp<CR>
nmap    <C-k>  :tabp<CR>

cmap w!! %!sudo tee > /dev/null %

"" keypad
"" http://vim.wikia.com/wiki/PuTTY_numeric_keypad_mappings
imap <Esc>Oq 1
imap <Esc>Or 2
imap <Esc>Os 3
imap <Esc>Ot 4
imap <Esc>Ou 5
imap <Esc>Ov 6
imap <Esc>Ow 7
imap <Esc>Ox 8
imap <Esc>Oy 9
imap <Esc>Op 0
imap <Esc>On .
imap <Esc>OQ /
imap <Esc>OR *
imap <Esc>Ol +
imap <Esc>OS -

" Replace Operator
nmap <Leader>r <Plug>(operator-replace)
xmap <Leader>r <Plug>(operator-replace)

" ctags
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <silent> <Leader>b :TagbarToggle<CR>

let NERDMapleader='<Leader>c'

" switch
nnoremap - :Switch<cr>

" Expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"}}}

" Indent: {{{
let g:html_indent_inctags = "html,body,head,tbody,a"
let g:event_handler_attributes_complete = 0
let g:microdata_attributes_complete = 0
let g:SimpleJsIndenter_BriefMode = 1
" }}}

" Airline: {{{

let g:airline_left_sep = ''
let g:airline_right_sep = ''
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
" let g:airline_fugitive_prefix = '  '
" let g:airline_readonly_symbol = ''
" let g:airline_linecolumn_prefix = ' '

" let g:airline_enable_syntastic = 1

let g:airline_theme='solarized'

" }}}

" SyntaxRange {{{

" autocmd FileType html call SyntaxRange#Include('/<script[^>]*>/', '</script>', 'javascript', 'htmlTagName')
" autocmd FileType html call SyntaxRange#Include('/<style[^>]*>/', '</style>', 'css', 'htmlTagName')

" }}}

" Filename Complete {{{

autocmd InsertEnter * let save_cwd = getcwd() | execute 'lcd %:p:h'
autocmd InsertLeave * execute 'lcd' fnameescape(save_cwd)

" }}}

" Zencoding: {{{
let g:user_zen_settings = {
    \  'php' : {
    \    'extends' : 'html',
    \    'filters' : 'c',
    \  },
    \  'xml' : {
    \    'extends' : 'html',
    \  },
    \  'html' : {
    \    'extends' : 'html',
    \  },
    \}
" }}}

" YankStack: {{{
let g:yankstack_map_keys = 0
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
" }}}

" Syntastic: {{{
let g:syntastic_auto_loc_list = 1
let g:syntastic_html_checkers = []
let g:syntastic_javascript_checkers=['standard']
let g:syntastic_javascript_standard_generic = 1
let g:syntastic_javascript_standard_exec = 'semistandard'
let g:syntastic_typescript_checkers=['javascript/standard']
" let g:syntastic_typescript_standard_generic = 1
" let g:syntastic_typescript_standard_exec = 'oairbnb-standard'
" let g:syntastic_javascript_standard_exec = 'semistandard'
" let g:syntastic_javascript_jslint_conf = "--nomen --plusplus --forin --regexp"
" let g:syntastic_coffee_coffeelint_args = "--csv -f ~/coffeelint-config.json"
let g:syntastic_html_checkers = []

" let g:syntastic_debug = 32
" let g:syntastic_debug_file = "~/syntastic.log"

" }}}

" ALE: {{{
let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'typescript': ['eslint'],
  \}
" }}}

" YouCompleteMe: {{{
let g:ycm_semantic_triggers =  {
  \   'coffee' : ['.', '["', "['", 'new '],
  \   'javascript' : ['.', '["', "['", 'new '],
  \ }
" }}}

" Autocomplpop: {{{
"" acp options
let g:acp_enableAtStartup = 1
" let g:acp_mappingDriven = 1
let g:acp_completeOption = '.,w,b,u,t,i,k'
let g:acp_behaviorSnipmateLength = 1

let g:acp_behaviorUserDefinedMeets = 'acp#meetsForKeyword'
let g:acp_behaviorUserDefinedFunction = 'syntaxcomplete#Complete'

let g:omni_syntax_use_iskeyword = 0

" }}}

" NERDCommenter: {{{
let NERDSpaceDelims = 1
" }}}

" Popup Highlight: {{{
" highlight PMenu      cterm=bold ctermbg=Blue ctermfg=Gray
" highlight PMenuSel   cterm=bold ctermbg=Red ctermfg=White
" highlight PMenuSbar  cterm=bold ctermbg=darkgray
" highlight PMenuThumb cterm=bold ctermbg=White
" }}}

" SpeelBad Highlight: {{{
highlight SpellBad   ctermbg=124
" }}}

" HTML: {{{
"" HTML Tag Escape:
""  http://vim.wikia.com/wiki/Escape_and_unescape_HTML_entities
function HtmlEscape()
    silent s/&/\&amp;/eg
    silent s/</\&lt;/eg
    silent s/>/\&gt;/eg
    silent s/"/\&quot;/eg
endfunction

function HtmlUnEscape()
    silent s/&lt;/</eg
    silent s/&gt;/>/eg
    silent s/&amp;/\&/eg
    silent s/&quot;/"/eg
endfunction

function HtmlReIndent()
    silent %s/\(<\/\w\+\)>\s\?</\1>
</eg
    normal gg=G
endfunction
"map <silent> <c-h> :call HtmlEscape()<CR>
"map <silent> <c-u> :call HtmlUnEscape()<CR>

"" HTML omni
let b:html_omni_flavor = 'html5'
" }}}

" NERDTree: {{{
let NERDTreeShowHidden = 1
" }}}

" CoffeeTags: {{{
if executable('coffeetags')
    let g:tagbar_type_coffee = {
            \ 'ctagsbin' : 'coffeetags',
            \ 'ctagsargs' : '',
            \ 'kinds' : [
            \ 'f:functions',
            \ 'o:object',
            \ ],
            \ 'sro' : ".",
            \ 'kind2scope' : {
            \ 'f' : 'object',
            \ 'o' : 'object',
            \ }
            \ }
endif
" }}}

" ctrlp: {{{

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_show_hidden = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 0

set wildignore+=*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip,

let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules$\|\.git$\|\.meteor$\|\.svn$\|dist$\|\.hg$',
  \ 'file': '\.DS_Store$\|\.jpg$\|\.png$\|\.jpeg$\|\.gif$\|\.svg$'
  \ }
" let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }

let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" }}}

" jscontext-coloring: {{{
let g:js_context_colors_enabled = 0
let g:js_context_colors = [ "#EEEEEE", "#99FF99", "#ded35d", 172, "#ff9999", 161, 63 ]
" }}}

" Command Mapping: {{{
com! -bang W :w
com! -bang Wq :wq
com! -bang Wqa :wqa
com! -bang WQ :wq
com! -bang WQa :wqa
com! -bang WQA :wqa
com! -bang Q :q
com! -bang Qa :qa
" }}}

" Macros: {{{
runtime macros/matchit.vim
" }}}

" Switch: {{{
let g:switch_custom_definitions =
    \ [
    \   ['and', 'or'],
    \   ['is', 'isnt'],
    \   ['w', 'h'],
    \   ['width', 'height'],
    \   ['on', 'off'],
    \   ['attr', 'removeAttr'],
    \   ['addClass', 'removeClass'],
    \   {
    \     '\<\(\l\)\(\l\+\(\u\l\+\)\+\)\>': '\=toupper(submatch(1)) . submatch(2)',
    \     '\<\(\u\l\+\)\(\u\l\+\)\+\>': "\\=tolower(substitute(submatch(0), '\\(\\l\\)\\(\\u\\)', '\\1_\\2', 'g'))",
    \     '\<\(\l\+\)\(_\l\+\)\+\>': '\U\0',
    \     '\<\(\u\+\)\(_\u\+\)\+\>': "\\=tolower(substitute(submatch(0), '_', '-', 'g'))",
    \     '\<\(\l\+\)\(-\l\+\)\+\>': "\\=substitute(submatch(0), '-\\(\\l\\)', '\\u\\1', 'g')",
    \   }
    \ ]
" }}}

" OSX Colorpicker: {{{
let g:colorpicker_app = 'iTerm.app'
" }}}

" TypeScript: {{{
let g:typeScript_ignore_typeScriptdoc = 1
" }}}

" Startify: {{{
let g:startify_custom_header =
  \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']
" }}}

" Semantic Highlight: {{{
let g:semanticEnableFileTypes = ['javascript', 'typescript', 'vim']
" }}}

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" auto paste mode

if &term =~ "xterm.*"
  let &t_ti = &t_ti . "\e[?2004h"
  let &t_te = "\e[?2004l" . &t_te
  function XTermPasteBegin(ret)
    set pastetoggle=<Esc>[201~
    set paste
    return a:ret
  endfunction
  map <expr> <Esc>[200~ XTermPasteBegin("i")
  imap <expr> <Esc>[200~ XTermPasteBegin("")
  cmap <Esc>[200~ <nop>
  cmap <Esc>[201~ <nop>
endif

let g:tern_show_argument_hints = 'on_move'

" After Loading All Plugin: {{{
function AfterStart ()

" plugin commands
"" Align
if exists(":Align")
    com! -bang -range -nargs=* A <line1>,<line2>call Align#Align(<bang>0,<q-args>)
endif

"" eregex
if exists(":M")
    nnoremap <leader>/ :call eregex#toggle()<CR>
endif

if exists(":NERDTreeToggle")
    map <F12> :NERDTreeToggle<CR>
endif

"" Speeddating.vim
if exists(":SpeedDatingFormat")
    SpeedDatingFormat %H:%M
    SpeedDatingFormat %m/%d
    SpeedDatingFormat %Y/%m/%d%[ T_-]%H:%M:%S%?[Z]
endif

" Fix for vim-snipmate
nmap <tab> V>
vmap <tab> >gv

" yankstack
nmap Y y$

endfunction
autocmd VimEnter * :call AfterStart()
if has('nvim')
endif
" }}}

map <C-h> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

let g:tern_show_signature_in_pum=1

" echo the supplied arg and return it unchanged
function! Echo(arg)
    echomsg 'arg: ' . a:arg
    return a:arg
  endfunction
