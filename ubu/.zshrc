#
export PATH=$PATH:$HOME/bin

setopt prompt_subst

git_prompt_info() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    print "|%{\e[38;5;197m%}${ref#refs/heads/}%{\e[0m%}"
}

export PROMPT="$(print '%{\e[1;37m%}[%/$(git_prompt_info)] -%n- ')\
$(print '%{\e[38;5;22m%}>')\
$(print '%{\e[38;5;34m%}>')\
$(print '%{\e[38;5;46m%}>')\
$(print '%{\e[0m%}') "
#$(print '%{\e[38;5;16m%}>%{\e[0m%}')\
#$(print '%{\e[38;5;28m%}>%{\e[0m%}')\
#$(print '%{\e[38;5;40m%}>%{\e[0m%}')\

export PROMPT2="$(print '%{\e[1;37m%}[%/$(git_prompt_info)] -%n- ')\
$(print '%{\e[38;5;22m%}>')\
$(print '%{\e[38;5;34m%}>')\
$(print '%{\e[38;5;46m%}>')\
$(print '%{\e[0m%}') %_ \
$(print '%{\e[38;5;22m%}>')\
$(print '%{\e[38;5;34m%}>')\
$(print '%{\e[38;5;46m%}>')\
$(print '%{\e[0m%}') "

export RPROMPT="$(print '[%(?.%{\e[1;37m%}%T%{\e[0m%}. %{\e[38;5;185m%}%?%{\e[0m%} )]')"
#export RPROMPT="$(print '[ %{\e[1;37m%}%(?.%T.%?)%{\e[0m%} ]')"
#export RPROMPT=$'%(?..[ %B%?%b ])'

export LC_ALL=zh_TW.UTF-8
export LANG=$LC_ALL
export EDITOR="vim"
export GREP_OPTIONS='--color=auto'
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.history

