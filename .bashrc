#
# ~/.bashrc
#

# If not running interactively, don't do anything
if [[ $- != *i* ]]; then
  return
fi

# Load history settings
if test -f "~/.config/history_config.sh"; then
  source ~/.config/history_config.sh
fi

# Minor typos are corrected in cd
shopt -s cdspell

# Set vim as default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Nano settings
# -A smart home button
# -E convert tabs to spaces
# -J 80 vertical strip at 80 char
# -M remove trialing whitespaces
# -P remember positoin in file
# -S wrap long lines
# -T 2 set tabsize to 2
# -Z Backspace and Delete remove selected region
# -a wrap at whitespace
# -b hard-wrap current line
# -c always show cursor pos
# -e adds line under title
# -i autoindent
# -j half screen scrolling
# -l linenumbers
# -m enable mouse interactions
alias nano='nano -AEMPSZabceijlm -J 80 -T 2'

# ls human readable colorized output
alias ls='ls -h --color=auto --group-directories-first'

# Detailed long listing with ls
alias ll='ls -lah'
alias la='ll'

# Less settings
# -e exit on second eof
# -F quit if file fits on screen
# -g highlite search results
# -i ignore case
# -K ^C closes less
# -M verbose prompt
# -Q termial bell is siletn
# -r display raw control characters
# -w after scrolling highlite first new line
# -X no unneded screen clears
# --mouse enable mouse
# --wheel-lines=4 sets scrolling speed
LESS="-eFgiKMQrwX --mouse --wheel-lines=4"; export LESS

# Colorize the grep output
alias grep='grep --color=auto'

# Colorize the diff output
alias diff='diff --color=auto'

# mv flags
# -i interactive: prompt before overwrite
alias mv='mv -i'

# Expand aliases when using sudo
alias sudo='sudo '

# Rerun previous line with sudo
alias please='sudo $(history -p !!)'
alias pls='please'

# Powerline setup
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

# fzf setup
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m'
fi

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dots='dotfiles'
