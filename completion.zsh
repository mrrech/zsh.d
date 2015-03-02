# General completion technique
zstyle ':completion:*' completer _complete _complete:-extended _match _prefix
zstyle ':completion::match:*' match-original only # niente * alla fine del pattern
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:complete-extended:*' matcher 'r:|[.,_-]=* r:|=*'
zstyle ':completion::prefix:::' completer _complete

# Completion Colors
LS_COLORS="no=00:fi=00:di=${color[fg-green]}:ln=${color[fg-magenta]}:bd=${color[fg-blue]};${color[bg-cyan]}:cd=${color[fg-blue]};${color[bg-yellow]}:ex=${color[fg-red]}"

zstyle ':completion:*' list-colors ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Completion caching
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

# Expand partial paths
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-slashes 'yes'

# Include non-hidden directories in globbed file completions
# for certain commands
#zstyle ':completion::complete:*' tag-order globbed-files directories all-files
#zstyle ':completion::complete:*:tar:directories' file-patterns '*~.*(-/)'

# Don't complete backup files as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'

# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.(pyc|elc)' '*~'

# Never select the parent directory for cd, mv or cp (i.e. cd ../<TAB>)
zstyle ':completion:*:(cd|mv|cp):*' ignore-parents parent pwd

# Avoid to propose the already completed file
zstyle ':completion:*:(rm|kill|diff):*' ignore-line yes

# Prevent CVS files/directories from being completed
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'

# Retrieve remote hosts name from ~/.ssh/config and ~/.ssh/known_hosts
[ -f ~/.ssh/config ] && : ${(A)ssh_config_hosts:=${${${${(@M)${(f)"$(<$HOME/.ssh/config)"}:#Host *}#Host }:#*\**}:#*\?*}}
[ -f ~/.ssh/known_hosts ] && : ${(A)ssh_known_hosts:=${${${(f)"$(<$HOME/.ssh/known_hosts)"}%%\ *}%%,*}}

zstyle ':completion:*:*:*' hosts $ssh_config_hosts $ssh_known_hosts

# Retrieve remote users from ~/.ssh/config
[ -f ~/.ssh/config ] && : ${(A)ssh_config_users:=${${(@M)${(f)"$(<$HOME/.ssh/config)"}:#[[:blank:]]##User *}#[[:blank:]]##User }}

zstyle ':completion:*:*:*:users' users $ssh_config_users

# Exclude all the useless users
zstyle ':completion:*:*:*:users' ignored-patterns \
   Guest _amavisd _appowner _appserver _ard _atsserver _calendar _clamav \
   _cvs _cyrus _devdocs _eppc _installer _jabber _lp _mailman _mcxalr \
   _mdnsresponder _mysql _pcastagent _pcastserver _postfix _qtss _sandbox \
   _securityagent _serialnumberd _spotlight _sshd _svn _teamsserver _tokend \
   _unknown _update_sharing _uucp _windowserver _www _xgridagent _xgridcontroller \
   daemon nobody

# Processes completion
zstyle ':completion:*:*:*:*:processes' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always

# Separate matches into groups
zstyle ':completion:*:matches' group 'yes'

# Describe each match group.
zstyle ':completion:*:descriptions' format "%{${fg[magenta]}%}- %d -%{${fg[default]}%}"
zstyle ':completion:*' group-name ''

# Messages/warnings format
zstyle ':completion:*:messages' format "%{${fg[red]}%}!! %U%d%u%{${fg[default]}%}"
zstyle ':completion:*:warnings' format "%{${fg[red]}%}!! %Uno match for:  %d%u%{${fg[default]}%}"

# Paginate option list
zstyle ':completion:*' list-prompt "%{${fg[cyan]}%} -- more -- %{${fg[default]}%}"

# Describe options in full
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'

# History completion
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false

# Kill job completion
zstyle ':completion:*:*:kill:*:jobs' list-colors 'no=${color[fg-red]}' '=(#b) #([0-9]#)*=0=01;31'


