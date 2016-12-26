set viminfo='10,\"9900,:20,%,n~/.nviminfo

for s:script_name in split(globpath('$HOME/.vim/', '*.vim'))
    exec ":source " . s:script_name
endfor
