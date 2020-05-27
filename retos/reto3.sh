# ! /bin/bash
# Programa para cumplir con el reto#3
#Arnoldo Alvarez

opcion=""
numA=0
numB=0
numC=0
telRegex= '^\(?([0-9]{3})\)?([0-9]{3})[.]?([0-9]{4})$' #Solo acepta el formato telefonico (xxx)xxx.xxxx Ej:(706)612.4602
telRegex2='^\([0-9]\{3\}\)\([0-9]\{3\}\)\([0-9]*\)/(\1) \2 . \3/$'
pathArchivo=""
aritmetica=""
funcion=""
phone=""
resp=""

while :
do
    clear
echo "Las opciones son las siguientes\n
        1.- Para Saber como evitar CoronaVirus
        2.- Realizar funciones numericas
        3.- Para verificar formato de numero telefonico
        4.- Para verificar un directorio
        5.- Ver contenido de un Archivo
        6.- salir"

echo -e "\n"
read -n1  -p "Introduzca su Opcion: " opcion

case $opcion in
    "1") echo -e "\nLo que debes hacer es lo siguiente:
                    a) Lavarse las manos frecuentemente.
                    b) Toser o estornudar al interior de  tu codo.
                    c) No tocarse la cara.
                    d) Mantener cierta distancia social.
                    e) Quedarse voluntariamente en casa."
            sleep 5
         ;;

    "2") read -p "Introduzca el numero A: " numA
         read -p "Introduzca el numero B: " numB
         echo    "Funciones Aritmeticas disponibles
                    1.- Sumar
                    2.- Multiplicar
                    3.- Dividir"
         echo -e "\n"
         read -p "Escoja la funcion Aritmetica: " aritmetica

         case $aritmetica in

              "1")  funcion="suma"
                    numC=$((numA + numB));;
              "2")  funcion="Multiplicacion"
                    numC=$((numA * numB));;
              "3")  funcion="Division"
                    numC=$((numA / numB));;
                *)  funcion="Funcion No definida"
                    echo "Opcion incorrecta";;
         esac

            echo "Resultado Matematico de la $funcion: $numC "

            sleep 5
            ;;

    "3")    echo -e "\n"
            read -p "Ingrese numero telefonico: " telefono

            if [[ $telefono =~ $telRegex2 ]]; then
                echo "Formato correcto dentro de los EEUU"
            else
            phone=$telefono
            plainPhone=$(echo $phone | sed "s/[()-.]//g")
            echo "Formato Incorrecto dentro de los EEUU"
            read -n1 -p "Convertir al formato (123)456.7890 s/n:  "  resp
            echo  -e "\n"
             if [ $resp = "s" ]; then
              formatedPhone2=$(echo $plainPhone | sed "s/\([0-9]\{3\}\)\([0-9]\{3\}\)\([0-9]*\)/(\1) \2 . \3/")
              echo "Numero convertido: $formatedPhone2 "
             else
                 echo "Gracias por su tiempo"
             fi
            fi

            sleep 5
            ;;

    "4") echo -e "\n"
         read -p "Ingrese la ruta de un directorio: " dirPath
            if [[ -d $dirPath  ]]; then
                echo "El directorio $dirPath SI Existe"

                else
                    echo "El directorio NO Existe o NO es un directorio"
            fi

            sleep 5

        ;;

     "5")echo -e "\n"
         read -p "Ingrese la ruta del archivo: " filePath
         if [[ -e $filePath  ]]; then
             cat $filePath
         else
             echo "No se encuentra el archivo o Nombre de archivo Incorrecto"
         fi
         sleep 6

         ;;

    "6")    echo -e "\n"
            echo -e "Saliendo..."
            exit 0

            ;;

      *) echo "Opcion Incorrecta, Lo sentimos"
esac
done









