# ! /bin/bash
# Programa para ejemplificar el uso de expresiones condicionales
#Arnoldo Alvarez


edad=0
pais=""
pathArchivo=""

read -p "Ingrese su edad: " edad
read -p "Ingrese su nacionalidad: " pais
read -p "Ingrese el path de su archivo: " pathArchivo

echo -e "\n Expresiones condicionales con numeros"
if [ $edad -lt 10 ]; then
    echo "La persona es un nino o nina "
elif [ $edad -ge 10 ] && [ $edad -le 17 ]; then
    echo "la persona es un adolescente"
else
    echo "La persona es mayor de edad"
fi


echo -e "\n Expresiones condicionales con cadenas"
if [ $pais = "EEUU" ]; then
    echo "La persona es Americana"
elif [ $pais = "Colombia" ] || [ $pais =  "Venezuela" ]; then
    echo "la persona es de un pais de Suramerica"
else
    echo "Se desconoce la nacionalidad"
fi

echo -e "\n Expresiones condicionales con archivos"
if [ -d $pathArchivo   ]; then
    echo "El directorio $pathArchivo  Existe"
else
    echo "El directorio $pathArchivo  No Existe"
fi

