# ! /bin/bash
# Programa para ejemplificar el uso de la sentencia de decision if, else
#Arnoldo Alvarez

notaClase=0
edad=0

echo "Ejemplo del uso de If - Else"

read -n1 -p  "Indique la nota (1-9): " notaClase
echo -e "\n"

if (($notaClase >= 7  )); then
    echo "El alumno aprueba la materia"
else
    echo "El alumno reprueba la materia"

fi


read -p "Indique su edad: " edad
if [ $edad -le 18 ]; then
echo "La persona no puede emitir su voto"
else
    echo "La persona puede votar"
fi


