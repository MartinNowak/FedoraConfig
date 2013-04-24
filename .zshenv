export GPG_TTY=$(tty)
if [ -d ${HOME}/.local/bin ]; then
    PATH=${HOME}/.local/bin:${PATH}
fi
export EDITOR=emacsclient
sudo() { su -c "$*" }
