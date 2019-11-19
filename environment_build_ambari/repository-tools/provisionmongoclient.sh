sudo yum -y install unzip

curl https://install.meteor.com/ | sh

sudo yum -y install wget

cd /home/vagrant/

wget "https://github.com/rsercano/mongoclient/archive/master.zip"

unzip /home/vagrant/master.zip 

sudo rm /home/vagrant/master.zip 

cd mongoclient-master/

meteor npm install

touch /etc/profile.d/mongoclient.sh

echo '# set MongoClient environment variables' >> /etc/profile.d/mongoclient.sh 


echo 'export ROOT_URL=http://buildtemplatereport:3000/mongoclient' >> /etc/profile.d/mongoclient.sh


#echo 'export MONGOCLIENT_AUTH=true' >> /etc/profile.d/mongoclient.sh

#echo 'MONGOCLIENT_USERNAME=admin' >> /etc/profile.d/mongoclient.sh
#echo 'MONGOCLIENT_PASSWORD=admin' >> /etc/profile.d/mongoclient.sh

source /etc/profile


mongo --username admin --password admin --host buildtemplatemanager 


mongo mongodb://admin:admin@buildtemplatemanager.internal:27017/admin




