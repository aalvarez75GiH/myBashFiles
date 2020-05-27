# ! /bin/bash
# Priograma para ejemplificar como capturar la info del usuario y validarla utiliuzando expresiones regulares
# Arnoldo Alvarez

identificacionRegex='^[0-9]{10}$'
paisRegex='^VE|US|CL$'
fechaNacRegex='^19|20 [0-8]{2}[1-12][1-31]$'
regex="^[a-z0-9!#\$%&'*+/=?^_\`{|}~-]+(\.[a-z0-9!#$%&'*+/=?^_\`{|}~-]+)*@([a-z0-9]([a-z0-9-]*[a-z0-9])?\.)+[a-z0-9]([a-z0-9-]*[a-z0-9])?\$"

i="test@terra.es"
if [[ $i =~ $regex ]] ; then
    echo "OK"
else
    echo "not OK"
fi

echo "Expresiones Regulares"
read -p "Introduzca una identificacion:" identificacion
read -p "Introduzca las iniciales de un pais [VE,US,CL]:" pais
read -p "Ingresar la fecha de nacimiento[yyyMMdd]:" fechaNacimiento



if [[ $identificacion =~ $identificacionRegex ]]; then
    echo "Identificacion $identificacion valida!"
else
    echo "Identificacion $identificacion invalida!!"

fi

if [[ $pais =~ $paisRegex ]]; then
     echo "Pais $pais valido!"
 else
     echo "Pais $pais invalido!!"
fi


if [[ $fechaNacimiento =~ $fechaNacRegex ]]; then
     echo "Fecha de nacimiento $fechaNacimiento valida!"
 else
     echo "Fecha de nacimiento $fechaNacimiento invalida!!"
fi


