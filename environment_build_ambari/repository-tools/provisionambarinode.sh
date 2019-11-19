cp /repository/repo/ambari.repo /etc/yum.repos.d

yum -y  --nogpgcheck localinstall /repository/repo/ambari-agent-2.4.0.1-1.x86_64.rpm

echo yes | cp /repository/repo/configfiles/ambari-agentmaster.ini /etc/ambari-agent/conf/ambari-agent.ini

ambari-agent start

