" we need the conceal feature (vim ≥ 7.3)
if !has('conceal')
    finish
endif

" remove the keywords. we'll re-add them below
syntax clear javaScriptFunction
syntax match javaScriptFunctionNoParams /function()/ conceal cchar=ƒ
syntax match javaScriptFunction /\<function\>/ nextgroup=javaScriptFuncName skipwhite conceal cchar=ƒ

" syntax match pyNiceOperator "\<in\>" conceal cchar=∈
" syntax match pyNiceOperator "\<not " conceal cchar=¬
syntax match jsNiceOperator "<=" conceal cchar=≤
syntax match jsNiceOperator ">=" conceal cchar=≥
"syntax match jsNiceOperator "==" conceal cchar=≡
"syntax match jsNiceOperator "!=" conceal cchar=≠
"syntax match jsNiceOperator "===" conceal cchar=≡
"syntax match jsNiceOperator "!==" conceal cchar=≠

hi link javaScriptFunctionNoParams javaScriptFunction
hi! link Conceal javaScriptFunction
"hi link jsNiceOperator Operator
"hi! link Conceal Operator

set conceallevel=2


