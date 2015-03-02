## --
# PATH stuff
#
# OS X sets a minimal path by running /usr/libexec/path_helper and reading
# the content of /etc/paths and /etc/paths.d/. In the following I tweak the
# $PATH a little bit to suite my needs. For more information read `man
# path_helper`.

# Add libexec to the path automatically generated
MIN_PATH=${PATH}:/usr/libexec

# Setup /usr/local/bin PATH
if [[ -d /usr/local/bin ]]; then
    local USR_BIN=/usr/local/bin
else
    local USR_BIN=
fi

# Setup /usr/local/sbin PATH
if [[ -d /usr/local/sbin ]]; then
    local USR_SBIN=/usr/local/sbin
else
    local USR_SBIN=
fi

# Where Homebrew puts Python site-packages installed via pip
if [[ -d /usr/local/share/python ]]; then
    local SITE_PACKAGES=/usr/local/share/python
else
    local SITE_PACKAGES=
fi

# Setup user's bin PATH
if [[ -d $HOME/Library/bin ]]; then
    local HOME_BIN=$HOME/Library/bin
else
    local HOME_BIN=
fi

# Setup the complete PATH
PATH=$HOME_BIN:$USR_BIN:$USR_SBIN:$SITE_PACKAGES:$MIN_PATH

PATH=${PATH/::/:} # Remove double colon (if present)
PATH=${PATH#:} # Remove leading colon (if present)

export PATH # Export it again

unset HOME_BIN USR_BIN USR_SBIN SITE_PACKAGES MIN_PATH

typeset -U path # Use zsh coolness to remove duplicates


