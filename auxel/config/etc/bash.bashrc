#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prevent doublesourcing
if [[ -z "${BASHRCSOURCED}" ]] ; then
  BASHRCSOURCED="Y"
  # the check is bash's default value
  [[ "$PS1" = '\s-\v\$ ' ]] && PS1='[\u@\h \W]\$ '
  case ${TERM} in
    Eterm*|alacritty*|aterm*|foot*|gnome*|konsole*|kterm*|putty*|rxvt*|tmux*|xterm*)
      PROMPT_COMMAND+=('printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"')
      ;;
    screen*)
      PROMPT_COMMAND+=('printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"')
      ;;
  esac
fi

if [[ -r /usr/share/bash-completion/bash_completion ]]; then
  . /usr/share/bash-completion/bash_completion
fi

# enable bash extended source
if test -d /usr/local/bash/; then
        for loader in /usr/local/bash/*.sh; do
                test -r "$loader" && source "$loader"
        done
        unset loader
fi


## BASH EXTENDED
if [ -f "$HOME/.local/bash/extend" ]; then
	. "$HOME/.local/bash/extend"
elif [ -f "/etc/xdg/bash/extend" ]; then
	. "/etc/xdg/bash/extend"
fi


## BASH BASHRC
if [ -f "$HOME/.local/bash/bashrc" ]; then
	. "$HOME/.local/bash/bashrc"
elif [ -f "/etc/xdg/bash/bashrc" ]; then
	. "/etc/xdg/bash/bashrc"
fi


## BASH PROFILE
if [ -f "$HOME/.local/bash/bash_profile" ]; then
	. "$HOME/.local/bash/profile"
elif [ -f "/etc/xdg/bash/profile" ]; then
	. "/etc/xdg/bash/profile"
fi


## BASH LOGOUT
if [ -f "$HOME/.local/bash/logout" ]; then
	. "$HOME/.local/bash/logout"
elif [ -f "/etc/xdg/bash/logout" ]; then
	. "/etc/xdg/bash/logout"
fi


## BASH LIBRARY
if test -d /etc/xdg/bash/library/; then
	for bashlib in /etc/xdg/bash/library/*.sh; do
		test -r "$bashlib" && . "$bashlib"
	done
	unset bashlib
fi


## BASH THEMES
source /etc/xdg/bash/theme/default