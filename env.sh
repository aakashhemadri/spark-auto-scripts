#!/usr/bin/env bash
# Spark & other env vars are defined here.
# This project is aimed at being self contained.
# Configure these vars before running any script.
set -euo pipefail
export IFS='/t/n'

#
# Spark ENV
#
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )
export DEVELOPMENT=1
export SPARK_VERSION=2.4.5
export SCALA_VERSION=2.12
export HADOOP_VERSION=2.7
export SPARK_HOME=$DIR/apache-spark

#
# Java ENV
#

export JAVA_HOME=$DIR/java

#
# OPENJDK API
#

# https://adoptopenjdk.net/
# https://api.adoptopenjdk.net/README
OPENJDK_VERSION=openjdk8
OPENJDK_IMPL=hotspot
OS=linux
ARCH=x64
TYPE=jdk
RELEASE=latest
HEAP_SIZE=normal

#
# spark-env.sh/spark-submit overrides
# -----------------
# Make sure you uncomment conf/spark-env.sh when
# done here.
# All variables must have a value, if uncommented in sparl-env

# Options for the daemons used in the standalone deploy mode
SPARK_MASTER_HOST=localhost
SPARK_MASTER_PORT=17077
SPARK_MASTER_WEBUI_PORT=18080
SPARK_MASTER_OPTS=
SPARK_WORKER_CORES=4
SPARK_WORKER_MEMORY=2g
SPARK_WORKER_PORT=
SPARK_WORKER_WEBUI_PORT=18081
SPARK_WORKER_DIR=$DIR/work
SPARK_WORKER_OPTS=
SPARK_DAEMON_MEMORY=1g
SPARK_HISTORY_OPTS=
SPARK_SHUFFLE_OPTS=
SPARK_DAEMON_JAVA_OPTS=
SPARK_DAEMON_CLASSPATH=
SPARK_PUBLIC_DNS=

# Generic options for the daemons used in the standalone deploy mode
SPARK_CONF_DIR=$DIR/conf
SPARK_LOG_DIR=$DIR/logs
SPARK_PID_DIR=
SPARK_IDENT_STRING=
SPARK_NICENESS=
SPARK_NO_DAEMONIZE=

# Options for native BLAS, like Intel MKL, OpenBLAS, and so on.
# You might get better performance to enable these options if using native BLAS (see SPARK-21305).
MKL_NUM_THREADS=
OPENBLAS_NUM_THREADS=

# Options read when launching programs locally with
# ./bin/run-example or ./bin/spark-submit
HADOOP_CONF_DIR=
SPARK_LOCAL_IP=localhost
SPARK_PUBLIC_DNS=