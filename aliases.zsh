if whichplatform 'darwin'; then
    alias l='ls -G'
    alias ll='ls -GFlh'
    alias l.='ls -GA'
    alias ll.='ls -GFalh'
    alias lsd='ls -ld *(-/DN)' ## list only dirs
    alias lsh='ls -d .*' # list only dot files
    alias llh='ls -ld .*' # list only dot files (long form)

elif whichplatform 'linux'; then
    alias l='ls --color=auto -G'
    alias ll='ls --color=auto -GFlh'
    alias l.='ls --color=auto -GA'
    alias ll.='ls --color=auto -GFalh'
    alias lsd='ls --color=auto -ld *(-/DN)' ## list only dirs
    alias lsh='ls --color=auto -d .*' # list only dot files
    alias llh='ls --color=auto -ld .*' # list only dot files (long form)
fi

    alias du1='du -chs *(/)' ## du with depth 1

    alias d='dirs -v'

    alias cls='clear'

    alias lv='/usr/local/share/vim/vim74/macros/less.sh'
    alias vr='vim -R'

    alias -g ..='cd ..'
    alias -g ...='cd ../..'
