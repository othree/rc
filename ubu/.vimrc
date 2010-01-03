syntax on
filetype on
filetype plugin on
colors tir_black
language message zh_TW.UTF-8

set nocp
set showtabline=1
set ruler
set nu
set softtabstop=4
set shiftwidth=4
set expandtab
set ai
set si
set ci
set hlsearch
"set showmatch
set backspace=indent,eol,start whichwrap+=<,>,[,]

set enc=utf-8
set fencs=ucs-bom,utf-8,big5
set ambiwidth=double

set laststatus=2
set statusline=%f\ %y%r%1*%m%*%=%<\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ x%02B\ %4c\ %4l\ [%P]
if version >= 700
    au InsertEnter * hi StatusLine ctermfg=darkcyan ctermbg=white
    au InsertLeave * hi StatusLine ctermfg=darkgray ctermbg=white
endif

"nnoremap <leader>q :QFix<CR>

" function keys
"nnoremap <F12> :Matrix<CR>
nnoremap <F6>  :wrap!<CR>
nnoremap <F5>  :tab ball<CR>
"nnoremap <F7>  :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

map <F12> :JSLint<CR>
"map <F11> :JSLintLight<CR>

nmap <tab> V>
nmap <s-tab> V<
xmap <tab> >gv
xmap <s-tab> <gv

nnoremap <C-Home> gg
nnoremap <C-End> G<End>
inoremap <C-Home> <Esc>ggi
inoremap <C-End> <Esc>G<End>i

"noremap  <C-J>       gj
"noremap  <C-K>       gk
"noremap  <Down>      gj
"noremap  <Up>        gk
"inoremap <Down> <C-O>gj
"inoremap <Up>   <C-O>gk
inoremap <silent><expr><Up> pumvisible() ? "<Up>" : "<C-O>gk"
inoremap <silent><expr><Down> pumvisible() ? "<Down>" : "<C-O>gj"

augroup Tabs
    nmap    ,tn    :tabnew<cr>
    nmap    ,te    :tabedit
    nmap    ,tx    :tabedit .<cr>
    nmap    ,th    :tab help<cr>
    nmap    <a-left>  :tabp<cr>
    nmap    <a-right> :tabn<cr>
    nmap    <C-\>  :tabn<CR>
augroup END

"let g:sparkupExecuteMapping = "\<tab>"

"setlocal omnifunc=syntaxcomplete#Complete
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags noci
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS noci
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags noci
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType cpp set omnifunc=ccomplete#Complete

let g:acp_enableAtStartup = 1
"let g:acp_mappingDriven = 1
let g:acp_completeOption = '.,w,b,u,t,i,k'
let g:acp_behaviorSnipmateLength = 1
let g:acp_behaviorKeywordCommand = "\<C-n>"

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

"au FileType javascript so ~/.vim/indent/javascript.vim

inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:OmniCpp_NamespaceSearch = 2

highlight PMenu      cterm=bold ctermbg=Blue ctermfg=Gray
highlight PMenuSel   cterm=bold ctermbg=Red ctermfg=White
highlight PMenuSbar  cterm=bold ctermbg=darkgray
highlight PMenuThumb cterm=bold ctermbg=White

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

autocmd FileWritePost,BufWritePost *.js :JSLint

autocmd BufNewFile *.html 0r $HOME/.vim/templates/html.tpl


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

"inoremap ( ()<ESC>i
"inoremap ) <c-r>=ClosePair(')')<CR>
"inoremap { {}<ESC>i
"inoremap } <c-r>=ClosePair('}')<CR>
"inoremap [ []<ESC>i
"inoremap ] <c-r>=ClosePair(']')<CR>
"inoremap < <><ESC>i
"inoremap > <c-r>=ClosePair('>')<CR>

"function ClosePair(char)
    "if getline('.')[col('.') - 1] == a:char
        "return "\<Right>"
    "else
            "return a:char
    "endif
"endf

com! -bang W :w
com! -bang Wq :wq
com! -bang Wqa :wqa
com! -bang WQ :wq
com! -bang WQa :wqa
com! -bang WQA :wqa
com! -bang Q :q
com! -bang Qa :qa

com! -bang -range -nargs=* A <line1>,<line2>call Align#Align(<bang>0,<q-args>)
