# ! /bin/bash
# Programa para ejemplificar el uso de for loop
#Arnoldo Alvarez

arregloNumeros=(1 2 3 4 5 6)
#arregloCadenas=(Arnoldo, Kris, Carlos, Julio)
#arregloRangos=({A..Z} {10..20})

echo "Iterar en la lista de Numeros"
for num in ${arregloNumeros[*]}
do
    echo "Numeros: $num "
done


echo "Iterar en una lista de Cadenas"
for nom in "Arnoldo" "Kris" "Carlos" "Julio"
do
    echo "Nombres: $nom "
done

echo "Iterar en Archivos"
for file in *
do
    echo "Nombre Archivo: $file "
done

echo "Iterar utilizando un comando"
for coma in $(ls)
do
    echo "Nombre de archivos dado por un comando: $coma"
done

echo "Iterando utilizando el formato tradicional"
for ((i=1; i<10; i++))
do
    echo "Numeros: $i"
done





