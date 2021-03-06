" .vimrc by othree ( othree AT gmail DOT com )
"
" Used Plugins: {{{
" JavaScript syntax
" http://www.vim.org/scripts/script.php?script_id=1491
" Javascript Indentation
" http://www.vim.org/scripts/script.php?script_id=1840
" Vimball
" http://www.vim.org/scripts/script.php?script_id=1502
" VisIncr
" http://www.vim.org/scripts/script.php?script_id=670
" autocomplpop
" http://www.vim.org/scripts/script.php?script_id=1879
" snipMate
" http://www.vim.org/scripts/script.php?script_id=2540
" NERD_commenter
" http://www.vim.org/scripts/script.php?script_id=1218
" align
" http://www.vim.org/scripts/script.php?script_id=294
" xml/html
" http://www.vim.org/scripts/script.php?script_id=1397
" sparkup.vim
" http://github.com/rstacruz/sparkup
" jslint.vim
" http://github.com/hallettj/jslint.vim
" eregex.vim
" http://www.vector.co.jp/soft/unix/writing/se265654.html
" tir_black
" http://www.vim.org/scripts/script.php?script_id=2777
" }}}

" Basic Settings: {{{
syntax on
filetype on
filetype plugin on
set t_Co=256
colors tir_black
language message zh_TW.UTF-8

set display+=lastline
set nocp
set wrap
set showtabline=2 " always show tab line
set ruler
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set cindent
set hlsearch
set foldmethod=marker
set backspace=indent,eol,start 
set whichwrap+=<,>,[,]

" Encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,big5
set ambiwidth=double


" Status Line
set laststatus=2
set statusline=%f\ %y%r%1*%m%*%=%<\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ x%02B\ %4c\ %4l\ [%P]
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
"" function keys
nnoremap <F2>  :set nonumber!<CR>
nnoremap <F3>  :set nopaste!<CR>
nnoremap <F5>  :tab ball<CR>
nnoremap <F6>  :set wrap!<CR>
nnoremap <F11> :QFix<CR>
" F12 > JSLint

"" tab to indent
nmap <tab> V>
nmap <s-tab> V<
xmap <tab> >gv
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
nmap    ,tn    :tabnew<cr>
nmap    ,te    :tabedit
nmap    ,tx    :tabedit .<cr>
nmap    ,th    :tab help<cr>
nmap    <a-left>  :tabp<cr>
nmap    <a-right> :tabn<cr>
nmap    <C-\>  :tabn<CR>
"}}}

" Autocomplpop: {{{
"" omnifunc setting
"setlocal omnifunc=syntaxcomplete#Complete
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags noci
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS noci
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags noci
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType cpp set omnifunc=ccomplete#Complete

"" acp options
let g:acp_enableAtStartup = 1
"let g:acp_mappingDriven = 1
let g:acp_completeOption = '.,w,b,u,t,i,k'
let g:acp_behaviorSnipmateLength = 1
let g:acp_behaviorKeywordCommand = "\<C-n>"

"" javascript behavior for acp
function AcpMeetsForJavaScript(context)
    let matches = matchlist(a:context, '\(\k\{1}\)$')
    if empty(matches)
        return 0
    endif
    return 1
endfunction

let jsbehavs = { 'javascript': [] }
    call add(jsbehavs.javascript, {
        \   'command'      : "\<C-x>\<C-u>",
        \   'completefunc' : 'acp#completeSnipmate',
        \   'meets'        : 'acp#meetsForSnipmate',
        \   'onPopupClose' : 'acp#onPopupCloseSnipmate',
        \   'repeat'       : 0,
    \})
    call add(jsbehavs.javascript, {
        \   'command' : g:acp_behaviorKeywordCommand,
        \   'meets'   : 'acp#meetsForKeyword',
        \   'repeat'  : 0,
        \ })
    call add(jsbehavs.javascript, {
        \   'command' : "\<C-x>\<C-o>",
        \   'meets'   : 'AcpMeetsForJavaScript',
        \   'repeat'  : 0,
    \})

let g:acp_behavior = {}
call extend(g:acp_behavior, jsbehavs, 'keep')
" }}}

" Popup Highlight: {{{
highlight PMenu      cterm=bold ctermbg=Blue ctermfg=Gray
highlight PMenuSel   cterm=bold ctermbg=Red ctermfg=White
highlight PMenuSbar  cterm=bold ctermbg=darkgray
highlight PMenuThumb cterm=bold ctermbg=White
" }}}

"HTML Tag Escape: {{{
" http://vim.wikia.com/wiki/Escape_and_unescape_HTML_entities
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

map <silent> <c-h> :call HtmlEscape()<CR>
map <silent> <c-u> :call HtmlUnEscape()<CR>
" }}}

" Yuicompressor And ClosureCompiler: {{{
" http://blog.othree.net/log/2009/12/26/javascript-on-vim/
function Yuic ()
    let cwd = expand('<afile>:p:h')
    let nam = expand('<afile>:t:r')
    let ext = expand('<afile>:e')
    if -1 == match(nam, "[\._]src$")
        let minfname = nam.".min.".ext
    else
        let minfname = substitute(nam, "[\._]src$", "", "g").".".ext
    endif
    if filewritable(cwd.'/'.minfname)
        if ext == 'js' && executable('closure-compiler')
            cal system( 'closure-compiler --js '.cwd.'/'.nam.'.'.ext.' > '.cwd.'/'.minfname.' &')
        elseif executable('yuicompressor')
            cal system( 'yuicompressor '.cwd.'/'.nam.'.'.ext.' > '.cwd.'/'.minfname.' &')
        endif
    endif
endfunction
autocmd FileWritePost,BufWritePost *.js :call Yuic()
autocmd FileWritePost,BufWritePost *.css :call Yuic()
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

" After Loading All Plugin: {{{
function AfterStart ()

" plugin commands
if exists(":Align")
    com! -bang -range -nargs=* A <line1>,<line2>call Align#Align(<bang>0,<q-args>)
endif

if exists(":M")
    nnoremap / :M/
    nnoremap ,/ /
endif

if exists(":JSLint")
    autocmd FileWritePost,BufWritePost *.js :JSLint
    map <F12> :JSLint<CR>
endif

endfunction
autocmd VimEnter * :call AfterStart()
" }}}

