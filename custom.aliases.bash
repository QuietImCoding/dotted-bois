# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="$HOME/bin:/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
EDITOR="emacs"
# alias ssh="~/color.sh"
#alias myip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
bash ~/clnotif.sh
alias ls="ls -G"
alias coding="cd ~/Documents/Coding"
alias glitch="python ~/glitch/glitchr.py"
source $BASH_IT/aliases/ssh_aliases.bash
alias mcc='gcc -ggdb -std=c99 -Wall -Wextra -pedantic'
alias bettercap="~/Downloads/bettercap/bettercap"
alias bserve="bundle exec jekyll serve"
alias confshell="emacs $BASH_IT/lib/custom.bash $BASH_IT/aliases/custom.aliases.bash"
# alias fg="fg 2>/dev/null|| emacs"
export PATH
export EDITOR
