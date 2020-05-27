# ! /bin/bash
# Programa para ejemplificar como capturar la informacion del usuario utilizando solo el  comando read
#Arnoldo Alvarez

option=0
backupName=""

echo "Programa de utilidades PostGres"
read -p "Ingresar una Opcion" option
read -p "Ingrese el nombre del archivo para el BackUp" backupName

echo "Opcion:$option , Nombre del Backup: $backupName "



