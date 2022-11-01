# MANET-bike
Script del tema de tesis

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
  - Wireless LAN: Country EC/SSID Nombre de la red/Passphrase Clave de la red
  - Boot / Auto Login: Console Autologin
  
- Interface options: SSH

- Localisation Options
  - Locale: es_EC.UTF-8 UTF-8
  - Timezone: America/Guayaquil
  - Keyboard: Generic 105-key PC (intl.)/Other/Spanish (Latin American)/The default for the keyboard layout/No compose key

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

4. DOS2UNIX
```
sudo apt-get install dos2unix -y
```

## Configuración del nodo OLSR

1. Instalación del demonio
```
sudo apt-get install olsrd -y
```

2. Uso del repositorio
```
git clone https://github.com/josandotavalo/MANET-bike.git
sudo cp ./MANET-bike/Script\ olsr/olsrd.conf /etc/olsrd/olsrd.conf
sudo dos2unix ./MANET-bike/Script\ olsr/olsr_nodo1.sh
sudo chmod +x ./MANET-bike/Script\ olsr/olsr_nodo1.sh
```
