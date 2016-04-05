

sudo apt-get install nfs-common
sudo mkdir -p /mnt/nfs/var/nfs

echo "Enter IP to Mount:"
read ip

sudo mount $ip:/var/nfs /mnt/nfs/var/nfs



df -h


ln -s /mnt/nfs/var/nfs/ cloudStorage
