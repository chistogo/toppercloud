clear
echo "Domains(VM NAME):"
read vmname

echo "Ram Size in MB:"
read memsize

echo "Number of vCPUs:"
read cpunum

mkdir -p ./iso
echo "Name of ISO(inlude extention):"
read isoname

echo "Disk name(inlude extention):"
read diskname

virt-install -n $vmname -r $memsize --vcpus=$cpunum --accelerate --nographics -v -l ./isos/$isoname --disk path=./vm-disks/$diskname -x "console=ttyS0"

curl -X POST --data-urlencode 'payload={"text": "New VM! $vmname", "icon_emoji": ":ghost:"}' https://hooks.slack.com/services/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
