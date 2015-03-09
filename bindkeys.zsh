## --
## Setting key bindings
##


# Set emacs default key bindings
bindkey -e

bindkey -r '\ef'
bindkey -r '\eb'
bindkey '\ef' vi-forward-word
bindkey '\eb' vi-backward-word

bindkey -r '\ep'
bindkey -r '\en'
bindkey '\ep' history-beginning-search-backward
bindkey '\en' history-beginning-search-forward

# zsh is too loose in definings words limits
WORDCHARS=${WORDCHARS//[\/.;=]}

