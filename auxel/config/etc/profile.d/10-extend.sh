#!/bin/bash
# YUROS BASH_EXTEND PACKAGES
# copyright Al Muhdil Karim <karim@yuros.org>


# Append binary extended paths
append_path '/etc/xdg/bash/binary/'


## XDG ENVIRONMENT
export XDG_CONFIG_HOME="$HOME/.local/config"
export XDG_CACHE_HOME="$HOME/.local/cachie"
export LESSHISTFILE="$HOME/.local/share/less-history"



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


## BASH  LOGOUT
if [ -f "$HOME/.local/bash/logout" ]; then
	. "$HOME/.local/bash/logout"
elif [ -f "/etc/xdg/bash/logout" ]; then
	. "/etc/xdg/bash/logout"
fi