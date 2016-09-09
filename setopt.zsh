## ---
## History settings

HISTFILE=~/.zsh.d/zsh_history
SAVEHIST=99999
HISTSIZE=99999

export HISTFILE HISTSIZE SAVEHIST

setopt INC_APPEND_HISTORY           # Append commands as they are run, not when the shell exits
setopt HIST_IGNORE_ALL_DUPS         # Ignore duplicates
setopt HIST_SAVE_NO_DUPS            # Do not save duplicates
setopt HIST_FIND_NO_DUPS            # Do not display duplicates in history
setopt HIST_REDUCE_BLANKS           # Remove blanks

## ---
## Changing Directory

setopt  AUTO_CD                     # Enable auto cd
setopt  NO_CDABLE_VARS              # Do not complete cd with usernames
setopt  NO_AUTO_PUSHD               # Do not push to dir stack automatically
setopt  NO_CHASE_DOTS
setopt  NO_CHASE_LINKS
setopt  PUSHD_IGNORE_DUPS
setopt  PUSHD_TO_HOME

## ---
## Expansion and globbing

setopt BAD_PATTERN
setopt NOMATCH
setopt EXTENDED_GLOB
setopt NO_CSH_NULL_GLOB

## ---
## Input/output

setopt NO_CORRECT
setopt NO_RM_STAR_SILENT

## ---
## Job control

setopt BG_NICE
setopt NOTIFY
setopt HUP

## ---
## Script and funcions

setopt MULTIOS

## ---
## Completion related options

setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END
setopt LIST_TYPES
setopt LIST_PACKED
setopt LIST_ROWS_FIRST

