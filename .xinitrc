xset r rate 250 60
eval $(gpg-agent --daemon --enable-ssh-support)
i3
kill $(echo $GPG_AGENT_INFO | cut -d: -f2)
