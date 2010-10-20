if !exists('g:config') | let g:config = {} | endif | let s:c = g:config
let s:c['goto-thing-handler-mapping-lhs'] = get(s:c, 'goto-thing-handler-mapping-lhs', 'gf')

exec 'noremap '.s:c['goto-thing-handler-mapping-lhs'].' :call on_thing_handler#HandleOnThing()<cr>'
