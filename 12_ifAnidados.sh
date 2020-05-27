# ! /bin/bash
# Programa para ejemplificar el uso de los if anidados
#Arnoldo Alvarez

notaClase=0
continua=""

echo "Ejemplo del uso de if Anidados"

read -p "Indique cual es su nota (1-9): " notaClase
echo -e "\n"
if [ $notaClase -ge 7 ]; then
    echo "El alumno ha aprobado"
    read -p "Seguira estudiando el proximo nivel? (s/n): " continua
    if [ $continua = "s" ]; then
        echo "Bienvenido al siguiente nivel"
    else
        echo "lamentamos que no sigas con nosotros, mucha suerte"
    fi
else
    echo "El alumno ha sido reprobado"
fi



