" .vimrc by othree ( othree AT gmail DOT com )

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'tir_black'

Bundle 'mattn/zencoding-vim'

Bundle 'YankRing.vim'
Bundle 'VisIncr'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'Align'
Bundle 'othree/eregex.vim'
Bundle 'mru.vim'
Bundle 'sjl/gundo.vim'

Bundle 'AutoComplPop'
Bundle 'othree/snipmate.vim'
Bundle 'othree/snipmate-snippets'

Bundle 'othree/html5.vim'
Bundle 'othree/xml.vim'

Bundle 'JavaScript-syntax'
Bundle 'JiangMiao/simple-javascript-indenter'
Bundle 'JSON.vim'
Bundle 'othree/jslint.vim'
Bundle 'jQuery'

Bundle 'hail2u/vim-css3-syntax'

Bundle 'plasticboy/vim-markdown'

filetype plugin indent on 

" Basic Settings: {{{
syntax on
filetype on
filetype plugin on
filetype indent on
colors tir_black
language message zh_TW.UTF-8

set nocompatible
set display+=lastline
set nocp
set wrap
set showtabline=2 " always show tab line
set ruler
set nu
set nuw=5
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set cindent
set hlsearch
set foldmethod=marker
set backspace=indent,eol,start whichwrap+=<,>,[,]
set hidden
set nobomb

" Encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,big5
set ambiwidth=double
set t_Co=256

" Status Line
set laststatus=2
set statusline=%f\ %y%r%1*%m%*%=%<\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ x%02B\ %4c\ %4l\ [%P]

" Special File Types
au BufRead,BufNewFile *.less set ft=less
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufRead,BufNewFile *.tpl set ft=html
au BufRead,BufNewFile *.xsl set ft=html
au BufRead,BufNewFile *.json set syntax=json 
au BufRead,BufNewFile *.n3  set ft=n3

" highlight line & column
au WinLeave * set nocursorline
au WinEnter * set cursorline
set cursorline

" Color Tweak for highlight
highlight CursorLine    ctermbg=89
highlight Comment       ctermfg=246

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
" }}}

" Key Mapping: {{{

let mapleader = ","
" http://vim.wikia.com/wiki/Map_semicolon_to_colon
map ; :

"" function keys
nnoremap <F2>  :set nonumber!<CR>
nnoremap <F3>  :set nopaste!<CR>
nnoremap <F4>  :set spell!<CR>
nnoremap <F5>  :tab ball<CR>
nnoremap <F6>  :set wrap!<CR>
nnoremap <F7>  :QFix<CR>
nnoremap <F8>  :GundoToggle<CR>
" F12 > JSLint

"" tab to indent
nmap <tab> V>
xmap <tab> >gv
nmap <s-tab> V<
xmap <s-tab> <gv

"" HOME END
nnoremap <C-Home> gg
nnoremap <C-End> G<End>
inoremap <C-Home> <Esc>ggi
inoremap <C-End> <Esc>G<End>i

"" up/down base on screen
"noremap  <C-J>       gj
"noremap  <C-K>       gk
"noremap  <Down>      gj
"noremap  <Up>        gk
"inoremap <Down> <C-O>gj
"inoremap <Up>   <C-O>gk

"" Fix up/down in popup
inoremap <silent><expr><Up> pumvisible() ? "<Up>" : "<C-O>gk"
inoremap <silent><expr><Down> pumvisible() ? "<Down>" : "<C-O>gj"
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

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
inoremap <Esc>Oq 1
inoremap <Esc>Or 2
inoremap <Esc>Os 3
inoremap <Esc>Ot 4
inoremap <Esc>Ou 5
inoremap <Esc>Ov 6
inoremap <Esc>Ow 7
inoremap <Esc>Ox 8
inoremap <Esc>Oy 9
inoremap <Esc>Op 0
inoremap <Esc>On .
inoremap <Esc>OQ /
inoremap <Esc>OR *
inoremap <Esc>Ol +
inoremap <Esc>OS -

let NERDMapleader='<Leader>c'
"}}}

" Indent: {{{
let g:html_indent_inctags = "html,body,head,tbody,a"
let g:event_handler_attributes_complete = 0
let g:microdata_attributes_complete = 0
let g:SimpleJsIndenter_BriefMode = 1
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

" Autocomplpop: {{{
"" omnifunc setting
"setlocal omnifunc=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags noci
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS noci
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags noci
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType cpp set omnifunc=ccomplete#Complete
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

"" acp options
let g:acp_enableAtStartup = 1
"let g:acp_mappingDriven = 1
let g:acp_completeOption = '.,w,b,u,t,i,k'
let g:acp_behaviorSnipmateLength = 1
let g:acp_behaviorKeywordCommand = "\<C-n>"

