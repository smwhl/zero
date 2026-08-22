#!/bin/sh
set -e
PRG="$0"
while [ -h "$PRG" ]; do ls=$(ls -ld "$PRG"); link=$(expr "$ls" : '.*-> \(.*\)$'); if expr "$link" : '/.*' > /dev/null; then PRG="$link"; else PRG=$(dirname "$PRG")/"$link"; fi; done
PRGDIR=$(dirname "$PRG")
if [ -n "$JAVA_HOME" ] && [ -x "$JAVA_HOME/bin/java" ]; then JAVACMD="$JAVA_HOME/bin/java"; elif command -v java >/dev/null 2>&1; then JAVACMD=$(command -v java); else echo "ERROR: Java not found"; exit 1; fi
if [ -f "$PRGDIR/gradle/wrapper/gradle-wrapper.jar" ]; then exec "$JAVACMD" -classpath "$PRGDIR/gradle/wrapper/gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain "$@"; else if command -v gradle >/dev/null 2>&1; then exec gradle "$@"; else echo "ERROR: No gradle"; exit 1; fi; fi
