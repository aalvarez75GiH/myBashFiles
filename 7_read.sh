# ! /bin/bash
# Programa para ejemplificar como capturar la informacion del usuario utilizando solo el  comando read
#Arnoldo Alvarez

option=0
backupName=""

echo "Este mensaje se ha creado solo para probar ssh y GitHub"
echo "Programa de utilidades PostGres"
read -p "Ingresar una Opcion" option
read -p "Ingrese el nombre del archivo para el BackUp" backupName

echo "Opcion:$option , Nombre del Backup: $backupName "



