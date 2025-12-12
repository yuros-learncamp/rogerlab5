#!/bin/bash
# YUROS BASH_EXTEND PACKAGES
# copyright Al Muhdil Karim <karim@yuros.org>


# Append binary extended paths
append_path '/etc/xdg/bash/binary/'


## XDG ENVIRONMENT
export XDG_CONFIG_HOME="$HOME/.local/config"
export XDG_CACHE_HOME="$HOME/.local/cachie"
export LESSHISTFILE="$HOME/.local/share/less-history"