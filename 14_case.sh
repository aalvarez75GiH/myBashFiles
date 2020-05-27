# ! /bin/bash
# Programa para ejemplificar el uso de la sentencia Case
#Arnoldo Alvarez

opcion=""

echo "Ejemplo del uso de Case"
echo -e "\n"
read -p "Introduzca una letra en el rango A-Z: " opcion

case $opcion in
    "A") echo -e "\nOperacion Guardar archivo";;
    "B") echo "Operacion Eliminar archivo";;
    [C-E]) echo "No esta implementada esta parte del Programa";;
    *) echo "Error en la Operacion";;
esac




