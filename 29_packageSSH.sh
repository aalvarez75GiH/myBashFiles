# ! /bin/bash
# Programa para ejemplificar la forma de como transferir informacion utilizando el comando rsync y utilizando las opciones de
#empaquetamiento para optimizar la velocidad de transferencia.
#Arnoldo Alvarez
host=""
usuario=""


echo "Empaquetar todos los Scripts ubicados en /shellCourse y transferirlos por la red a otro equipo con rsync"
read -p "Ingrese el nombre del Host: " host
read -p "Ingrese el nombre de Usuario " usuario
echo -e "\n En este momento se procedera a empaquetar la carpeta y transferirla segun Datos ingresados"
rsync -avz $(pwd) $usuario@$host:/$HOME/pruebared/
