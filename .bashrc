# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# remove terminal sctroll lock (legacy feature)
stty -ixon

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# Custom bash prompt
if [ "$color_prompt" = yes ]; then
		PS1="\[$(tput bold)\]\[\033[01;38;5;12m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[01;38;5;10m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[01;38;5;11m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Custom functions
bin_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Alias definitions from .bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Various aliases
# I'm insecure
alias neofetch='neofetch --cpu_speed off'
# Gives a neat weather report in the terminal
alias wttr='curl wttr.in'
# Initiate Python venv
alias pyvenv='source ./.venv/bin/activate'
# Quickly search requirements.txt
alias pygrep='cat requirements.txt | grep'
# Lazy upgrading
alias aptupgrade='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean'
# I got tired of remembering past commands
alias hgrep='cat ~/.bash_history | grep'
# Add an "alert" alias for long running commands. Usage: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Networking testing aliases
alias lup='ping 192.168.1.1 -c 3' # Am I even on my network?
alias dup='ping google.com -c 3' # Is DNS working?
alias up='ping 8.8.8.8 -c 3' # Can I make outbound connections?

# Cleaning
alias clean_journal='sudo journalctl --vacuum-size=500M'

# Tar shortcuts
alias tarball='tar -czvf'
alias untar='tar -xzvf'

# Command upgrades, if the host machine has them
# Prefer exa, fallback to ls
if bin_exists exa; then
    alias ls='exa --color=auto'
    alias ll='exa -l'
    alias la='exa --all'
    # Do tree too
    alias tree='exa -T'
else
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
fi

# Prefer duf over df
if bin_exists duf; then
    alias df='duf'
fi

# Prefer tldr over man
if bin_exists tldr; then
    alias man='tldr'
fi

# Prefer bat ove cat
if bin_exists bat; then
    alias cat='bat'
fi

# Add new things to path, notably custom binaries
export PATH="$PATH:~/flutter/flutter/bin"
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
export PATH="$PATH:~/bin"

# Tmux autostart
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Fun!
fortune | cowsay
