# prompt_subst must be active in order to make
# variable substitution working in the prompt
setopt prompt_subst

autoload -Uz vcs_info

if [[ "$terminfo[colors]" -ge 8 ]]; then
    # make sure colors are loaded
    autoload -U colors && colors

    PS1='%F{099}%D{%a %d %b} %F{111}%* %F{044}%n %F{039}%m ${vcs_info_msg_0_}%F{reset}
%(?..%F{009}%?%f )%F{011}%#%F{reset} '

    local FMT_PATH="%F{100}%s %F{185}%r %F{208}%b %c%u %F{040}%35<..<%S%<<%F{reset}"
    local FMT_ACTION="%F{100}%s %F{185}%r %F{208}%b %F{207}%a %c%u %F{040}%35<..<%S%<<%F{reset}"
    local FMT_NOVCS="%F{040}%45<..<%~%<<%F{reset}"

else
    # Set a b/w prompt
    PS1='%D{%a %d %b} %* %n %m ${vcs_info_msg_0_}
%(?..%? )%# '

    local FMT_PATH="%s %r %b %35<..<%S%<<"
    local FMT_ACTION="%s %r %b %a %35<..<%S%<<"
    local FMT_NOVCS="%45<..<%~%<<"

fi

# Setup vcs_info
zstyle ":vcs_info:*" enable git hg
zstyle ":vcs_info:(hg*|git*):*" check-for-changes true
zstyle ":vcs_info:hg*:*" use-simple false
zstyle ":vcs_info:hg*:*" get-revision true
zstyle ":vcs_info:hg*:*" hgrevformat ''
zstyle ':vcs_info:(hg*|git*):*' stagedstr '%F{28}o'
zstyle ':vcs_info:(hg*|git*):*' unstagedstr '%F{196}x'
zstyle ":vcs_info:(hg*|git*):*" formats       "${FMT_PATH}"   ""
zstyle ":vcs_info:(hg*|git*):*" actionformats "${FMT_ACTION}" ""
zstyle ":vcs_info:*" nvcsformats   "${FMT_NOVCS}"  ""

precmd () { vcs_info }

unset FMT_PATH FMT_ACTION FMT_NOVCS

