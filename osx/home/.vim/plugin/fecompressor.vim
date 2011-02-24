" Yuicompressor and ClosureCompiler and less: 
" http://blog.othree.net/log/2009/12/26/javascript-on-vim/
function Fe_compress ()
    let cwd = expand('<afile>:p:h')
    let nam = expand('<afile>:t:r')
    let ext = expand('<afile>:e')
    let cssnam = nam.'.css'
    if ext == 'less' && executable('lessc')
        cal system( 'lessc '.cwd.'/'.nam.'.'.ext.' > '.cwd.'/'.cssnam.' &')
        cal Css_compress()
    elseif ext == 'scss' && executable('sass')
        cal system( 'sass '.cwd.'/'.nam.'.'.ext.' > '.cwd.'/'.cssnam.' &')
        cal Css_compress()
    elseif ext == 'css'
        cal Css_compress()
    elseif ext == 'js'
        if -1 == match(nam, "[\._]src$")
            let minfname = nam.".min.".ext
        else
            let minfname = substitute(nam, "[\._]src$", "", "g").".".ext
        endif
        if filewritable(cwd.'/'.minfname)
            if executable('uglifyjs')
                cal system( 'uglifyjs '.cwd.'/'.nam.'.'.ext.' > '.cwd.'/'.minfname.' &')
            elseif executable('closure-compiler')
                cal system( 'closure-compiler --js '.cwd.'/'.nam.'.'.ext.' > '.cwd.'/'.minfname.' &')
            elseif executable('yuicompressor')
                cal system( 'yuicompressor '.cwd.'/'.nam.'.'.ext.' > '.cwd.'/'.minfname.' &')
            endif
        endif
    endif
endfunction

function Css_compress ()
    if executable('yuicompressor')
        let cwd = expand('<afile>:p:h')
        let nam = expand('<afile>:t:r')
        let ext = "css"
        if -1 == match(nam, "[\._]src$")
            let minfname = nam.".min.".ext
        else
            let minfname = substitute(nam, "[\._]src$", "", "g").".".ext
        endif
        if filewritable(cwd.'/'.minfname)
            cal system( 'yuicompressor '.cwd.'/'.nam.'.'.ext.' > '.cwd.'/'.minfname.' &')
        endif
    endif
endfunction

autocmd FileWritePost,BufWritePost *.js :call Fe_compress()
autocmd FileWritePost,BufWritePost *.css :call Fe_compress()
autocmd FileWritePost,BufWritePost *.less :call Fe_compress()
autocmd FileWritePost,BufWritePost *.scss :call Fe_compress()