""" javascript behavior for acp
function AcpMeetsForJavaScript(context)
    let matches = matchlist(a:context, '\(\k\{1}\)$')
    if empty(matches)
        return 0
    endif
    return 1
endfunction

"" html behavior for html
function AcpMeetsForHtmlOmni(context)
    if g:acp_behaviorHtmlOmniLength >= 0
        if a:context =~ '\(<\|<\/\|<[^>]\+ \|<[^>]\+=\"\)\k\{' .g:acp_behaviorHtmlOmniLength . ',}$'
            return 1
        elseif a:context =~ '\(\<\k\{1,}\(=\"\)\{0,1}\|\" \)$'
            let cur = line('.')-1
            while cur > 0
                let lstr = getline(cur)
                if lstr =~ '>[^>]*$'
                    return 0
                elseif lstr =~ '<[^<]*$'
                    return 1
                endif
                let cur = cur-1
            endwhile
            return 0
        endif
    else
        return 0
    endif
endfunction

let behavs = { 'javascript': [], 'html': [] }
    call add(behavs.javascript, {
        \   'command'      : "\<C-x>\<C-u>",
        \   'completefunc' : 'acp#completeSnipmate',
        \   'meets'        : 'acp#meetsForSnipmate',
        \   'onPopupClose' : 'acp#onPopupCloseSnipmate',
        \   'repeat'       : 0,
    \})
    call add(behavs.javascript, {
        \   'command' : g:acp_behaviorKeywordCommand,
        \   'meets'   : 'acp#meetsForKeyword',
        \   'repeat'  : 0,
        \ })
    call add(behavs.javascript, {
        \   'command' : "\<C-x>\<C-o>",
        \   'meets'   : 'AcpMeetsForJavaScript',
        \   'repeat'  : 0,
    \})
    call add(behavs.html, {
        \   'command' : "\<C-x>\<C-o>",
        \   'meets'   : 'AcpMeetsForHtmlOmni',
        \   'repeat'  : 1,
    \})

let g:acp_behavior = {}
call extend(g:acp_behavior, behavs, 'keep')
" }}}

" NERDCommenter: {{{
let NERDSpaceDelims = 1
" }}}

" Popup Highlight: {{{
highlight PMenu      cterm=bold ctermbg=Blue ctermfg=Gray
highlight PMenuSel   cterm=bold ctermbg=Red ctermfg=White
highlight PMenuSbar  cterm=bold ctermbg=darkgray
highlight PMenuThumb cterm=bold ctermbg=White
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
    silent %s/\(<\/\w\+\)>\s\?</\1></eg
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

" FuzzyFinder: {{{
let g:fuf_modesDisable = []
" }}}

" Auto Unittest: {{{
" javascripthttp://blog.othree.net/log/2009/12/26/javascript-on-vim/
function Jsunit ()
    let ut = 'unit.test.js'
    let fn = expand('<afile>:t') 
    if fn != ut
        let cwd = expand('<afile>:p:h')
        if filereadable(cwd.'/unit.test.js')
            let has_error = 0
            let cmd = 'js '. ut
            let output = system(cmd)
            for error in split(output, "\n")
                let has_error = 1
                caddexpr expand("%") . fn . ":0:0:" . error
            endfor
            if has_error == 1
                copen
            else
                echo 'Unit  : All OK.'
            endif
        endif
    endif
endfunction
autocmd FileWritePost,BufWritePost *.js :call Jsunit()
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

" After Loading All Plugin: {{{
function AfterStart ()

" plugin commands
"" Align
if exists(":Align")
    com! -bang -range -nargs=* A <line1>,<line2>call Align#Align(<bang>0,<q-args>)
endif

"" eregex
if exists(":M")
    nnoremap / :M/
    nnoremap ? :M?
    nnoremap ,/ /
endif

if exists(":NERDTreeToggle")
    map <F12> :NERDTreeToggle<CR>
endif

"" FuzzyFinder
if exists(":FufFile")
    nnoremap <leader>ff  :FufFile<CR>
    nnoremap <leader>fb  :FufBuffer<CR>
    nnoremap <leader>fr  :FufMruFile<CR>
endif

"" speeddating.vim
if exists(":SpeedDatingFormat")
    SpeedDatingFormat %H:%M
    SpeedDatingFormat %m/%d
    SpeedDatingFormat %Y/%m/%d%[ T_-]%H:%M:%S%?[Z]
endif

endfunction
autocmd VimEnter * :call AfterStart()
" }}}

