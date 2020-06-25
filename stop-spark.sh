#!/usr/bin/bash
#
# exec.sh script will remove all old logs.
# Modify the 
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source $DIR/env.sh

#
# Stops Master & Workers
#
(cd "$SPARK_HOME/sbin/" && \
./stop-master.sh)
(cd "$SPARK_HOME/sbin/" && \
./stop-slaves.sh)