export AWSPATH=$HOME/.aws

function aws {
    source $AWSPATH/$1
}

function _aws_envs {
    reply=($(ls $AWSPATH))
}
compctl -K _aws_envs aws
