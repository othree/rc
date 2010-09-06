" Vim color file
" Maintainer:	Thorsten Maerz <info@netztorte.de>
" Last Change:	2006 Dec 07
" grey on black
" optimized for TFT panels

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "othree"

" hardcoded colors :
" GUI Comment : #80a0ff = Light blue

" GUI
highlight Normal     guifg=Grey80	guibg=Black
highlight Search     guifg=Black	guibg=yellow	gui=bold
highlight Visual     guifg=#404040			gui=bold
highlight Cursor     guifg=Black	guibg=Green	gui=bold
highlight Special    guifg=Orange
highlight Comment    guifg=#6080df
highlight StatusLine guifg=blue		guibg=white
highlight Statement  guifg=#ffff99			gui=NONE
highlight Type						gui=NONE
highlight LineNr     guifg=Grey50	guibg=Black	
highlight NonText    guifg=#990000
highlight PreProc    guifg=#ffa8ff

" Console
highlight Normal     ctermfg=LightGrey	ctermbg=Black
highlight Search     ctermfg=Black	ctermbg=Red	cterm=NONE
highlight Visual					cterm=reverse
highlight Cursor     ctermfg=Black	ctermbg=Green	cterm=bold
highlight Special    ctermfg=Brown
highlight Comment    ctermfg=Blue
highlight StatusLine ctermfg=blue	ctermbg=white
highlight Statement  ctermfg=Yellow			cterm=NONE
highlight Type						cterm=NONE

" only for vim 5
if has("unix")
  if v:version<600
    highlight Normal  ctermfg=Grey	ctermbg=Black	cterm=NONE	guifg=Grey80      guibg=Black	gui=NONE
    highlight Search  ctermfg=Black	ctermbg=Red	cterm=bold	guifg=Black       guibg=Red	gui=bold
    highlight Visual  ctermfg=Black	ctermbg=yellow	cterm=bold	guifg=#404040			gui=bold
    highlight Special ctermfg=LightBlue			cterm=NONE	guifg=LightBlue			gui=NONE
    highlight Comment ctermfg=Cyan			cterm=NONE	guifg=LightBlue			gui=NONE
  endif
endif

" ポップアップメニューの色変える
highlight Pmenu  guibg=#6666ff guifg=#000000
highlight PmenuSel guibg=#0000dd guifg=#ffffff
highlight PmenuSbar guibg=#333333
highlight PmenuThumb guibg=#aaaaaa

highlight TabLine       term=reverse      cterm=reverse ctermfg=black ctermbg=gray guifg=black guibg=gray
highlight TabLineFill   term=reverse      cterm=reverse ctermfg=gray  ctermbg=gray guifg=gray  guibg=gray
highlight TabLineSel                      ctermfg=gray ctermbg=black
