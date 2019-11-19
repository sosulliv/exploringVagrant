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

################## install nvm   ####################


yum update
yum -y install git
cd /home/vagrant/
git clone https://github.com/creationix/nvm.git

export NVM_DIR="/home/vagrant/.nvm" && (   git clone https://github.com/creationix/nvm.git "$NVM_DIR";   cd "$NVM_DIR";   git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`; ) && . "$NVM_DIR/nvm.sh"

touch /etc/profile.d/nvm.sh
echo '# set NVM environment variables' >> /etc/profile.d/nvm.sh
echo 'export NVM_DIR="/home/vagrant/.nvm"' >> /etc/profile.d/nvm.sh
echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm' >> /etc/profile.d/nvm.sh


source /etc/profile

nvm install v6.9.1



#ln -s /usr/bin/nodejs /usr/bin/node
#yum install git

#echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> /etc/ssh/ssh_config

################## install slam prereqs  ####################

cp /repository/repo/slamdata.tar.gz /home/vagrant/

tar -xzf /home/vagrant/slamdata.tar.gz 

sudo rm /home/vagrant/slamdata.tar.gz

cd /home/vagrant/slamdata/



bower install --allow-root


npm install --allow-root


npm run build

cd /home/vagrant/slamdata/jars


mv /home/vagrant/slamdata/jars/quasar.jar /home/vagrant/slamdata/jars/quasar.jar.bak

yum -y install wget

cd /home/vagrant/slamdata/jars

wget "https://github.com/quasar-analytics/quasar/releases/download/v13.0.27-quasar-web/quasar-web-assembly-13.0.27.jar"

mv /home/vagrant/slamdata/jars/quasar-web-assembly-13.0.27.jar  /home/vagrant/slamdata/jars/quasar.jar

cd  /home/vagrant/
mkdir .config
cd .config/
mkdir quasar
cd quasar/
cp /repository/repo/configfiles/quasar-config.json /home/vagrant/.config/quasar


sudo chown -R vagrant:vagrant /home/vagrant/

java -jar /home/vagrant/slamdata/jars/quasar.jar --content-path /home/vagrant/slamdata/public

