## ---
## My zshenv file
##
## Written by Andrea Riciputi.
##
## Released into the public domain.
##

## ---
## Setup and export FPATH
if [[ -d $HOME/.zsh.d/local-functions ]]; then

    FPATH=$HOME/.zsh.d/local-functions:$FPATH
    export FPATH

fi

## ---
## Load the whichplatform
autoload -U whichplatform
autoload -U whichhostname

## ---
## Setup and export Mac PATH and MANPATH
if whichplatform 'darwin'; then
    source ${HOME}/.zsh.d/path.zsh
fi

## ---
## Setup and export Linux PATH and MANPATH
if whichhostname 'ariciputi'; then
    export PATH=/home/ariciputi/bin:$PATH
    export DISPLAY=:0.0
fi

## ---
## Export common environment variables

# Set locale environment variables
export LC_ALL="en_US.UTF-8"

## --
## Set default editor
if [[ -x $(which vim) ]]; then
    export EDITOR='vim'
fi

## ---
## Make less to work correctly with colors
export LESS="-R --ignore-case"

## ---
## virtualenvwrapper settings.

if whichplatform 'darwin'; then
    local VIRTUALENVWRAPPER=/usr/local/bin/virtualenvwrapper.sh
    local WORKON_HOME=$HOME/Library/Python/Virtualenv
elif whichplatform 'linux'; then
    local VIRTUALENVWRAPPER=/usr/local/bin/virtualenvwrapper_lazy.sh
    local WORKON_HOME=$HOME/venvs
fi

if [[ -f $VIRTUALENVWRAPPER ]]; then
    export WORKON_HOME=$WORKON_HOME
    source $VIRTUALENVWRAPPER
fi
unset VIRTUALENVWRAPPER

