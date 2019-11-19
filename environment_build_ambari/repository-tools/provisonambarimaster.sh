echo 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' >> /etc/rc.local
echo 'echo never > /sys/kernel/mm/transparent_hugepage/defrag' >> /etc/rc.local

source /etc/rc.local


cp /repository/repo/ambari.repo /etc/yum.repos.d

yum -y --nogpgcheck localinstall /repository/repo/ambari-server-2.4.0.1-1.x86_64.rpm


 yum -y  --nogpgcheck localinstall /repository/repo/ambari-agent-2.4.0.1-1.x86_64.rpm


mv /etc/ambari-agent/conf/ambari-agent.ini /etc/ambari-agent/conf/ambari-agent.ini.bak
cp /repository/repo/configfiles/ambari-agentmaster.ini /etc/ambari-agent/conf/ambari-agent.ini


ambari-server setup -s

ambari-server start
ambari-agent start


yum -y  install git
yum -y install curl
yum -y install wget

git clone https://github.com/nikunjness/mongo-ambari.git /var/lib/ambari-server/resources/stacks/HDP/2.5/services/MONGODB

git clone https://github.com/DataTorrent/ambari-datatorrent-service.git /var/lib/ambari-server/resources/stacks/HDP/2.5/services/DATATORRENT

#mv /var/lib/ambari-server/resources/stacks/HDP/2.5/services/DATATORRENT/package/scripts/params.py /var/lib/ambari-server/resources/stacks/HDP/2.5/services/DATATORRENT/package/scripts/params.py.bak

#cp  /repository/repo/configfiles/params.py /var/lib/ambari-server/resources/stacks/HDP/2.5/services/DATATORRENT/package/scripts/

cp /repository/repo/datatorrent-rts.repo /etc/yum.repos.d/

ambari-server restart

ambari-agent restart



