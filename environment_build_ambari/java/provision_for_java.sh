#!/bin/bash
################## install oracle jdk1.8   ####################

yum localinstall -y /repository/oracle-java-sdk-jdk/jdk-8u111-linux-x64.rpm

# configure it on the system using the alternatives command. This is in order to tell the system what are the default commands for JAVA
alternatives --install /usr/bin/java java /usr/java/jdk1.8.0_111/jre/bin/java 20000
alternatives --install /usr/bin/javac javac /usr/java/jdk1.8.0_111/bin/javac 20000
alternatives --set java /usr/java/jdk1.8.0_111/jre/bin/java
alternatives --set javac /usr/java/jdk1.8.0_111/bin/javac

# list version
ls -lA /etc/alternatives/ | grep java
java -version
javac -version

touch /etc/profile.d/java.sh
echo '# set JAVAHOME' >> /etc/profile.d/java.sh
echo 'export JAVA_HOME=/usr/java/jdk1.8.0_111' >> /etc/profile.d/java.sh
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /etc/profile.d/java.sh
source /etc/profile
