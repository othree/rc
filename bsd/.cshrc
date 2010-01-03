alias g 'grep --color'
alias ll 'ls -al'
alias cls 'clear'
alias :q 'exit'
alias :Q 'exit'
alias cd.. "cd .."
alias cd... "cd ../.."
alias cd.... "cd ../../.."
alias cd..... "cd ../../../.."
alias cd...... "cd ../.././../.."
alias cd....... "cd ../../../../../.."

setenv LC_CTYPE "zh_TW.UTF-8"

set path = ( $path /net/account/pixuser/othree/bin/ )

bindkey "\e[1~" beginning-of-line        # Home
bindkey "\e[7~" beginning-of-line        # Home rxvt
bindkey "\e[2~" overwrite-mode           # Ins
bindkey "\e[3~" delete-char              # Delete
bindkey "\e[4~" end-of-line              # End
bindkey "\e[8~" end-of-line              # End rxvt
bindkey "\e[5~" history-search-backward  # PageUp
bindkey "\e[6~" history-search-forward   # PageDown

complete git 'p/1/(add bisect branch checkout clone commit diff fetch grep init log merge mv pull push rebase reset rm show status tag cherry-pick)/'

