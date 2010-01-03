syntax on
filetype on
filetype plugin on
set t_Co=256
colors tir_black

set nocp
set number
set ai
set si
set ci
set incsearch
set hlsearch
set	showcmd 
set	shiftwidth=4
set	tabstop=4
set expandtab
set	noeb novb ruler
set	ignorecase
set	backspace=indent,eol,start
set	history=60
set wildmenu

" encoding
set		fileencodings=utf-8,big5,euc-jp,utf-bom,iso8859-1
set		encoding=utf-8
set		termencoding=utf-8
"set		fileencoding=utf-8

filetype on
filetype plugin on

set laststatus=2
set statusline=%f\ %y%r%1*%m%*%=%<x%02B\ %4c\ %4l\ [%P]

imap	<F2>	<C-R>=strftime("%c")<CR>

" ctags
"let Tlist_Ctags_Cmd = $VIM . '/ctags/ctags.exe'
"nmap	<leader>t	:TlistToggle<CR>
" vcscommand
"set runtimepath+=$VIM\vcscommand
" nerd tree
nmap	<leader>e	:NERDTreeToggle<CR>

" function keys
"nnoremap <F12> :Matrix<CR>
"nnoremap <F7>  :!ctags -R --tag-relative --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nnoremap <F6>  :wrap!<CR>
nnoremap <F5>  :tab ball<CR>

map <F12> :JSLint<CR>
map <F11> :JSLintLight<CR>

autocmd FileWritePost,BufWritePost *.js :JSLint

vnoremap <C-C> "+y
vnoremap <S-Insert> "+gP

set guioptions-=T                                                                             
"set guioptions+=l
set guioptions+=c
set guioptions-=e
set guioptions+=M

nmap <tab> V>
nmap <s-tab> V<
xmap <tab> >gv
xmap <s-tab> <gv

augroup Tabs
   nmap    ,tn    :tabnew<cr>
   nmap    ,te    :tabedit
   nmap    ,tx    :tabedit .<cr>
   nmap    ,tf    :tabfirst<cr>
   nmap    ,tl    :tablast<cr>
   nmap    ,th    :tab help<cr>
   nmap    <c-tab> :tabn<cr>
   nmap    <c-\> :tabn<cr>
augroup END

let xml_use_xhtml = 1
let html_use_css = 1

"autocmd FileType * setl omnifunc=syntaxcomplete#Complete
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setl omnifunc=htmlcomplete#CompleteTags noci
autocmd FileType xhtml setl omnifunc=htmlcomplete#CompleteTags noci
"autocmd FileType css setl omnifunc=csscomplete#CompleteCSS noci
"autocmd FileType xml setl omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType sql set omnifunc=nullcomplete#Complete
"autocmd FileType c set omnifunc=ccomplete#Complete
"set completeopt=menu,preview,menuone

let g:acp_enableAtStartup = 1
let g:acp_completeOption = '.,w,b,u,t,i,k'
let g:acp_behaviorSnipmateLength = 1
let g:acp_behaviorKeywordCommand = "\<C-n>"

let xhbehavs = { 'xhtml': [] }
    call add(xhbehavs.xhtml, {
        \   'command'      : "\<C-x>\<C-u>",
        \   'completefunc' : 'acp#completeSnipmate',
        \   'meets'        : 'acp#meetsForSnipmate',
        \   'onPopupClose' : 'acp#onPopupCloseSnipmate',
        \   'repeat'       : 0,
    \})
    call add(xhbehavs.xhtml, {
        \   'command' : g:acp_behaviorKeywordCommand,
        \   'meets'   : 'acp#meetsForKeyword',
        \   'repeat'  : 0,
        \ })
    call add(xhbehavs.xhtml, {
        \    'command'  : "\<C-x>\<C-o>",
        \    'meets'   : 'acp#meetsForKeyword',
        \    'repeat'   : 0,
    \})

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
call extend(g:acp_behavior, xhbehavs, 'keep')


"set tags+=D:/vimE/ctags/stltags
"set tags+=D:/vimE/ctags/cpptags
"let OmniCpp_DefaultNamespaces = ["std"] 

"let g:AutoComplPop_MappingDriven = 1

function! Substitute()
    call inputsave()
    let g:MyPattern = input("Pattern: ")
    let g:MySubs = input("Substitution (" . g:MyPattern . ") : ")
    exe '%s/' . g:MyPattern . '/' . g:MySubs . '/g'
    call inputrestore()
endfunction
nmap <c-h> :call Substitute()<CR>


let g:netrw_cygwin= 0
let g:netrw_scp_cmd = "pscp" 

" smooth scroll
"map <PageDown> <C-F>
"map <PageUp> <C-B>

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

set foldmethod=manual

"highlight Pmenu term=NONE cterm=NONE ctermfg=7 ctermbg=5 gui=NONE guifg=White guibg=Magenta
"highlight PmenuSel term=NONE cterm=NONE ctermfg=0 ctermbg=7 gui=NONE guifg=Black guibg=White
"highlight PmenuSbar term=NONE cterm=NONE ctermfg=7 ctermbg=0 gui=NONE guifg=White guibg=Black
"highlight PmenuThumb term=NONE cterm=NONE ctermfg=0 ctermbg=7 gui=NONE guifg=Black guibg=White

"highlight PMenu      cterm=bold ctermbg=Blue ctermfg=Gray
"highlight PMenuSel   cterm=bold ctermbg=Red ctermfg=White
"highlight PMenuSbar  cterm=bold ctermbg=darkgray
"highlight PMenuThumb cterm=bold ctermbg=White

"autocmd FileWritePost,BufWritePost *.js !cd ..;java -jar JsTestDriver.jar --tests all

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


inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
"inoremap < <><ESC>i
"inoremap > <c-r>=ClosePair('>')<CR>

function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
		return a:char
    endif
endf
