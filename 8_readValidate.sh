# ! /bin/bash
# Programa para ejemplificar como capturar la informacion del usuario y validarla. Tambien estamos probando la captura silenciosa
#de datos con el comando 'read -s -p'
#Arnoldo Alvarez

option=0
backupName=""
clave=""

echo "Programa de utilidades PostGres"
#Acepta el ingreso de informacion de un solo caracter
read -n1 -p "Ingresar una Opcion: " option
echo -e "\n"
read -n10 -p "Ingrese el nombre del archivo para el BackUp: " backupName
echo -e "\n"
echo "Opcion:$option , Nombre del Backup: $backupName "
read -s -p "Ingrese la clave:" clave
echo -e "\n"
echo  "La clave fue la siguiente: " $clave


