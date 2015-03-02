autoload -U colors

if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors

    ## ---
    ## Colorize ls (search man ls for LSCOLORS)
    export CLICOLOR=1
    export LSCOLORS=cxfxexdxbxehbhgefehchd
    export GREP_OPTIONS='--color=auto'
fi

