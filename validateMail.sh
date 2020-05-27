# ! /bin/bash
# Priograma para ejemplificar como capturar la info del usuario y validarla utiliuzando expresiones regulares
# Arnoldo Alvarez

identificacionRegex='^[0-9]{10}$'
paisRegex='^VE|US|CL$'
fechaNacRegex='^19|20 [0-8]{2}[1-12][1-31]$'
regex="^[a-z0-9!#\$%&'*+/=?^_\`{|}~-]+(\.[a-z0-9!#$%&'*+/=?^_\`{|}~-]+)*@([a-z0-9]([a-z0-9-]*[a-z0-9])?\.)+[a-z0-9]([a-z0-9-]*[a-z0-9])?\$"

#i="test@terra.es"
read -p "Introduzca correo electronico:  " email
if [[ $email =~ $regex ]] ; then
    echo "OK"
else
    echo "not OK"
fi



