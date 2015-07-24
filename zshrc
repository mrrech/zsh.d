## ---
## Site functions
autoload -U zmv
autoload -Uz compinit
compinit

## ---
## Set colors
if whichhostname 'ariciputi'; then # force 256 colors terminal
    export TERM=xterm-256color
fi
source ${HOME}/.zsh.d/colors.zsh

## ---
## Keybindings settings
source ${HOME}/.zsh.d/bindkeys.zsh

## ---
## Common options
source ${HOME}/.zsh.d/setopt.zsh

## ---
## Completions settings
source ${HOME}/.zsh.d/completion.zsh

## ---
## Prompt settings
source ${HOME}/.zsh.d/prompt.zsh

## ---
## Local functions
autoload -U ppath

## --
## MacOSX specific functions
if whichplatform 'darwin'; then
fi

## --
## Statpro specific functions
if whichhostname 'ariciputi'; then
    autoload -U srspath
    autoload -U tmux-new-session
fi

## --
## Aliases definition
source ${HOME}/.zsh.d/aliases.zsh

