#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias sync_everything='yaourt -Syua --noconfirm'

PS1='[\u@\h \W]\$ '

export LD_LIBRARY_PATH=/home/mittald/Libraries/ACML/gfortran64_mp_int64/lib

alias 'bashrcdoesntneedsudodumbasses'='echo duh'
