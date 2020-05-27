# ! /bin/bash
# Programa para ejemplificar como capturar la informacion del usuario: Nombre, Apellido, CI, edad, direccion, numeros telefonicos e email
# validar que direccion ocupe solo 20 digitos, email sea valido y Cedula de 8 digitos.
#Arnoldo Alvarez

cedulaRegex='^[0-9]{08}$'
emailRegex='^.*[@].*[com|es]$'
password=1234
telRegex='^\(?([0-9]{3})\)?([0-9]{3})[.]?([0-9]{4})$' #Solo acepta el formato telefonico (xxx)xxx.xxxx Ej:(706)612.4602
echo "Ingreso de Datos Basicos"


read  -p "Ingresar Nombre: " nombre
echo -e "\n"
read  -p "Ingresar Apellido: " apellido
echo -e "\n"
read -n8 -p "Ingrese Cedula de identidad " ci
echo -e "\n"
read -n2 -p "Ingrese su Edad " edad
echo -e "\n"
read -n20 -p "Ingrese su direccion " direccion
echo -e "\n"
read  -p "Ingrese su numero telefonico (XXX)XXX.XXXX " telefono
echo -e "\n"
read  -p "Ingrese su correo electronico " email

read -s -p "Ingrese la clave para procesar datos:" clave
echo -e "\n"

if [[ $clave =~ $password  ]]; then
echo "La clave es correcta $clave"
echo "Todos los datos han sido ingresados"
echo "Verificando..."
echo "Nombre: $nombre "
echo "Apellido:$apellido"

if [[ $ci =~ $cedulaRegex ]]; then
    echo "Cedula valida: $ci "
else
    echo "Cedula invalida: $ci"
fi

echo "Edad: $edad"
echo "Direccion de residencia: $direccion"
echo "Numero telefonico: $telefono"

if [[ $telefono =~ $telRegex ]]; then
    echo "Telefono valido $telefono"
else
    echo "Incorrecto $telefono"
fi

if [[ $email =~ $emailRegex ]]; then
    echo "Correo electronico valido $email "
else
    echo "Correo electronico invalido $email "
fi

else
    echo "Clave incorrecta"
    echo "Saliendo del Sistema"

fi





