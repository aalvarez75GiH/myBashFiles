# ! /bin/bash
# Programa para ejemplificar el uso de Arreglos
#Arnoldo Alvarez

arregloNumeros=(1 2 3 4 5 6)
arregloCadenas=(Arnoldo, Kris, Carlos, Julio)
arregloRangos=({A..Z} {10..20})

#Imprimir todos los valores
echo "Arreglo de Numeros: ${arregloNumeros[*]}"
echo "Arreglo de Cadenas: ${arregloCadenas[*]}"
echo "Arreglo de Rangos: ${arregloRangos[*]}"

#Imprimir los tamanos de los arreglos

echo "Tamano Arreglo de Numeros: ${#arregloNumeros[*]}"
echo "Tamano Arreglo de Cadenas: ${#arregloCadenas[*]}"
echo "Tamano Arreglo de Rangos: ${#arregloRangos[*]}"

#Imprimir la posicion 3 del arreglo de numeros y cadenas

echo "Posicion 3 Arreglo de Numeros: ${arregloNumeros[3]}"
echo "Posicion 3 Arreglo de Cadenas: ${arregloCadenas[3]}"
echo "Posicion 3 Arreglo de Rangos: ${arregloRangos[3]}"

#Anadir y eliminar valores en un Arreglo
arregloNumeros[7]=20 #Estamos agregando un numero valor (20) en la posicion 7
unset arregloNumeros[0] #estamos aqui liberando la posicion 0 del arreglo de numeros
echo "Arreglos de Numeros: ${arregloNumeros[*]}"
echo "Tamano de Arreglo de Numeros: ${#arregloNumeros[*]}"

