#!/bin/sh

# following guide: https://gist.github.com/johnjeffers/3006011ec7767a4101cdd118e8d64290

path='/home/hanne/Apps/Git'

# firmware
echo ''
echo '> 1/2 FIRMWARE ...'
echo ''

sudo rm -r $path/facetimehd-firmware
git clone https://github.com/patjak/facetimehd-firmware.git $path/facetimehd-firmware
cd $path/facetimehd-firmware
make
sudo make install

echo ''
echo '> 1/2 FIRMWARE OK'

# driver
echo '> 2/2 DRIVER ...'
echo ''

sudo rm -r $path/bcwc_pcie
git clone https://github.com/patjak/bcwc_pcie.git $path/bcwc_pcie
cd $path/bcwc_pcie
make
sudo make install
sudo depmod
sudo modprobe -r bdc_pci
sudo modprobe facetimehd
echo facetimehd | sudo tee -a /etc/modules > /dev/null

echo ''
echo '> 2/2 DRIVER OK'
echo '> FINISHED'
