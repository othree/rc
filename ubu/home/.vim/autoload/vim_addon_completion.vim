if !exists('g:completion_function_config') | let g:completion_function_config = {} | endif
let s:config = g:completion_function_config

" last_chosen keep a list of names so that when you enter a different buffer
" having same filetype the same comcpletion func can be assigned
let s:config['last_chosen'] = get(s:config, 'last_chosen', {})
let s:config['functions'] = get(s:config, 'functions', {})
let s:last_chosen = s:config['last_chosen']

" return next available function in order
" if f cannot be found return first func
fun! vim_addon_completion#NextFunc(f)
  let c = keys(s:config['functions'])
  let idx = (index(c, a:f) + 1) % len(c)
  return c[idx]
endf

fun! vim_addon_completion#Get(type)
  let v = a:type.'func'
  exec 'return &'.v
endf

" opts: dict with keys
"             'type': "omni" or "complete"
"   optional: 'regex':   Only show items matching regex
"   optional: 'user' : any_val Function was called by user (update dict last_chosen)
fun! vim_addon_completion#ChooseFunc(opts)

  let items = values(s:config['functions'])
  " filter by filetype
  call filter(items, '!has_key(v:val,"scope") || v:val["scope"] =~ '.string(substitute(&filetype,'\.','\|','g')))
  " filter by given regex or name:
  if has_key(a:opts,'regex')
    let regex = a:opts['regex']
    call filter(items, 'v:val["func"] =~ '.string(a:opts['regex']))
  endif

  " let user choose an item if there are more than 1 left:
  if len(items) > 1
    let list = []
    for i in items
      call add(list, i['func'].' '.get(i,'scope','').' '.get(i,'description',''))
    endfor
    let idx = tlib#input#List("si",'choose '.a:opts['type'].'func: ', list) - 1
    let items = [items[idx]]
  endif
  if len(items) == 0
    echoe "no completion functions available!"
    return
  else
    let item = items[0]
    if &filetype != '' && has_key(a:opts,'user')
      let s:last_chosen[&filetype] = item['func']
    endif
    call vim_addon_completion#SetCompletionFunc(a:opts['type'], item['func'])

    " set other completion function to the next available if it wasn't set by
    " user explicitely
    let other = a:opts['type'] == 'complete' ? 'omni' : 'complete'
    let of = vim_addon_completion#Get(other)
    if of == ''
      let next = vim_addon_completion#NextFunc(item['func'])
      call vim_addon_completion#SetCompletionFunc(other, next)
      if &filetype != '' && has_key(a:opts,'user')
        let s:last_chosen[&filetype] = item['func']
      endif
    endif
  endif
endf

fun! vim_addon_completion#SetCompletionFunc(type, func)
  let i = s:config['functions'][a:func]
  " be smart: If the current completion function isn't known save that
  " the user can switch back
  let fu = vim_addon_completion#Get(a:type)
  if fu != '' && !has_key(s:config['functions'], fu)
    let d = {'func' : fu}
    if &filetype != ''
      let d['scope'] = &filetype
    end
    call vim_addon_completion#RegisterCompletionFunc(d)
  endif

  " set oompletion function
  exec 'setlocal '.a:type.'func='.i['func']
  if has_key(i,'completeopt')
    exec 'setlocal completeopt='.i['completeopt']
  endif
endf

fun! vim_addon_completion#ChooseFuncWrapper(type, ...)
  let dict = {'user' : 1, 'type': a:type}
  if a:0 > 0
    let dict['regex'] = a:1
  endif
  call vim_addon_completion#ChooseFunc(dict)
endf

fun! vim_addon_completion#Var()
  call scriptmanager#DefineAndBind('res', a:scope.':completion_functions', '{}')
  return res
endf

" scope either g or b which means global or buffer
" dict has keys:
"   func: string. This is called
"   description: long description (optional)
"   scope: filetype. This function will only be shown selecting a completion
"         function when editing that filetype
"   completeopt: complete options
"
fun! vim_addon_completion#RegisterCompletionFunc(dict)
  let s:config['functions'][a:dict['func']] = a:dict
endf

" if no function is set set one
fun! vim_addon_completion#SetFuncFirstTime(type)
  let fun = vim_addon_completion#Get(a:type)
  if fun == ''
    call vim_addon_completion#ChooseFunc({'user' : 1, 'type': a:type})
  endif
  return "\<c-x>".(a:type == 'omni' ? "\<c-o>" : "\<c-u>")
endf

" cycle function
fun! vim_addon_completion#Cycle(type)
  let next=vim_addon_completion#NextFunc(vim_addon_completion#Get(a:type))
  exec 'set '.a:type.'func='.next
  " echoe works in innsert mode. You can continue typing even if there is a
  " press enter
  echoe 'set '.a:type.' to '.next
  return ''
endf

" provide a function which translates a pattern into a regex and or glob
" pattern. You can implement camel case matching this way.
"
" may return {}
" if vim_regex is returned this pattern should be matched against names as
" well to determine wether an item must be added to the completion list
" users can implement camel case matching or similar
" identifier: a name of the completion invoking this function.
"             You may want to customize only some completions, not all
"
fun! vim_addon_completion#AdditionalCompletionMatchPatterns(pat, identifier, ...)
  let opts = a:0 > 0 ? a:1 : {}
  let start = get(opts,'match_beginning_of_string', 1)

  if exists('g:vim_addon_completion_Pattern_To')
    return call(g:vim_addon_completion_Pattern_To, [a:pat, a:identifier, opts])
  else
    " default: provide camel case matching
    " don't know how to make CamelCase matching using glob
    " glob may be used by some plugins
    return {
          \ 'vim_regex': (start ? '^' : '').vim_addon_completion#AdvancedCamelCaseMatching(a:pat)
          \ }
  endif
endf

" abc also matches axxx_bxxx_cxxx
" ABC also matches AxxxBxxxxCxxx
" ABC also matches ABxxCxx
function! vim_addon_completion#AdvancedCamelCaseMatching(expr)
  let result = ''
  if len(a:expr) > 5 " vim can't cope with to many \( ? and propably we no longer want this anyway
    return 'noMatchDoh'
  endif
  for index in range(0,len(a:expr))
    let c = a:expr[index]
    if c =~ '\u'
      let result .= c.'\u*\l*_\='
    elseif c =~ '\l'
      let result .= c.'\l*\%(\l\)\@!_\='
    else
      let result .= c
    endif
  endfor
  return result
endfunction
