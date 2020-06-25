#!/usr/bin/env bash
# Apache Spark - v2.x+/v3.0.0 
# Visit the below site to modify this conf file.
# You may have to update this file across spark versions.
# https://spark.apache.org/docs/latest/spark-standalone.html
# This configures the standalone cluster
# This file is updated & copied into $SPARK_HOME when running configure-spark.sh

# Options for the daemons used in the standalone deploy mode
SPARK_MASTER_HOST=
SPARK_MASTER_PORT=
SPARK_MASTER_WEBUI_PORT=
# SPARK_MASTER_OPTS, to set config properties only for the master (e.g. "-Dx=y")
SPARK_WORKER_CORES=
SPARK_WORKER_MEMORY=
# SPARK_WORKER_PORT=
SPARK_WORKER_WEBUI_PORT=
SPARK_WORKER_DIR=
# SPARK_WORKER_OPTS=
SPARK_DAEMON_MEMORY=
# SPARK_HISTORY_OPTS=
# SPARK_SHUFFLE_OPTS=
# SPARK_DAEMON_JAVA_OPTS=
# SPARK_DAEMON_CLASSPATH=
# SPARK_PUBLIC_DNS=

# Generic options for the daemons used in the standalone deploy mode
SPARK_CONF_DIR=
SPARK_LOG_DIR=
# SPARK_PID_DIR=
# SPARK_IDENT_STRING=
# SPARK_NICENESS=
# SPARK_NO_DAEMONIZE=

# Options for native BLAS, like Intel MKL, OpenBLAS, and so on.
# You might get better performance to enable these options if using native BLAS (see SPARK-21305).
# MKL_NUM_THREADS=
# OPENBLAS_NUM_THREADS=

# Options read when launching programs locally with
# ./bin/run-example or ./bin/spark-submit
# HADOOP_CONF_DIR=
# SPARK_LOCAL_IP=
# SPARK_PUBLIC_DNS=

# Options read by executors and drivers running inside the cluster
# SPARK_LOCAL_IP=
# SPARK_PUBLIC_DNS=
# SPARK_LOCAL_DIRS=
# MESOS_NATIVE_JAVA_LIBRARY=