# ! /bin/bash
# Programa para ejemplificar como se escribe en un archivo mediante un programa bash
#Arnoldo Alvarez

echo "Escribir en un Archivo mediante Bash App"

echo "Escrito con echo" >> $1

cat <<EOM >>$1
$2
EOM
