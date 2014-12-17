export AWSPATH=$HOME/.aws

function aws_env {
    source $AWSPATH/$1
}

function _aws_envs {
    reply=($(ls $AWSPATH))
}
compctl -K _aws_envs aws_env
