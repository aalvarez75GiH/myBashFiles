# ! /bin/bash
# Programa para ejemplificar como se lee en un archivo mediante un programa bash
#Arnoldo Alvarez

echo "Leer en un Archivo mediante el comando cat"
cat $1

echo -e "\nAlmacenar los valores en una variable"
valorCat=`cat $1`
echo "$valorCat"

#Utilizando la variable IFS (Internal Field Separator)para evitar que los espacios en blanco se recorten
echo -e "\nLeer archivos linea por linea utilizando while"
while IFS= read linea
do
    echo "$linea"
done<$1

