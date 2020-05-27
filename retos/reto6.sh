# ! /bin/bash
# Programa para cumplir con el reto#3
#Arnoldo Alvarez

opcion=""
numA=0
numB=0
numC=0
#telRegex= '^\(?([0-9]{3})\)?([0-9]{3})[.]?([0-9]{4})$' #Solo acepta el formato telefonico (xxx)xxx.xxxx Ej:(706)612.4602
telRegex2='^\([0-9]\{3\}\)\([0-9]\{3\}\)\([0-9]*\)/(\1) \2 . \3/$'
pathArchivo=""
aritmetica=""
funcion=""
phone=""
respTel=""
respBackup=""
FILE=log.txt
FILE2=Zip.zip
DATE=`date +%y%m%d`
TIME=`date +%H%M%S`

#Se crea un archivo .log con fecha y hora y se mueve a un directorio de logs_reto5
NEWFILE=${FILE%.*}_`date +%Y%m%d`_`date +%H%M%S`.${FILE#*.}
touch $NEWFILE
mv $NEWFILE logs_reto6/
 #echo "El archivo $NEWFILE fue creado con exito"


while :
do
    clear
    echo "archivo: $NEWFILE"
echo "Las opciones son las siguientes\n
        1.- Para Saber como evitar CoronaVirus
        2.- Realizar funciones numericas
        3.- Para verificar formato de numero telefonico
        4.- Para verificar un directorio
        5.- Ver contenido de un Archivo
        6.- Hacer Respaldo de Logs
        7.- salir"

echo -e "\n"
read -n1  -p "Introduzca su Opcion: " opcion

case $opcion in
    "1") echo -e "\nLo que debes hacer es lo siguiente:
                    a) Lavarse las manos frecuentemente.
                    b) Toser o estornudar al interior de  tu codo.
                    c) No tocarse la cara.
                    d) Mantener cierta distancia social.
                    e) Quedarse voluntariamente en casa."

                    echo "$DATE-$TIME --- Instrucciones Consultadas" >> logs_reto6/$NEWFILE

                    sleep 5
         ;;

    "2") echo -e "\nIntroduzca el numero A: "
         read
         numA=$REPLY
         echo -e "Introduzca el numero B: "
         read
         numB=$REPLY
         #read -p "Introduzca el numero A: " numA
         #read -p "Introduzca el numero B: " numB
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
                    echo "$DATE-$TIME --- Opcion No encontrada,Funcion Matematica NO realizada"   >> logs_reto6/$NEWFILE
                    echo "Opcion incorrecta";;
         esac

            echo "Resultado Matematico de la $funcion: $numC "
            echo "$DATE-$TIME --- Usuario realiza funcion matematica $funcion:$numC" >> logs_reto6/$NEWFILE
            sleep 5
            ;;

    "3")    echo -e "\n"
            echo "$DATE-$TIME --- Usuario escoge chequear formato de numero telefonico" >> logs_reto6/$NEWFILE
            read -p "Ingrese numero telefonico: " telefono

            if [[ $telefono =~ $telRegex2 ]]; then
                echo "Formato correcto dentro de los EEUU"
            else
            phone=$telefono
            plainPhone=$(echo $phone | sed "s/[()-.]//g")
            echo "Formato Incorrecto dentro de los EEUU"
            read -n1 -p "Convertir al formato (123)456.7890 s/n:  "  respTel
            echo  -e "\n"
             if [ $respTel = "s" ]; then
              formatedPhone2=$(echo $plainPhone | sed "s/\([0-9]\{3\}\)\([0-9]\{3\}\)\([0-9]*\)/(\1) \2 . \3/")
              echo "Numero convertido: $formatedPhone2 "
              echo "$DATE-$TIME --- Usuario cambia formato del Numero Telefonico $telefono" >> logs_reto6/$NEWFILE
             else

                 echo "$DATE-$TIME --- Usuario responde NO para cambiar formato de  $telefono" >> logs_reto6/$NEWFILE
                 echo "Volviendo al Menu Principal..."
             fi
            fi

            sleep 5
            ;;

    "4") echo -e "\n"
         read -p "Ingrese la ruta de un directorio: " dirPath
            if [[ -d $dirPath  ]]; then

                echo "$DATE-$TIME --- Usuario consulta satisfactoriamente el directorio $dirPath" >> logs_reto6/$NEWFILE
                echo "El directorio $dirPath SI Existe"

                else
                    echo "El directorio NO Existe o NO es un directorio"
                    echo "$DATE-$TIME --- Usuario No encuentra $dirPath" >> logs_reto6/$NEWFILE
            fi

            sleep 5

        ;;

     "5")echo -e "\n"
         read -p "Ingrese la ruta del archivo: " filePath
         if [[ -e $filePath  ]]; then
             echo "$DATE-$TIME --- Usuario consulta el archivo $filePath" >> logs_reto6/$NEWFILE
             cat $filePath
         else
             echo "No se encuentra el archivo o Nombre de archivo Incorrecto"
             echo "$DATE-$TIME --- Usuario No encuentra $filePath" >> logs_reto6/$NEWFILE
         fi
         sleep 6

         ;;

     "6")echo -e "\n"
         read -n1 -p "Desea hacer Backup del Directorio logs_reto6 s/n: " respBackup

         if [[ $respBackup = "s" ]]; then
             echo -e  "\ncreando archivo tar..."
             sleep 2
             tar -cvf logs_reto6/backup_`date +%Y%m%d`_`date +%H%M%S`.tar logs_reto6/

             echo -e "\nCreando archivo ZIP..."
             echo "Debera introducir una Clave de Seguridad..."
             sleep 2
             zip -e logs_reto6/zip_`date +%Y%m%d`_`date +%H%M%S`.zip /shellCourse/logs_reto6/*.tar

             echo "Transfieriendo archivo ZIP..."
             echo "Clave de Administrador para Transferencias"
             sleep 2
             rsync -avz /shellCourse/logs_reto6/*.zip a2419@192.168.1.9:/$HOME/backup_logs_reto6/
             echo "$DATE-$TIME --- Usuario ejecutando proceso de Respaldo" >> logs_reto6/$NEWFILE
             sleep 3
             echo "Backup Realizado con Exito..."
         else

             echo "$DATE-$TIME --- Usuario cancela proceso de Respaldo " >> logs_reto6/$NEWFILE
             echo "Saliendo del modulo de Respaldos..."
             sleep 3
         fi
             ;;




     "7")    echo -e "\n"
            echo -e "Saliendo..."
            echo "$DATE-$TIME --- Usuario sale de la aplicacion" >> logs_reto6/$NEWFILE
            exit 0

            ;;

      *) echo "Opcion Incorrecta, Lo sentimos"


      esac
done









