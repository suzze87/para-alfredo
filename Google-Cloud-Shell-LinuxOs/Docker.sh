#!/bin/bash
FIGLET=/usr/bin/figlet
CONTAINERS=/var/lib/docker/containers/
if [ -f $FIGLET ]
then
   echo ""
else
sudo apt install figlet -y
fi
figlet -c GitHub.com/
figlet -c HirCoir
sleep 3
 
clear
echo "#####################################################"
echo "#             Google Cloud Shell                    #"
echo "#####################################################"
echo "# 1) Entorno de Escritorio                          #"
echo "# 2) Instalar Portainer (Requiere token Ngrok)      #"
echo "# 3) Instalar Apache Guacamole (Web Client RDP,VNC) #"
echo "# 4) Detiene y Borra todos los Contenedores         #"
echo "# 5) Salir                                           #"
echo "#####################################################"
while true; do
    read -p "" op
    case $op in
        [1]* )
echo "#########################################"
echo "#       Docker  Escritorio              #"
echo "#########################################"
echo "# Elija qué versión de Linux ejecutar   #"
echo "# 1) Ubuntu XFCE                        #"
echo "# 2) Ubuntu KDE                         #"
echo "# 3) Ubuntu Mate                        #"
echo "# 4) Ubuntu Openbox                     #"
echo "# 5) Ubuntu IceWM                       #"
echo "# 6) Salir                              #"
echo "#########################################"
while true; do
    read -p "" op
    case $op in
        [1]* )
if [ -d "$CONTAINERS" ]
then
echo "Contenedores encontrados."
echo "Eliminando contenedores..."
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
else
   echo "Sin contenedores"
fi
docker run -d -p 8080:3000 linuxserver/webtop:ubuntu-xfce
        break;;
        [2]* )
if [ -d "$CONTAINERS" ]
then
echo "Contenedores encontrados."
echo "Eliminando contenedores..."
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
else
   echo "Sin contenedores"
fi
docker run -d -p 8080:3000 linuxserver/webtop:ubuntu-kde
break;;
        [3]* ) 
if [ -d "$CONTAINERS" ]
then
echo "Contenedores encontrados."
echo "Eliminando contenedores..."
stop $(docker ps -a -q)
rm $(docker ps -a -q)
else
   echo "Sin contenedores"
fi
sudo docker run -d -p 8080:3000 linuxserver/webtop:ubuntu-mate
break;;
        [4]* )
if [ -d "$CONTAINERS" ]
then
echo "Contenedores encontrados."
echo "Eliminando contenedores..."
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
else
   echo "Sin contenedores"
fi
sudo docker run -d -p 8080:3000 linuxserver/webtop:ubuntu-openbox
break;;
        [5]* )
if [ -d "$CONTAINERS" ]
then
echo "Contenedores encontrados."
echo "Eliminando contenedores..."
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
else
   echo "Sin contenedores"
fi
docker run -d -p 8080:3000 linuxserver/webtop:ubuntu-icewm
break;;
        [6]* ) exit; break;;        
        * ) exit;;
    esac
done
break;; 
        [2]* )
clear
if [ -d "$CONTAINERS" ]
then
echo "Contenedores encontrados."
echo "Eliminando contenedores..."
sudo docker stop $(docker ps -a -q)
sudo docker rm $(docker ps -a -q)
else
   echo "Sin contenedores"
fi
echo "Instalando Portainer..."
sleep 1
docker volume create portainer_data
docker run -d -p 9000:9000 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
echo "Descargando Ngrok"
ls /home/
rm ngrok-stable-linux-amd64.deb
wget https://raw.githubusercontent.com/HirCoir/Ngrok/main/ngrok-stable-linux-amd64.deb
echo "Format de Token Ngrok: XXXXXXXXXXXXXXXXXXXXXXXXXXX_XXXXXXXXXXXXXXXXXXXXX"
dpkg -i ngrok-stable-linux-amd64.deb
echo "Obtener el token de esta URL: https://dashboard.ngrok.com/get-started/your-authtoken"

read -p "Ingrese solo el token Ngrok: " ngrok_token
echo ""
sleep 5
echo "Copie y pegue el enlace proporcionado por Ngrok y péguelo en su navegador para acceder a Portainer."
echo
echo "No cierre esta ventana porque el túnel se cerrará."
ls /home/
sudo ngrok authtoken $ngrok_token
sudo ngrok http 9000
break;;
[3]* )
if [ -d "$CONTAINERS" ]
then
echo "Contenedores encontrados."
echo "Eliminando contenedores..."
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
else
   echo "Sin contenedores"
fi
docker run -d -p 8080:8080 --name Guacamole -v /config -v /portainer/Files/AppData/Config/Guacamole oznu/guacamole:latest
break;;
[4]* )
if [ -d "$CONTAINERS" ]
then
echo "Contenedores encontrados."
echo "Eliminando contenedores..."
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
else
   echo "Sin contenedores"
fi
break;;
        [5]* ) exit; break;;        
        * ) exit;;
    esac
done
 
