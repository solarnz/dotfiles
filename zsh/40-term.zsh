# Some terminals (xfce4-terminal) will set their TERM to xterm, however it
# should be xterm-256color. As with xfce4-terminal, if you try to change the
# emulation type to xterm-256color, it doesn't recognise it should just run
# with xterm, but a different TERM environment variable.

case "$TERM" in
       xterm*)
           export TERM=xterm-256color
esac
