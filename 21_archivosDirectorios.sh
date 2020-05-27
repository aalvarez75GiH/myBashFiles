# ! /bin/bash
# Programa para ejemplificar la creacion de archivos y directorios.
#Arnoldo Alvarez

echo "Archivos y Directorios"

if [ $1 = "d" ]; then
    mkdir -m 755 $2
    echo "Directorio $2 creado con exito!"
    ls -la $2
elif [ $1 = "f" ]; then
    touch $2
    echo "Archivo creado Correctamente!"
    ls -la $2
else
    echo "Opcion Incorrecta"

fi
