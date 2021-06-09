export ANSICON=yes
export PAGER=less
export LESS="-iMSx4 -RSFX -e"

alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'
alias cidist='git commit --allow-empty -m "ci-dist"'
alias composer='php /c/dev/php-composer/composer.phar'
alias gui='git gui&'
alias gitk='gitk --all &'
alias cf='rm -rf temp/cache'
alias adbrestart='adb kill-server && adb start-server'
alias a='cd /d/storage/kiwi/android'
alias resetanim='adb shell settings put global window_animation_scale 1.0 && adb shell settings put global transition_animation_scale 1.0 && adb shell settings put global animator_duration_scale 1.0'
alias slowanim='adb shell settings put global window_animation_scale 10.0 && adb shell settings put global transition_animation_scale 10.0 && adb shell settings put global animator_duration_scale 10.0'
alias firebasedebug='adb shell setprop debug.firebase.analytics.app com.skypicker.main.debug'

GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
source $COMPLETION_PATH/git-prompt.sh
source $COMPLETION_PATH/git-completion.bash

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (\[\033[32m\]%s\[\033[00m\])") \[\033[33m\]\$\[\033[00m\] '

export SSH_AUTH_SOCK=/tmp/.ssh-socket
ssh-add -l > /dev/null
if [ $? = 2 ]; then
	rm -f $SSH_AUTH_SOCK
	echo Starting new ssh-agent...
	eval $(ssh-agent -a $SSH_AUTH_SOCK) > /dev/null
	ssh-add ~/.ssh/id_rsa && echo "ssh-agent set up successfully with the following keys:" && ssh-add -l
fi
