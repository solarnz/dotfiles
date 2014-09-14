export VIRTUALENVWRAPPER_PYTHON=`which python2 || which python`
export WORKON_HOME=$HOME/virtual_envs

if [[ ! -e "$WORKON_HOME" ]]; then
    $VIRTUALENVWRAPPER_PYTHON -m pip install --user virtualenvwrapper
    mkdir -p $WORKON_HOME
fi

source `which virtualenvwrapper.sh`
