mkdir -p ./vm-disks
echo "Please Enter a Name for your IMG:"
read name

unit='g'
echo "Please Enter Size of VM in gigabytes:"
read size

qemu-img create -f qcow2 -o preallocation=metadata ./vm-disks/$name.qcow2 $size$unit