#export LSCOLORS=ExFxCxdxBxegedabagacad
LS_COLORS=''
LS_COLORS=$LS_COLORS:'no=0'           # Normal text       = Default foreground  
LS_COLORS=$LS_COLORS:'fi=0'           # Regular file      = Default foreground
LS_COLORS=$LS_COLORS:'di=01;34'       # Directory         = Bold, Blue
LS_COLORS=$LS_COLORS:'ln=01;36'       # Symbolic link     = Bold, Cyan
LS_COLORS=$LS_COLORS:'pi=33'          # Named pipe        = Yellow
LS_COLORS=$LS_COLORS:'so=01;35'       # Socket            = Bold, Magenta
LS_COLORS=$LS_COLORS:'do=01;35'       # DO                = Bold, Magenta
LS_COLORS=$LS_COLORS:'bd=01;37'       # Block device      = Bold, Grey
LS_COLORS=$LS_COLORS:'cd=01;37'       # Character device  = Bold, Grey
LS_COLORS=$LS_COLORS:'ex=35'          # Executable file   = Light, Blue
LS_COLORS=$LS_COLORS:'*FAQ=31;7'      # FAQs              = Foreground Red, Background Black
LS_COLORS=$LS_COLORS:'*README=33;7'   # READMEs           = Foreground Red, Background Black
LS_COLORS=$LS_COLORS:'*INSTALL=31;7'  # INSTALLs          = Foreground Red, Background Black
LS_COLORS=$LS_COLORS:'*.sh=47;31'     # Shell-Scripts     = Foreground White, Background Red
LS_COLORS=$LS_COLORS:'*.vim=35'       # Vim-"Scripts"     = Purple
LS_COLORS=$LS_COLORS:'*.swp=00;44;37' # Swapfiles (Vim)   = Foreground Blue, Background White
LS_COLORS=$LS_COLORS:'*.sl=30;33'     # Slang-Scripts     = Yellow
LS_COLORS=$LS_COLORS:'*,v=5;34;93'    # Versioncontrols   = Bold, Yellow
LS_COLORS=$LS_COLORS:'or=01;05;31'    # Orphaned link     = Bold, Red, Flashing
LS_COLORS=$LS_COLORS:'*.c=1;33'       # Sources           = Bold, Yellow
LS_COLORS=$LS_COLORS:'*.C=1;33'       # Sources           = Bold, Yellow
LS_COLORS=$LS_COLORS:'*.h=1;33'       # Sources           = Bold, Yellow
LS_COLORS=$LS_COLORS:'*.cc=1;33'      # Sources           = Bold, Yellow
LS_COLORS=$LS_COLORS:'*.awk=1;33'     # Sources           = Bold, Yellow
LS_COLORS=$LS_COLORS:'*.pl=1;33'      # Sources           = Bold, Yellow
LS_COLORS=$LS_COLORS:'*.jpg=1;32'     # Images            = Bold, Green
LS_COLORS=$LS_COLORS:'*.jpeg=1;32'    # Images            = Bold, Green
LS_COLORS=$LS_COLORS:'*.JPG=1;32'     # Images            = Bold, Green
LS_COLORS=$LS_COLORS:'*.gif=1;32'     # Images            = Bold, Green
LS_COLORS=$LS_COLORS:'*.png=1;32'     # Images            = Bold, Green
LS_COLORS=$LS_COLORS:'*.jpeg=1;32'    # Images            = Bold, Green
LS_COLORS=$LS_COLORS:'*.ppm=1;32'     # Images            = Bold, Green
LS_COLORS=$LS_COLORS:'*.pgm=1;32'     # Images            = Bold, Green
LS_COLORS=$LS_COLORS:'*.pbm=1;32'     # Images            = Bold, Green
LS_COLORS=$LS_COLORS:'*.tar=31'       # Archive           = Red
LS_COLORS=$LS_COLORS:'*.tgz=31'       # Archive           = Red
LS_COLORS=$LS_COLORS:'*.gz=31'        # Archive           = Red
LS_COLORS=$LS_COLORS:'*.zip=31'       # Archive           = Red
LS_COLORS=$LS_COLORS:'*.sit=31'       # Archive           = Red
LS_COLORS=$LS_COLORS:'*.lha=31'       # Archive           = Red
LS_COLORS=$LS_COLORS:'*.lzh=31'       # Archive           = Red
LS_COLORS=$LS_COLORS:'*.arj=31'       # Archive           = Red
LS_COLORS=$LS_COLORS:'*.bz2=31'       # Archive           = Red
LS_COLORS=$LS_COLORS:'*.html=36'      # HTML              = Cyan
LS_COLORS=$LS_COLORS:'*.htm=1;34'     # HTML              = Bold, Blue
LS_COLORS=$LS_COLORS:'*.php=1;45'     # PHP               = White, Cyan
LS_COLORS=$LS_COLORS:'*.doc=1;34'     # MS-Word *lol*     = Bold, Blue
LS_COLORS=$LS_COLORS:'*.txt=1;34'     # Plain/Text        = Bold, Blue
LS_COLORS=$LS_COLORS:'*.o=1;36'       # Object-Files      = Bold, Cyan
LS_COLORS=$LS_COLORS:'*.a=1;36'       # Shared-libs       = Bold, Cyan
export LS_COLORS

setopt correctall
setopt append_history
setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt no_hist_beep
setopt hist_save_no_dups
setopt noflowcontrol                  #no flow control enable keybind for ^Q

autoload -U compinit
compinit

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' list-colors $LS_COLORS
#zstyle ':completion:*' special-dirs ..

alias screen="nocorrect screen"

#bindkey -v                               # vi mode
bindkey -e                               # emacs mode
bindkey "\e[1~" beginning-of-line        # Home
bindkey "\e[7~" beginning-of-line        # Home rxvt
bindkey "\e[2~" overwrite-mode           # Ins
bindkey "\e[3~" delete-char              # Delete
bindkey "\e[4~" end-of-line              # End
bindkey "\e[8~" end-of-line              # End rxvt
bindkey "\e[5~" history-search-backward  # PageUp
bindkey "\e[6~" history-search-forward   # PageDown
bindkey "^Q" push-line
bindkey "^G" get-line
bindkey "^Z" undo
bindkey "^Y" vi-undo-change

alias vi="vim"
alias vim="vim -p"
alias df="df -h"
alias ls="ls --color"
alias ll="ls -al"
alias l="ls -a"
alias cls="clear"
alias g='grep'
alias :q='exit'
alias :Q='exit'
alias ~="cd ~"
alias ..="cd .."
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../../..'
alias -g ......='../../../../../..'
alias -g .......='../../../../../../..'

