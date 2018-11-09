#!/bin/bash
PROJECT_ROOT=`pwd`

cd /tmp

echo '*************************************************************'
echo 'Install Packer'
echo '*************************************************************'
# Install packer
sudo rm -f packer_*.zip
sudo rm -f packer
sudo rm -f /usr/local/bin/packer
sudo wget https://releases.hashicorp.com/packer/1.3.1/packer_1.3.1_linux_386.zip
sudo unzip packer_*.zip

ls -la

sudo mv packer /usr/local/bin/
sudo rm -f packer_*.zip

#echo 'Packer ver:'
#packer -v



cd $PROJECT_ROOT

# Run TESTS
echo '**** RUN TESTS ****'

packer validate -var-file=packer/variables.json.example packer/app.json
packer validate -var-file=packer/variables.json.example packer/db.json
packer validate -var-file=packer/variables.json.example packer/immutable.json
packer validate -var-file=packer/variables.json.example packer/ubuntu16.json



