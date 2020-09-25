#!/bin/bash
sudo yum update -y
sudo yum install nfs-utils -y
sudo mkdir /kubevol/nfs/kubestorage -p
sudo chown nobody: /kubevol/nfs/kubestorage
sudo chmod 775 /kubevol/nfs/kubestorage
sudo chown nobody: /kubevol/nfs/kubestorage
sudo systemctl enable nfs-server
sudo systemctl start nfs-server
sudo systemctl stop firewalld
sudo systemctl disable firewalld
cat >>/etc/exports<<EOF
/kubevol/nfs/kubestorage *(rw,sync,no_subtree_check,no_root_squash,no_all_squash,insecure)
EOF
systemctl restart nfs-server