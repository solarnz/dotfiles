export VIRTUALENVWRAPPER_PYTHON=`which python2 || which python`
export WORKON_HOME=$HOME/virtual_envs
mkdir -p $WORKON_HOME
source `which virtualenvwrapper.sh`
