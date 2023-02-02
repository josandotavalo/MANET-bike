# MANET-bike
Configuraciones de los nodos de la red

## Instalación y configuración del OS
1. Descargar la imagen de [Raspberry Pi OS Lite (Legacy)](https://www.raspberrypi.com/software/operating-systems/) desde la página oficial

2. Instalar este rapbian en la tarjeta Micro SD mediante el [Raspberry Pi Imager](https://www.raspberrypi.com/software/)

3. Usuario: pi / Contraseña: raspberry

4. Para cambiar la fuente de la terminal
```
sudo dpkg-reconfigure console-setup
```
- Encoding: UTF-8
- Guess optional character set
- Font for the console: Terminus
- Font size: 12x24

5. Para configurar la raspberry
```
sudo raspi-config
```

- System Options
  - Wireless LAN: Country EC / SSID Nombre de la red / Passphrase Clave de la red
  - Boot / Auto Login: Console Autologin
  
- Interface options: SSH

- Localisation Options
  - Locale: es_EC.UTF-8 UTF-8
  - Timezone: America / Guayaquil
  - Keyboard: Generic 105-key PC (intl.) / Other / Spanish (Latin American) / The default for the keyboard layout / No compose key

- Advanced Options
  - Expand Filesystem

## Instalación de paquetes necesarios
1. Actualización
```
sudo apt-get update -y && sudo apt-get upgrade -y
```

2. TCPDUMP
```
sudo apt-get install tcpdump -y
```

3. GIT
```
sudo apt-get install git -y
```

4. Clonación del repositorio propio
```
git clone https://github.com/josandotavalo/MANET-bike.git
```

5. PIP - PYBLUEZ
```
sudo apt-get install python3-pip -y
sudo pip3 install pybluez
```

6. FFMPEG
```
sudo apt-get install ffmpeg -y
```

7. IPERF3
```
sudo apt-get install iperf3 -y
```

8. NTP
```
sudo apt-get install ntp
```

## Configuración Bluetooth
1. Modificar el archivo
```
/etc/systemd/system/dbus-org.bluez.service
```
con la siguiente línea
```
ExecStart=/usr/lib/bluetooth/bluetoothd -C
```
2. Añadir el Serial Port Profile con el comando:
```
sudo sdptool add SP
sudo systemctl restart bluetooth
```

## Configuración del nodo OLSR
1. Instalación del protocolo
```
sudo apt-get install olsrd -y
sudo apt-get install --reinstall bison libbison-dev flex libfl-dev
cd ~/olsrd-0.6.8
make clean
make
sudo make install
```

2. Uso del repositorio
```
sudo cp /etc/olsrd/olsrd.conf /etc/olsrd/olsrd.conf.copia
sudo cp MANET-bike/olsr_scripts/olsrd.conf /etc/olsrd/olsrd.conf
sudo chmod +x MANET-bike/olsr_scripts/olsr_server.sh 
```

## Configuración del nodo BATMAN
1. Instalación del protocolo
```
sudo apt install libnl-3-dev libnl-genl-3-dev
git clone https://git.open-mesh.org/batctl.git
cd batctl
sudo make install
```

2. Ensure the batman-adv kernel module is loaded at boot time by issuing the following command :
```
echo 'batman-adv' | sudo tee --append /etc/modules
```

3. Stop the DHCP process from trying to manage the wireless lan interface by issuing the following command :
```
echo 'denyinterfaces wlan0' | sudo tee --append /etc/dhcpcd.conf
```

4. Permisos de ejecución
```
sudo chmod +x MANET-bike/batman_scripts/batman_server.sh 
```

5. Ejecutar el script al bootear la RPi, para esto se debe añadir la ruta 
```/home/pi/MANET-bike/batman_scripts/batman_server.sh & ```
a la ruta /etc/rc.local

## Configuración del nodo Servidor
1. Copiar el archivo dhcpcd.conf en la dirección /etc
```
sudo cp /etc/dhcpcd.conf /etc/dhcpcd.conf.copia
sudo cp MANET-bike/dhcpcd.conf /etc/dhcpcd.conf 
```
## Restablecer WiFi
1. Para salir del modo ad-hoc
```
sudo systemctl start dhcpcd 
```
