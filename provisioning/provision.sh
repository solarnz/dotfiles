#!/bin/bash

SALT_DIR=`dirname $0`
STATES_DIR=$SALT_DIR/states
PILLARS_DIR=$SALT_DIR/pillars

salt-call --local state.highstate --file-root=$STATES_DIR --pillar-root=$PILLARS_DIR
