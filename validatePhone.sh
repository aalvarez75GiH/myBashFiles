# ! /bin/bash
# Programa para validar el formato de un numero telefonico
#Arnoldo Alvarez

#telefonoRegex= '^((\([0-9]{3}\))|(\[0-9]{3}\-))[0-9]{3}\-[0-9]{4}$'
telRegex2='[0-9]\[0-9]{2}-\[0-9]{3}-\d{4}$'
telRegex3='^\(?([0-9]{3})\)?[.]?([0-9]{3})[.]?([0-9]{4})$'
telRegex4='^\(?([0-9]{3})\)?([0-9]{3})[.]?([0-9]{4})$' #Solo acepta el formato telefonico (xxx)xxx.xxxx Ej:(706)612.4602

echo "Ingreso de Datos Basicos"

read  -p "Ingrese numero telefonico:  " telefono
phone=$telefono
plainPhone=$(echo $phone | sed "s/-//g")
formatedPhone1=$(echo $phone | sed "s/\(.*\)-\(.*\)-\(.*\)/(\1) \2 - \3/")
formatedPhone2=$(echo $plainPhone | sed "s/\([0-9]\{3\}\)\([0-9]\{3\}\)\([0-9]*\)/(\1) \2 . \3/")

echo $plainPhone
echo $formatedPhone1
echo $formatedPhone2

#------------------------------------------------
#echo -e "\n"

#if [[ $telefono =~ $telRegex4 ]]; then
 #   echo "Telefono valido $telefono"
#else

 #   echo "Incorrecto $telefono"
#fi
#------------------------------------------------



