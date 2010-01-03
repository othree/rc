syntax on
filetype on
filetype plugin on
colors tir_black
set t_Co=256

set enc=utf-8

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
set backspace=indent,eol,start whichwrap+=<,>,[,]

"source $VIMRUNTIME/autoload/syntaxcomplete.vim

set laststatus=2
set statusline=%f\ %y%r%1*%m%*%=%<x%02B\ %4c\ %4l\ [%P]


" function keys
"nnoremap <F12> :Matrix<CR>
nnoremap <F6>  :wrap!<CR>
nnoremap <F5>  <ESC>:tab ball<CR>
"nnoremap <F7>  :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

map <F12> <ESC>:JSLint<CR>
map <F11> <ESC>:JSLintLight<CR>

map <C-n> <ESC>:cnext<CR>
map <C-p> <ESC>:cprev<CR>

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
map <F5> <ESC>:QFix<CR>

autocmd FileWritePost,BufWritePost *.js :JSLint

nmap <tab> V>
nmap <s-tab> V<
xmap <tab> >gv
xmap <s-tab> <gv

nnoremap <C-Home> gg
nnoremap <C-End> G<End>
inoremap <C-Home> <Esc>ggi
inoremap <C-End> <Esc>G<End>i

augroup Tabs
    nmap    ,tn    :tabnew<cr>
    nmap    ,te    :tabedit
    nmap    ,tx    :tabedit .<cr>
    nmap    ,th    :tab help<cr>
    nmap    <a-left>  :tabp<cr>
    nmap    <a-right> :tabn<cr>
    nmap    <C-\>  :tabn<CR>
augroup END
 
setlocal omnifunc=syntaxcomplete#Complete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags noci
let g:acp_enableAtStartup = 1
let g:acp_completeOption = '.,w,b,u,t,i,k'
let g:acp_behaviorSnipmateLength = 1
let g:acp_behaviorKeywordCommand = "\<C-n>"

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
        \    'command'  : "\<C-x>\<C-o>",
        \    'meets'   : 'acp#meetsForKeyword',
        \    'repeat'   : 0,
    \})

let g:acp_behavior = {}
call extend(g:acp_behavior, jsbehavs, 'keep')

inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:OmniCpp_NamespaceSearch = 2

"highlight PMenu      cterm=bold ctermbg=Blue ctermfg=Gray
"highlight PMenuSel   cterm=bold ctermbg=Red ctermfg=White
"highlight PMenuSbar  cterm=bold ctermbg=darkgray
"highlight PMenuThumb cterm=bold ctermbg=White

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

com! -bang W :w
com! -bang Wq :wq
com! -bang Wqa :wq
com! -bang WQ :wq
com! -bang WQa :wqa
com! -bang WQA :wqa
com! -bang Q :q
com! -bang Qa :qa

com! -bang -range -nargs=* A <line1>,<line2>call Align#Align(<bang>0,<q-args>)

