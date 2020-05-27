# ! /bin/bash
# Programa para ejemplificar el uso de la sentencia de decision if, else, elseif
#Arnoldo Alvarez

notaClase=0
edad=0

echo "Ejemplo del uso de if - else y elseif"

read -p "Indique su edad: " edad
if [ $edad -le 13 ]; then
    echo "Es un nino"
elif [ $edad -gt 13 ] && [ $edad -le 19 ]; then
echo "La persona es adolescente"
elif [ $edad -gt 19 ] && [ $edad -le 64 ]; then
    echo "La persona es adulta"
else
    echo "La persona es un abuelito"
fi



