# spark-auto-scripts

This repository aims to download and provision a local and self-contained instance of spark standalone cluster with a one file configuration process.
Ideal for a local development environment.

## Usage & Installation

- Configure all variables by modfiying [env.sh](env.sh).

```bash
# Edit environment variables for configuring the installation process.
$ vi env.sh
```

- Install openjdk & spark by running [bootstrap.sh](bootstrap.sh).

```bash
# Running ./bootstrap.sh to download & configure openjdk & spark in the current directory.
$ ./bootstrap.sh
```

- Modify/Add apache configuration under the [conf](conf/) directory 

```bash
# This directory will be used instead of $SPARK_HOME/conf as the default directory
$ vi spark-defaults.conf slaves log4j.properties fairscheduler.xml
```

- Run [configure-spark.sh](configure-spark.sh) to start a master instance.

```bash
# Programmtically modifies spark-env.sh and runs $SPARK_HOME/bin/start-master.sh
$ ./configure-spark.sh
```

- Modify and run [spark-submit.sh](spark-submit.sh) to send shaded jar to spark-submit

```bash
# Runs by default SparkPi
./spark-submit.sh
```

## Writing custom scripts

- Include this at the beginning of your bash script to run it in this environment
- Make sure you place it at the root of the environment.
  - Modify DIR if placed elsewhere.
  
```bash
#!/usr/bin/bash
# Custom script

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/env.sh
```

## Scripts
- [env.sh](env.sh)
- [bootstrap.sh](bootstrap.sh)
- [configure-spark.sh](configure-spark.sh)
- [exec.sh](exec.sh)

## Contributers

Aakash Hemadri

## License

[MIT](LICENSE.md)