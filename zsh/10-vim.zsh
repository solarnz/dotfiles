# set VIMODE according to the current mode (default “[i]”)
VIMODE='--INSERT--'
function zle-keymap-select {
 VIMODE="${${KEYMAP/vicmd/--NORMAL--}/(main|viins)/--INSERT--}"
 zle reset-prompt
}

zle -N zle-keymap-select

bindkey -v
