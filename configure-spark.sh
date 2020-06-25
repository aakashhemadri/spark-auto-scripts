#!/usr/bin/bash
# This file may require modification as complexity increases.
# Configure ands start standalone spark cluster.

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )
# DIR=$DIR
source $DIR/env.sh

# Add other files if needed
cp -f "$DIR/conf-template/spark-env.sh" "$SPARK_HOME/conf/"
cp -f "$DIR/conf-template/spark-env.sh" "$DIR/conf/"
cp -f "$DIR/conf-template/log4j.properties.template" "$DIR/conf/log4j.properties"
cp -f "$DIR/conf-template/slaves.template" "$DIR/conf/slaves"

# Convert this this to a sed script file
sed -i "/^SPARK_MASTER_HOST=/ s|$|$SPARK_MASTER_HOST|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^SPARK_MASTER_PORT=/ s|$|$SPARK_MASTER_PORT|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^SPARK_MASTER_WEBUI_PORT=/ s|$|$SPARK_MASTER_WEBUI_PORT|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^SPARK_MASTER_OPTS=/ s|$|$SPARK_MASTER_OPTS|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^SPARK_WORKER_CORES=/ s|$|$SPARK_WORKER_CORES|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^SPARK_WORKER_MEMORY=/ s|$|$SPARK_WORKER_MEMORY|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^SPARK_WORKER_PORT=/ s|$|$SPARK_WORKER_PORT|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^SPARK_WORKER_WEBUI_PORT=/ s|$|$SPARK_WORKER_WEBUI_PORT|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^SPARK_WORKER_DIR=/ s|$|$SPARK_WORKER_DIR|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^SPARK_WORKER_OPTS=/ s|$|$SPARK_WORKER_OPTS|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^SPARK_DAEMON_MEMORY=/ s|$|$SPARK_DAEMON_MEMORY|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^SPARK_HISTORY_OPTS=/ s|$|$SPARK_HISTORY_OPTS|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^SPARK_SHUFFLE_OPTS=/ s|$|$SPARK_SHUFFLE_OPTS|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^SPARK_DAEMON_JAVA_OPTS=/ s|$|$SPARK_DAEMON_JAVA_OPTS|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^SPARK_DAEMON_CLASSPATH=/ s|$|$SPARK_DAEMON_CLASSPATH|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^SPARK_PUBLIC_DNS=/ s|$|$SPARK_PUBLIC_DNS|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^SPARK_CONF_DIR=/ s|$|$SPARK_CONF_DIR|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^SPARK_LOG_DIR=/ s|$|$SPARK_LOG_DIR|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^SPARK_PID_DIR=/ s|$|$SPARK_PID_DIR|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^SPARK_IDENT_STRING=/ s|$|$SPARK_IDENT_STRING|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^SPARK_NICENESS=/ s|$|$SPARK_NICENESS|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^SPARK_NO_DAEMONIZE=/ s|$|$SPARK_NO_DAEMONIZE|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^MKL_NUM_THREADS=/ s|$|$MKL_NUM_THREADS|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^OPENBLAS_NUM_THREADS=/ s|$|$OPENBLAS_NUM_THREADS|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^HADOOP_CONF_DIR=/ s|$|$HADOOP_CONF_DIR|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^SPARK_LOCAL_IP=/ s|$|$SPARK_LOCAL_IP|" "$SPARK_HOME/conf/spark-env.sh"
sed -i "/^SPARK_PUBLIC_DNS=/ s|$|$SPARK_PUBLIC_DNS|" "$SPARK_HOME/conf/spark-env.sh"

cp -f "$DIR/conf-template/spark-defaults.conf.template" "$DIR/conf/spark-defaults.conf"
sed -i "s|\$SPARK_MASTER_HOST|$SPARK_MASTER_HOST|g" "$DIR/conf/spark-defaults.conf"
sed -i "s|\$SPARK_MASTER_PORT|$SPARK_MASTER_PORT|g" "$DIR/conf/spark-defaults.conf"
sed -i "s|\$SPARK_LOG_DIR|$SPARK_LOG_DIR|g" "$DIR/conf/spark-defaults.conf"

mkdir -p "$DIR/logs" "$DIR/work"
PROPERTIES_FILE="$DIR/conf/spark-default.conf"


