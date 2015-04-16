autoload -U colors

if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors

    ## ---
    ## Colorize ls (search man ls for LSCOLORS)
    if whichplatform 'darwin'; then
        export CLICOLOR=1
        export LSCOLORS=cxfxexdxbxehbhgefehchd
    elif whichplatform 'linux'; then
        export LS_COLORS="di=32;40:ln=35;40:so=34;40:pi=33;40:ex=31;40:bd=34;47:cd=31;47:su=36;44:sg=35;44:tw=37;42:ow=37;43:"
    fi
    export GREP_OPTIONS='--color=auto'
fi

