" Yuicompressor and ClosureCompiler and less: 
" http://blog.othree.net/log/2009/12/26/javascript-on-vim/
function Js_css_compress ()
    let cwd = expand('<afile>:p:h')
    let nam = expand('<afile>:t:r')
    let ext = expand('<afile>:e')
    if -1 == match(nam, "[\._]src$")
        let minfname = nam.".min.".ext
    else
        let minfname = substitute(nam, "[\._]src$", "", "g").".".ext
    endif
    if ext == 'less'
        if executable('lessc')
            cal system( 'lessc '.cwd.'/'.nam.'.'.ext.' > '.cwd.'/'.nam.'.css &')
        endif
    else
        if filewritable(cwd.'/'.minfname)
            if ext == 'js' && executable('closure-compiler')
                cal system( 'closure-compiler --js '.cwd.'/'.nam.'.'.ext.' > '.cwd.'/'.minfname.' &')
            elseif executable('yuicompressor')
                cal system( 'yuicompressor '.cwd.'/'.nam.'.'.ext.' > '.cwd.'/'.minfname.' &')
            endif
        endif
    endif
endfunction
autocmd FileWritePost,BufWritePost *.js :call Js_css_compress()
autocmd FileWritePost,BufWritePost *.css :call Js_css_compress()
autocmd FileWritePost,BufWritePost *.less :call Js_css_compress()

