export JUMPPATH=$HOME/.ssh/jumps

function jump_env {
    source $JUMPPATH/$1
}

function _jump_envs {
    reply=($(ls $JUMPPATH))
}
compctl -K _jump_envs jump_env
