#!/usr/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/env.sh

rm -rf "$JAVA_HOME" 
rm -rf "$SPARK_HOME"
rm -rf "$DIR/logs"
rm -rf "$DIR/work"
mkdir -p "$SPARK_HOME" "$JAVA_HOME" "$DIR/downloads"

if [[ ! -f "$DIR/downloads/$OPENJDK_VERSION-$OS-$RELEASE.tar.gz" ]]
then
    curl -L "https://api.adoptopenjdk.net/v2/binary/nightly/${OPENJDK_VERSION}?openjdk_impl=${OPENJDK_IMPL}&os=${OS}&arch=${ARCH}&release=${RELEASE}&type=${TYPE}" -o "$DIR/downloads/$OPENJDK_VERSION-$OS-$RELEASE.tar.gz"
fi
tar -C "$JAVA_HOME" --strip-components=1 -xzpf "$DIR/downloads/$OPENJDK_VERSION-$OS-$RELEASE.tar.gz"
chmod -R +x "$JAVA_HOME/bin"
chmod -R +x "$JAVA_HOME/jre/bin"

if [[ ! -f "$DIR/downloads/spark-$SPARK_VERSION-bin-hadoop${HADOOP_VERSION}.tgz" ]]
then
    (cd "$DIR/downloads" && curl -LO "https://archive.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop${HADOOP_VERSION}.tgz")
fi
tar -C "$SPARK_HOME" --strip-components=1 -xzpf "$DIR/downloads/spark-$SPARK_VERSION-bin-hadoop${HADOOP_VERSION}.tgz"
chmod -R +x "$SPARK_HOME/sbin"
chmod -R +x "$SPARK_HOME/bin"

rm -rf "$DIR/downloads"