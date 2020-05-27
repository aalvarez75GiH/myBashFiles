# ! /bin/bash
# Programa para ejemplificar como capturar la informacion del usuario utilizando los comandos echo, read y $REPLY
#Arnoldo Alvarez

option=0
backupName=""

echo "Programa de utilidades PostGres"
echo -n "Ingresar una Opcion"

read
option=$REPLY

echo -n "Ingrese el nombre del archivo para el BackUp"
read
backupName=$REPLY

echo "Opcion:$option , Nombre del Backup: $backupName "



