#!/bin/bash
echo "Procesor:"
cat /proc/cpuinfo | grep "model name" | sed -n 1p
echo
echo "Liczba rdzeni:"
cat /proc/cpuinfo | grep "model name" | wc -l
echo
echo "Model dysku:"
smartctl -a /dev/sda | grep "Device Model"
echo
echo "Rozmiar dysku:"
smartctl -a /dev/sda | grep "User Capacity:" | awk '{printf "%s %s", $5, $6}'
echo
echo
echo "Numer seryjny dysku:"
smartctl -a /dev/sda | grep "Serial Number"
echo
echo "Model i producent karty sieciowej:"
lspci | grep "Ethernet"
echo
echo "Adresy MAC:"
ip a | grep "link/ether" | awk '{print $2}'
echo
echo "Pamięć RAM (w MB):"
free -m | grep "Pamięć:" | awk '{print $2}'
echo
echo "Pamięć wirtualna (w MB)"
free -m | grep "Wymiana" | awk '{print $2}'
echo
echo "Producent płyty głównej"
dmidecode -t baseboard | grep "Manufacturer"
echo
echo "Model płyty głównej"
dmidecode -t baseboard | grep "Product Name"
echo
echo "Karty graficzne"
lspci | grep -i "VGA"
lspci | grep -i "3D controller: NVIDIA"
lspci | grep -i "3D controller: AMD"
