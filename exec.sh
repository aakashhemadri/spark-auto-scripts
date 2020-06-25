#!/usr/bin/bash
#
# exec.sh script will remove all old logs.
# Modify the 
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source $DIR/env.sh

#
# Edit this to run required app.
#
APP_CLASS="org.apache.spark.examples.SparkPi"
APP_JAR="$SPARK_HOME/examples/jars/spark-examples_2.11-2.4.5.jar"
APP_ARGS=100

(cd "$DIR" && rm -rf logs/*)

#
# Stops Master & Workers
#
(cd "$SPARK_HOME/sbin/" && \
./stop-master.sh)
(cd "$SPARK_HOME/sbin/" && \
./stop-slaves.sh)

#
# Re-Configures Spark
#
(cd "$DIR" && \
./configure-spark.sh)

#
# Starts Master & Worker instances
# Check https://$SPARK_MASTER_HOST:$SPARK_MASTER_WEBUI_PORT
#
(cd "$SPARK_HOME/sbin/" && \
./start-master.sh --properties-file "$DIR/conf/spark-defaults.conf")
(cd "$SPARK_HOME/sbin/" && \
./start-slave.sh --properties-file "$DIR/conf/spark-defaults.conf" "spark://$SPARK_MASTER_HOST:$SPARK_MASTER_PORT" )

(cd "$SPARK_HOME/bin/" && \
./spark-submit --class $APP_CLASS \
--master "spark://$SPARK_MASTER_HOST:$SPARK_MASTER_PORT" \
"$APP_JAR" "$APP_ARGS" )
