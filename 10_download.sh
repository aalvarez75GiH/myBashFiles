11_ifelse.sh                                                                                        0000755 0000000 0000000 00000000755 13641143511 011671  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar el uso de la sentencia de decision if, else
#Arnoldo Alvarez

notaClase=0
edad=0

echo "Ejemplo del uso de If - Else"

read -n1 -p  "Indique la nota (1-9): " notaClase
echo -e "\n"

if (($notaClase >= 7  )); then
    echo "El alumno aprueba la materia"
else
    echo "El alumno reprueba la materia"

fi


read -p "Indique su edad: " edad
if [ $edad -le 18 ]; then
echo "La persona no puede emitir su voto"
else
    echo "La persona puede votar"
fi


                   11_ifelseiflse.sh                                                                                   0000755 0000000 0000000 00000000725 13641143511 012711  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar el uso de la sentencia de decision if, else, elseif
#Arnoldo Alvarez

notaClase=0
edad=0

echo "Ejemplo del uso de if - else y elseif"

read -p "Indique su edad: " edad
if [ $edad -le 13 ]; then
    echo "Es un nino"
elif [ $edad -gt 13 ] && [ $edad -le 19 ]; then
echo "La persona es adolescente"
elif [ $edad -gt 19 ] && [ $edad -le 64 ]; then
    echo "La persona es adulta"
else
    echo "La persona es un abuelito"
fi



                                           12_ifAnidados.sh                                                                                    0000755 0000000 0000000 00000001055 13641143511 012456  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar el uso de los if anidados
#Arnoldo Alvarez

notaClase=0
continua=""

echo "Ejemplo del uso de if Anidados"

read -p "Indique cual es su nota (1-9): " notaClase
echo -e "\n"
if [ $notaClase -ge 7 ]; then
    echo "El alumno ha aprobado"
    read -p "Seguira estudiando el proximo nivel? (s/n): " continua
    if [ $continua = "s" ]; then
        echo "Bienvenido al siguiente nivel"
    else
        echo "lamentamos que no sigas con nosotros, mucha suerte"
    fi
else
    echo "El alumno ha sido reprobado"
fi



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   13_expresionesCondicionales.sh                                                                      0000755 0000000 0000000 00000001717 13641143511 015462  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
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

                                                 14_case.sh                                                                                          0000755 0000000 0000000 00000000647 13641143511 011340  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar el uso de la sentencia Case
#Arnoldo Alvarez

opcion=""

echo "Ejemplo del uso de Case"
echo -e "\n"
read -p "Introduzca una letra en el rango A-Z: " opcion

case $opcion in
    "A") echo -e "\nOperacion Guardar archivo";;
    "B") echo "Operacion Eliminar archivo";;
    [C-E]) echo "No esta implementada esta parte del Programa";;
    *) echo "Error en la Operacion";;
esac




                                                                                         15_arreglos.sh                                                                                      0000755 0000000 0000000 00000002130 13641143511 012231  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
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

                                                                                                                                                                                                                                                                                                                                                                                                                                        16_forLoop.sh                                                                                       0000755 0000000 0000000 00000001325 13641143511 012041  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
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





                                                                                                                                                                                                                                                                                                           17_whileLoop.sh                                                                                     0000755 0000000 0000000 00000000302 13641143511 012356  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar el uso de while loop
#Arnoldo Alvarez

numero=1

while [ $numero -ne 10 ]
do
    echo "Imprimiendo $numero veces"
    numero=$(( $numero+1 ))
done




                                                                                                                                                                                                                                                                                                                              18_loosAnidados.sh                                                                                  0000755 0000000 0000000 00000001223 13641143511 013037  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar el uso de los Loops Anidados
#Arnoldo Alvarez

echo "Loops Anidados"

#for file in $(ls)
#do
 #   for num in {1..4}
  #  do
   #     echo "Nombre archivo:$file _ $num"
    #done
#done

for ((i=00; i<24; i++))
do
    for ((ii=0; ii<60; ii++))
    do
        contador=$(($contador+1))
        if [ $i -lt 10 ]; then
            hour="0$i"
        else
            hour=$i
        fi
        if [ $ii -lt 10 ]; then
            min="0$ii"
        else
            min=$ii
        fi
        hourarray[$contador]="$hour:$min"
    done
done

echo "Valores Array : ${hourarray[*]}"
echo "Tamaño Array : ${#hourarray[*]}"
                                                                                                                                                                                                                                                                                                                                                                             19_breakContinue.sh                                                                                 0000755 0000000 0000000 00000000601 13641143511 013211  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar el uso del Break y Continue
#Arnoldo Alvarez

echo "Sentencias Break y Continue"

for file in $(ls)
do
    for num in {1..4}
    do
        if [ $file = "10_download.sh" ]; then
            break;
        elif [[ $file == 4* ]]; then
            continue;
        else
            echo "Nombre archivo:$file _ $num"
        fi
    done
done

                                                                                                                               1_utilityPostgres.sh                                                                                0000755 0000000 0000000 00000000151 13641143511 013561  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   #Programa para realizar algunas utilidades de PostGres.

 echo "Bienvenidos a la programacion en Bash"


                                                                                                                                                                                                                                                                                                                                                                                                                       20_menuOpciones.sh                                                                                  0000755 0000000 0000000 00000002414 13641143511 013060  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar el uso del Break y Continue
#Arnoldo Alvarez

opcion=0

while :
do
    #Limpiar la pantalla
    clear
    #Desplegar el menu de opciones
    echo "----------------------------------------"
    echo "PGUTIL - Programa de Utilidades PostGres"
    echo "----------------------------------------"
    echo "           MENU PRINCIPAL               "
    echo "----------------------------------------"
    echo "1.Instalar Postgres                     "
    echo "2.Desinstalar Postgres                  "
    echo "3.Hacer un respaldo                     "
    echo "4.Restaurar respaldo                    "
    echo "5.Salir                                 "

    #Leer los datos del Usuario - Capturar  Opcion
    read -n1 -p "Ingrese una opcion [1-5]: " opcion

    #Validar la opcion ingresada
    case $opcion in
        1) echo -e "\nInstalando Postgres...."
            sleep 3
            ;;
        2) echo -e "\nDesinstalando Postgres...."
            sleep 3
            ;;

        3) echo -e "\nHaciendo Respaldo...."
            sleep 3
            ;;

        4) echo -e "\nRestaurando respaldo...."
            sleep 3
            ;;

        5) echo -e "\nSaliendo del programa...."
            exit 0
            ;;
    esac
done




                                                                                                                                                                                                                                                    21_archivosDirectorios.sh                                                                           0000755 0000000 0000000 00000000550 13641143511 014441  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar la creacion de archivos y directorios.
#Arnoldo Alvarez

echo "Archivos y Directorios"

if [ $1 = "d" ]; then
    mkdir -m 755 $2
    echo "Directorio $2 creado con exito!"
    ls -la $2
elif [ $1 = "f" ]; then
    touch $2
    echo "Archivo creado Correctamente!"
    ls -la $2
else
    echo "Opcion Incorrecta"

fi
                                                                                                                                                        22_writeFile.sh                                                                                     0000755 0000000 0000000 00000000333 13641143511 012346  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar como se escribe en un archivo mediante un programa bash
#Arnoldo Alvarez

echo "Escribir en un Archivo mediante Bash App"

echo "Escrito con echo" >> $1

cat <<EOM >>$1
$2
EOM
                                                                                                                                                                                                                                                                                                     23_readFile.sh                                                                                      0000755 0000000 0000000 00000000731 13641143511 012132  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
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

                                       24_fileOperations.sh                                                                                0000755 0000000 0000000 00000001011 13641143511 013373  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar las operaciones de un archivo
#Arnoldo Alvarez

echo "Operaciones de archivo"
mkdir -m 755 backupScripts

echo -e "\nCopiar Scripts en backupScripts"
cp *.* backupScripts/
ls -la backupScripts/

echo -e "\nMover el directorio backupScripts a otra ubicacion: $HOME"
mv backupScripts $HOME
echo -e "\nArchivo movido satisfactoriamente"

echo -e "\nEliminar los archivos txt del directorio $HOME/backupScripts"
rm  $HOME/backupScripts/*.txt
echo -e "\nArchivos txt eliminados!"



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       25_tar.sh                                                                                           0000755 0000000 0000000 00000000275 13641143511 011212  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar el empaquetamiento con el comando tar
#Arnoldo Alvarez


echo "Empaquetar todos los Scripts ubicados en /shellCourse "
tar -cvf shellCourse *.sh

                                                                                                                                                                                                                                                                                                                                   26_gzip.sh                                                                                          0000755 0000000 0000000 00000000427 13641143511 011375  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar el empaquetamiento con el comando tar y  gzip
#Arnoldo Alvarez


echo "Empaquetar todos los Scripts ubicados en /shellCourse "
tar -cvf shellCourse.tar *.sh
gzip shellCourse.tar

echo "Empaquetando un solo archivo"
gzip -9 9_options.sh
                                                                                                                                                                                                                                         27_pbzip2.sh                                                                                        0000755 0000000 0000000 00000000551 13642141755 011642  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar el empaquetamiento con el comando pbzip
#Arnoldo Alvarez


echo "Empaquetar todos los Scripts ubicados en /shellCourse "
tar -cvf shellCourse.tar *.sh
pbzip2 -f shellCourse.tar

echo "Empaquetando un directorio con tar y pbzip2"
#tar -cf *.sh -c > shellCourseDos.tar.bz2
sudo tar -cf *.sh -c > shellCourseDos.tar.bz2 
                                                                                                                                                       28_zipPassword.sh                                                                                   0000755 0000000 0000000 00000000340 13641143511 012745  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar el empaquetamiento con clave con zip
#Arnoldo Alvarez


echo "Empaquetar todos los Scripts ubicados en /shellCourse con zip y usar clave de seguridad "
zip -e shellCourse.zip *.sh

                                                                                                                                                                                                                                                                                                29_packageSSH.sh                                                                                    0000755 0000000 0000000 00000001130 13641143511 012370  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar la forma de como transferir informacion utilizando el comando rsync y utilizando las opciones de
#empaquetamiento para optimizar la velocidad de transferencia.
#Arnoldo Alvarez
host=""
usuario=""


echo "Empaquetar todos los Scripts ubicados en /shellCourse y transferirlos por la red a otro equipo con rsync"
read -p "Ingrese el nombre del Host: " host
read -p "Ingrese el nombre de Usuario " usuario
echo -e "\n En este momento se procedera a empaquetar la carpeta y transferirla segun Datos ingresados"
rsync -avz $(pwd) $usuario@$host:/$HOME/pruebared/
                                                                                                                                                                                                                                                                                                                                                                                                                                        2_variables.sh                                                                                      0000755 0000000 0000000 00000000477 13641143511 012313  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # !/bin/bash
# Programa para aprender a declarar variables
 opcion=0
 nombre="Arnoldo"

 #echo "Opcion: $opcion y nombre: $nombre"

 #exportar la variable nombre para que este disponible para otros procesos

 export nombre
 export opcion
#llamar al archivo donde vamos a exportar la variable nombre

./2_variables2.sh

                                                                                                                                                                                                 2_variables2.sh                                                                                     0000755 0000000 0000000 00000000261 13641143511 012364  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # !/bin/bash
# Programa que esta importando variables de 2_variables.sh

  echo "Nombre proveniente de otro script: $nombre"
  echo "Opcion proveniente de otro script: $opcion"
                                                                                                                                                                                                                                                                                                                                               30_functionsArgs.sh                                                                                 0000755 0000000 0000000 00000003600 13641143511 013240  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar el uso del Break y Continue
#Arnoldo Alvarez

opcion=0

#Esta es la funcion instalar PostGres
instalar_postgres () {
echo -e  "\nInstalar PostGres... "

}


#Esta es la funcion desinstalar PostGres
desinstalar_postgres () {
echo -e "\nDesinstalar PostGres... "

}


#Esta es la funcion Sacar Respaldo
sacar_respaldo () {
echo -e "\nSacar Respaldo "
echo "Directorio de Backup: $1 "

}


#Esta es la funcion Restaurar Respaldo
restaurar_respaldo () {
echo -e "\nRestaurar Respaldo "
echo "Directorio de Respaldo: $1 "

}








while :
do
    #Limpiar la pantalla
    clear
    #Desplegar el menu de opciones
    echo "----------------------------------------"
    echo "PGUTIL - Programa de Utilidades PostGres"
    echo "----------------------------------------"
    echo "           MENU PRINCIPAL               "
    echo "----------------------------------------"
    echo "1.Instalar Postgres                     "
    echo "2.Desinstalar Postgres                  "
    echo "3.Hacer un respaldo                     "
    echo "4.Restaurar respaldo                    "
    echo "5.Salir                                 "

    #Leer los datos del Usuario - Capturar  Opcion
    read -n1 -p "Ingrese una opcion [1-5]: " opcion

    #Validar la opcion ingresada
    case $opcion in
        1) instalar_postgres

           sleep 3
            ;;

        2) desinstalar_postgres

           sleep 3
            ;;

        3)  echo -e "\n"
            read -p "Indique Directorio: " directorioBackup
            sacar_respaldo $directorioBackup

            sleep 3
            ;;

        4)  echo -e "\n"
            read -p "Indique Directorio de Respaldos " directorioRespaldos
            restaurar_respaldo $directorioRespaldos

            sleep 3
            ;;

        5) echo -e "\nSaliendo del programa...."
            exit 0
            ;;
    esac
done




                                                                                                                                31_Linux_installUninstallPostgres.sh                                                                0000644 0000000 0000000 00000006415 13641153362 016673  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar el uso del Break y Continue
#Arnoldo Alvarez

opcion=0

#Esta es la funcion instalar PostGres
instalar_postgres () {
 echo -e "\nVerificar si tenemos instalado PostGress..."
 sleep 3
 verifyInstall=$(which psql)
 if [ $? -eq 0 ]; then
     echo "PostGres ya se encuentra instalado en el equipo "
 else
      read -s -p "Introduzca password de administrador " password
      read -s -p "Introduzca password a utilizar en PostGres " passwordPostgres
      echo "$password" | sudo -S apt update
      echo "$password" | sudo -S apt-get -y install postgresql postgresql-contrib
      sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '{$passwordPostgres}';"
      echo "$password" | sudo -S systemctl enable postgresql.service
      echo "$password" | sudo -S systemctl start postgresql.service
 fi

 read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}

#Esta es la funcion desinstalar PostGres
desinstalar_postgres () {
    echo -e "\nVerificando si ya esta Desinstalado Postgres..."
    verifyInstall=$(which psql)
    if [ $? -eq 1 ]; then
        echo " PostGres NO se encuentra instalado en el Equipo "
    else
        read -s -p "Introduzca password de administrador " password
	echo -e "\n"
	echo "$password" | sudo -S systemctl stop postgresql.service
       	echo "$password" | sudo -S apt-get -y --purge remove postgresql\*
       	echo "$password" | sudo -S rm -r /etc/postgresql
        echo "$password" | sudo -S rm -r /etc/postgresql-common
       	echo "$password" | sudo -S rm -r /var/lib/postgresql
	echo "$password" | sudo -S userdel -r postgres
        echo "$password" | sudo -S groupdel postgresql
fi

read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}

#Esta es la funcion Sacar Respaldo
sacar_respaldo () {
echo -e "\nSacar Respaldo "
echo "Directorio de Backup: $1 "

}


#Esta es la funcion Restaurar Respaldo
restaurar_respaldo () {
echo -e "\nRestaurar Respaldo "
echo "Directorio de Respaldo: $1 "
}

while :
do
    #Limpiar la pantalla
    clear
    #Desplegar el menu de opciones
    echo "----------------------------------------"
    echo "PGUTIL - Programa de Utilidades PostGres"
    echo "----------------------------------------"
    echo "           MENU PRINCIPAL               "
    echo "----------------------------------------"
    echo "1.Instalar Postgres                     "
    echo "2.Desinstalar Postgres                  "
    echo "3.Hacer un respaldo                     "
    echo "4.Restaurar respaldo                    "
    echo "5.Salir                                 "

    #Leer los datos del Usuario - Capturar  Opcion
    read -n1 -p "Ingrese una opcion [1-5]: " opcion

    #Validar la opcion ingresada
    case $opcion in
        1) instalar_postgres

          #sleep 3
            ;;

        2) desinstalar_postgres

           #sleep 3
            ;;

        3)  echo -e "\n"
            read -p "Indique Directorio: " directorioBackup
            sacar_respaldo $directorioBackup

            sleep 3
            ;;

        4)  echo -e "\n"
            read -p "Indique Directorio de Respaldos " directorioRespaldos
            restaurar_respaldo $directorioRespaldos

            sleep 3
            ;;

        5) echo -e "\nSaliendo del programa...."
            exit 0
            ;;
    esac
done

                                                                                                                                                                                                                                                   31_installUninstallPostgres.sh                                                                      0000755 0000000 0000000 00000007053 13641143511 015511  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar el uso del Break y Continue
#Arnoldo Alvarez

opcion=0

#Esta es la funcion instalar PostGres
instalar_postgres () {
 echo -e "\nVerificar si tenemos instalado PostGress..."
 sleep 3
 verifyInstall=$(which psql)
 if [ $? -eq 0 ]; then
     echo "PostGres ya se encuentra instalado en el equipo "
 else
     #read -s -p "Introduzca password de administrador " password
     #read -s -p "Introduzca password a utilizar en PostGres " passwordPostgres
     sudo brew doctor
     sudo brew update
     sudo brew install postgresql
     #sudo -u postgres psql -c "ALTER USER postgre WITH PASSWORD '{$passwordPostgres}';"
     sudo brew services start postgresql
     #echo "$password" | sudo -S systemctl start postgresql.service
 fi

 read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}


#Esta es la funcion desinstalar PostGres
desinstalar_postgres () {
    echo -e "\nVerificando si ya esta Desinstalado Postgres..."
    verifyInstall=$(which psql)
    if [ $? -eq 1 ]; then
        echo " PostGres NO se encuentra instalado en el Equipo "
    else
        read -s -p "Introduzca password de administrador " password
        #echo "$password" | sudo -S systemctl stop postgresql.service
        echo "$password" | sudo -S brew doctor
        echo "$password" | sudo    brew -S update
        echo "$password" | sudo    brew services stop postgresql
        echo "$password" | sudo    brew uninstall postgresql

        echo "$password" | sudo -S rm -rf /usr/local/var/postgres
        echo "$password" | sudo -S rm -rf .psql_history .psqlrc .psql.local .pgpass .psqlrc.local

        echo "$password" | sudo -S dscl . -delete /Users/postgres
        echo "$password" | sudo -S dscl . -delete /Groups/postgres


        #echo "$password" | sudo -S rm -r /etc/postgresql
        #echo "$password" | sudo -S rm -r /etc/postgresql-common
        #echo "$password" | sudo -S rm -r /var/lib/postgresql


    fi

read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}


#Esta es la funcion Sacar Respaldo
sacar_respaldo () {
echo -e "\nSacar Respaldo "
echo "Directorio de Backup: $1 "

}


#Esta es la funcion Restaurar Respaldo
restaurar_respaldo () {
echo -e "\nRestaurar Respaldo "
echo "Directorio de Respaldo: $1 "

}








while :
do
    #Limpiar la pantalla
    clear
    #Desplegar el menu de opciones
    echo "----------------------------------------"
    echo "PGUTIL - Programa de Utilidades PostGres"
    echo "----------------------------------------"
    echo "           MENU PRINCIPAL               "
    echo "----------------------------------------"
    echo "1.Instalar Postgres                     "
    echo "2.Desinstalar Postgres                  "
    echo "3.Hacer un respaldo                     "
    echo "4.Restaurar respaldo                    "
    echo "5.Salir                                 "

    #Leer los datos del Usuario - Capturar  Opcion
    read -n1 -p "Ingrese una opcion [1-5]: " opcion

    #Validar la opcion ingresada
    case $opcion in
        1) instalar_postgres

          #sleep 3
            ;;

        2) desinstalar_postgres

           #sleep 3
            ;;

        3)  echo -e "\n"
            read -p "Indique Directorio: " directorioBackup
            sacar_respaldo $directorioBackup

            sleep 3
            ;;

        4)  echo -e "\n"
            read -p "Indique Directorio de Respaldos " directorioRespaldos
            restaurar_respaldo $directorioRespaldos

            sleep 3
            ;;

        5) echo -e "\nSaliendo del programa...."
            exit 0
            ;;
    esac
done




                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     32_backupRestore.sh                                                                                 0000644 0000000 0000000 00000012042 13641237332 013230  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar el uso del Break y Continue
#Arnoldo Alvarez

opcion=0
fechaActual=`date +%Y%m%d`

#Esta es la funcion instalar PostGres
instalar_postgres () {
 echo -e "\nVerificar si tenemos instalado PostGress..."
 sleep 3
 verifyInstall=$(which psql)
 if [ $? -eq 0 ]; then
     echo "PostGres ya se encuentra instalado en el equipo "
 else
      read -s -p "Introduzca password de administrador " password
      read -s -p "Introduzca password a utilizar en PostGres " passwordPostgres
      echo "$password" | sudo -S apt update
      echo "$password" | sudo -S apt-get -y install postgresql postgresql-contrib
      sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '{$passwordPostgres}';"
      echo "$password" | sudo -S systemctl enable postgresql.service
      echo "$password" | sudo -S systemctl start postgresql.service
 fi

 read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}

#Esta es la funcion desinstalar PostGres
desinstalar_postgres () {
    echo -e "\nVerificando si ya esta Desinstalado Postgres..."
    verifyInstall=$(which psql)
    if [ $? -eq 1 ]; then
        echo " PostGres NO se encuentra instalado en el Equipo "
    else
        read -s -p "Introduzca password de administrador " password
	echo -e "\n"
	echo "$password" | sudo -S systemctl stop postgresql.service
       	echo "$password" | sudo -S apt-get -y --purge remove postgresql\*
       	echo "$password" | sudo -S rm -r /etc/postgresql
        echo "$password" | sudo -S rm -r /etc/postgresql-common
       	echo "$password" | sudo -S rm -r /var/lib/postgresql
	echo "$password" | sudo -S userdel -r postgres
        echo "$password" | sudo -S groupdel postgresql
fi

read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}

#Esta es la funcion Sacar Respaldo
sacar_respaldo () {
echo "Listar las bases de datos..."
sudo -u postgres psql -c "\l"
read -p "Elegir la BD a respaldar: " bddRespaldo
echo -e "\n"
	if [ -d "$1" ]; then
		echo "Establecer permisos directorio"
		echo "$password" | sudo -S chmod 755 $1
		echo "Realizando respaldo..."
		sudo -u postgres pg_dump -Fc $bddRespaldo > "$1/bddRespaldo$fechaActual.bak"
		echo "Respaldo realizado Correctamente en la ubicacion: $1/bddRespaldo$fechaActual.bak"
	else
		echo -e  "\nEl directorio $1 No Existe"
		echo -e "\n"
		read -n1 -p "Desea crear el directorio $1 (s/n)" respbdd
		if [ $respbdd = "s" ]; then
			sudo mkdir $1
			echo "$password" | sudo -S chmod 755 $1
		       	echo -e "\nRealizando respaldo..."
			sleep 3
			sudo -u postgres pg_dump -Fc $bddRespaldo > "$1/bddRespaldo$fechaActual.bak"
			echo "Respaldo realizado Correctamente en la ubicacion: $1/bddRespaldo$fechaActual.bak"
		else
			echo -e "\nSaliendo sin realizar Respaldo..."
			sleep 3
		fi

		fi

read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}


#Esta es la funcion Restaurar Respaldo
restaurar_respaldo () {
echo "Listar los respaldos..."
read -p "Ingresar el directorio donde se encuentran los respaldos" directorioBackup
ls -la $directorioBackup
read -p "Ingresar el archivo .bak a restaurar:  " respaldoRestaurar
echo -e "\n"
read -p "Ingresar nombre BD destino:  " bdDestino
#Verificar si la BDD destino existe
verifyBdd= $(sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -wq $bdDestino) 
if [ $? -eq 0 ]; then
	echo "Restaurando en la Base de Datos destino...$bdDestino"
else
	sudo -u postgres psql -c "CREATE DATABASE $bdDestino"

fi

if [ -f "/home/ubuntu/shellCourse/Respaldos/$respaldoRestaurar" ]; then
      sudo -u postgres pg_restore -Fc -d $bdDestino "$directorioBackup/$respaldoRestaurar"
      echo "Listar Bases de datos..."
      sudo -u postgres psql -c "\l"
      else
	      echo "El Respaldo a restaurar $respaldoRestaurar NO Existe..."
      fi

read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}

while :
do
    #Limpiar la pantalla
    clear
    #Desplegar el menu de opciones
    echo "----------------------------------------"
    echo "PGUTIL - Programa de Utilidades PostGres"
    echo "----------------------------------------"
    echo "           MENU PRINCIPAL               "
    echo "----------------------------------------"
    echo "1.Instalar Postgres                     "
    echo "2.Desinstalar Postgres                  "
    echo "3.Hacer un respaldo                     "
    echo "4.Restaurar respaldo                    "
    echo "5.Salir                                 "

    #Leer los datos del Usuario - Capturar  Opcion
    read -n1 -p "Ingrese una opcion [1-5]: " opcion

    #Validar la opcion ingresada
    case $opcion in
        1) instalar_postgres

          #sleep 3
            ;;

        2) desinstalar_postgres

           #sleep 3
            ;;

        3)  echo -e "\n"
            read -p "Indique Directorio: " directorioBackup
            sacar_respaldo $directorioBackup

            
            ;;

        4)  echo -e "\n"
            #read -p "Indique Directorio de Respaldos " directorioRespaldos
            restaurar_respaldo $directorioRespaldos

           
            ;;

        5) echo -e "\nSaliendo del programa...."
            exit 0
            ;;
    esac
done

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              33_finalProject.sh                                                                                  0000644 0000000 0000000 00000013365 13641420425 013046  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar el uso del Break y Continue
#Arnoldo Alvarez

opcion=0
fechaActual=`date +%Y%m%d`

#Esta es la funcion instalar PostGres
instalar_postgres () {
 echo -e "\nVerificar si tenemos instalado PostGress..."
 sleep 3
 verifyInstall=$(which psql)
 if [ $? -eq 0 ]; then
     echo "PostGres ya se encuentra instalado en el equipo "
 else
      read -s -p "Introduzca password de administrador " password
      read -s -p "Introduzca password a utilizar en PostGres " passwordPostgres
      echo "$password" | sudo -S apt update
      echo "$password" | sudo -S apt-get -y install postgresql postgresql-contrib
      sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '{$passwordPostgres}';"
      echo "$password" | sudo -S systemctl enable postgresql.service
      echo "$password" | sudo -S systemctl start postgresql.service
 fi

 read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}

#Esta es la funcion desinstalar PostGres
desinstalar_postgres () {
    echo -e "\nVerificando si ya esta Desinstalado Postgres..."
    verifyInstall=$(which psql)
    if [ $? -eq 1 ]; then
        echo " PostGres NO se encuentra instalado en el Equipo "
    else
        read -s -p "Introduzca password de administrador " password
	echo -e "\n"
	echo "$password" | sudo -S systemctl stop postgresql.service
       	echo "$password" | sudo -S apt-get -y --purge remove postgresql\*
       	echo "$password" | sudo -S rm -r /etc/postgresql
        echo "$password" | sudo -S rm -r /etc/postgresql-common
       	echo "$password" | sudo -S rm -r /var/lib/postgresql
	echo "$password" | sudo -S userdel -r postgres
        echo "$password" | sudo -S groupdel postgresql
fi

read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}

#Esta es la funcion Sacar Respaldo
sacar_respaldo () {
echo "Listar las bases de datos..."
sudo -u postgres psql -c "\l"
read -p "Elegir la BD a respaldar: " bddRespaldo
echo -e "\n"
	if [ -d "$1" ]; then
		echo "Establecer permisos directorio"
		echo "$password" | sudo -S chmod 755 $1
		echo "Realizando respaldo..."
		sudo -u postgres pg_dump -Fc $bddRespaldo > "$1/bddRespaldo$fechaActual.bak"
		echo "Respaldo realizado Correctamente en la ubicacion: $1/bddRespaldo$fechaActual.bak"
	else
		echo -e  "\nEl directorio $1 No Existe"
		echo -e "\n"
		read -n1 -p "Desea crear el directorio $1 (s/n)" respbdd
		if [ $respbdd = "s" ]; then
			sudo mkdir $1
			echo "$password" | sudo -S chmod 755 $1
		       	echo -e "\nRealizando respaldo..."
			sleep 3
			sudo -u postgres pg_dump -Fc $bddRespaldo > "$1/bddRespaldo$fechaActual.bak"
			echo "Respaldo realizado Correctamente en la ubicacion: $1/bddRespaldo$fechaActual.bak"
		else
			echo -e "\nSaliendo sin realizar Respaldo..."
			sleep 3
		fi

		fi

read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}


#Esta es la funcion Restaurar Respaldo
restaurar_respaldo () {
read -p "Ingresar el directorio donde se encuentran los respaldos   " directorioBackup
if [ -d $directorioBackup ]; then 

echo "Listando los archivos de Respaldos..."
sleep 3
ls -la $directorioBackup
read -p "Ingresar el archivo .bak a restaurar:  " respaldoRestaurar
#echo -e "\n"
if [ -f "$directorioBackup/$respaldoRestaurar" ]; then

	read -p "Ingresar nombre BD destino:  " bdDestino
	verifyBdd= $(sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -wq $bdDestino) 
	if [ $? -eq 0 ]; then
		  echo "Restaurando en la Base de Datos destino...$bdDestino"
		  sudo -u postgres pg_restore -Fc -d $bdDestino "$directorioBackup/$respaldoRestaurar"
	       	  echo "Listar Bases de datos..."
      		  sudo -u postgres psql -c "\l"
	   else
	 	  echo  "La BD destino no se encuentra..."
		  echo  "Creando Base de Datos destino..."
		  sleep 4
		  sudo -u postgres psql -c "CREATE DATABASE $bdDestino"
		  sudo -u postgres pg_restore -Fc -d $bdDestino "$directorioBackup/$respaldoRestaurar"
	       	  echo "Listar Bases de datos..."
      		  sudo -u postgres psql -c "\l"
	  fi
      
else
	echo "No se encuentra el archivo de Respaldo Ingresado"
	echo "Verifique nuevamente el nombre y vuelva a intentarlo..."
fi
else
	echo "No se encuentra el directorio de Respaldos ingresado..."
	echo "Verifique nuevamente el nombre y vuelva a intentarlo..."
fi

read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}

lista_de_BD(){

echo -e  "\Las Bases de Datos Actuales: "
sudo -u postgres psql -c "\l"
read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}

while :
do
    #Limpiar la pantalla
    clear
    #Desplegar el menu de opciones
    echo "----------------------------------------"
    echo "PGUTIL - Programa de Utilidades PostGres"
    echo "----------------------------------------"
    echo "           MENU PRINCIPAL               "
    echo "----------------------------------------"
    echo "1.Instalar Postgres                     "
    echo "2.Desinstalar Postgres                  "
    echo "3.Hacer un respaldo                     "
    echo "4.Restaurar respaldo                    "
    echo "5.Listar Bases de Datos Actuales        "
    echo "6.Salir                                 "

    #Leer los datos del Usuario - Capturar  Opcion
    read -n1 -p "Ingrese una opcion [1-5]: " opcion

    #Validar la opcion ingresada
    case $opcion in
        1) instalar_postgres

          #sleep 3
            ;;

        2) desinstalar_postgres

           #sleep 3
            ;;

        3)  echo -e "\n"
            read -p "Indique Directorio: " directorioBackup
            sacar_respaldo $directorioBackup

            
            ;;

        4)  echo -e "\n"
            #read -p "Indique Directorio de Respaldos " directorioRespaldos
            restaurar_respaldo $directorioRespaldos

           
            ;;
    	
    	5) lista_de_BD 
	    ;;

        6) echo -e "\nSaliendo del programa...."
            exit 0
            ;;
    esac
done

                                                                                                                                                                                                                                                                           3_tipoOperadores.sh                                                                                 0000755 0000000 0000000 00000001645 13641143511 013341  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para revisar los tipos de Operadores
# Autor: Arnoldo Alvarez

numA=10
numB=5

echo "Operadores Aritmeticos"
echo "Numeros A=$numA y B=$numB"
echo "Sumar A + B = " $((numA + numB))
echo "Restar A - B = " $((numA - numB))
echo "Multiplicar A * B = " $((numA * numB))
echo "Dividir A / B = " $((numA / numB))
echo "Residuo A % B = " $((numA % numB))



echo -e "\nOperadores Relacionales"
echo "Numeros A=$numA y B=$numB"
echo " A > B = " $((numA > numB))
echo " A < B = " $((numA < numB))
echo " A >= B = " $((numA >= numB))
echo " A <= B = " $((numA < numB))
echo " A == B = " $((numA == numB))
echo " A != B = " $((numA != numB))


echo -e "\nOperadores Asignacion"
echo "Numeros A=$numA y B=$numB"
echo " Sumar A += B" $((numA += numB))
echo " Restar A -= B" $((numA -= numB))
echo " Multiplicar A *= B" $((numA *= numB))
echo " Dividir A /= B" $((numA /= numB))
echo " Residuo A %= B" $((numA %= numB))


                                                                                           4_argumentos.sh                                                                                     0000755 0000000 0000000 00000000465 13641143511 012526  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin.bash
#Programa para ejemplificar el paso de argumentos

nombreCurso=$1
horarioCurso=$2

echo "El nombre del Curso es: $nombreCurso dictado en el horario: $horarioCurso"
echo "El numero de parametros enviados es: $#"
echo "Los partametros enviados son: $*"
echo "El nombre de este programa es: $0"



                                                                                                                                                                                                           5_SubComando.sh                                                                                     0000755 0000000 0000000 00000000572 13641143511 012374  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para asignar comandos a variables para su posterior utilizacion.
#Arnoldo Alvarez

nombreCurso=$1
horario=$2
ubicacionActual=`pwd`
infoKernel=$(uname -a)

echo "El nombre del Curso es: $nombreCurso"
echo "El horario del mismo es: $horario"
echo "La ubicacion actual donde estamos es: $ubicacionActual"
echo "Informacion del Kernel es: $infoKernel"





                                                                                                                                      6_readEcho.sh                                                                                       0000755 0000000 0000000 00000000616 13641143511 012054  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar como capturar la informacion del usuario utilizando los comandos echo, read y $REPLY
#Arnoldo Alvarez

option=0
backupName=""

echo "Programa de utilidades PostGres"
echo -n "Ingresar una Opcion"

read
option=$REPLY

echo -n "Ingrese el nombre del archivo para el BackUp"
read
backupName=$REPLY

echo "Opcion:$option , Nombre del Backup: $backupName "



                                                                                                                  7_read.sh                                                                                           0000755 0000000 0000000 00000000551 13641143511 011254  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar como capturar la informacion del usuario utilizando solo el  comando read
#Arnoldo Alvarez

option=0
backupName=""

echo "Programa de utilidades PostGres"
read -p "Ingresar una Opcion" option
read -p "Ingrese el nombre del archivo para el BackUp" backupName

echo "Opcion:$option , Nombre del Backup: $backupName "



                                                                                                                                                       8_readValidate.sh                                                                                   0000755 0000000 0000000 00000001153 13641143511 012726  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar como capturar la informacion del usuario y validarla. Tambien estamos probando la captura silenciosa
#de datos con el comando 'read -s -p'
#Arnoldo Alvarez

option=0
backupName=""
clave=""

echo "Programa de utilidades PostGres"
#Acepta el ingreso de informacion de un solo caracter
read -n1 -p "Ingresar una Opcion: " option
echo -e "\n"
read -n10 -p "Ingrese el nombre del archivo para el BackUp: " backupName
echo -e "\n"
echo "Opcion:$option , Nombre del Backup: $backupName "
read -s -p "Ingrese la clave:" clave
echo -e "\n"
echo  "La clave fue la siguiente: " $clave


                                                                                                                                                                                                                                                                                                                                                                                                                     Expre_reg.sh                                                                                        0000644 0000000 0000000 00000001632 13641143511 012031  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Priograma para ejemplificar como capturar la info del usuario y validarla utiliuzando expresiones regulares
# Arnoldo Alvarez

identificacionRegex='^[0-9]{10}$'
paisRegex='^VE|US|CL$'
fechaNacRegex='^19|20 [0-8]{2}[1-12][1-31]$'

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


                                                                                                      date_time.sh                                                                                        0000644 0000000 0000000 00000000426 13641143511 012044  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   #! /bin/bash
# Programa para hacer prueba con la fecha y hora
# Crea un archivo log_date_time.txt y lo almacena en donde se este ejecutando.
FILE=log.txt
NEWFILE=${FILE%.*}_`date +%Y%m%d`_`date +%H%M%S`.${FILE#*.}
touch $NEWFILE
echo "El archivo $NEWFILE fue creado con exito"

                                                                                                                                                                                                                                          menuOpciones.sh                                                                                     0000644 0000000 0000000 00000002412 13641144654 012563  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar el uso del Break y Continue
#Arnoldo Alvarez

opcion=0

while :
do
    #Limpiar la pantalla
    clear
    #Desplegar el menu de opciones
    echo "----------------------------------------"
    echo "PGUTIL - Programa de Utilidades PostGres"
    echo "----------------------------------------"
    echo "           MENU PRINCIPAL               "
    echo "----------------------------------------"
    echo "1.Instalar Postgres                     "
    echo "2.Desinstalar Postgres                  "
    echo "3.Hacer un respaldo                     "
    echo "4.Restaurar respaldo                    "
    echo "5.Salir                                 "

    #Leer los datos del Usuario - Capturar  Opcion
    read -n1 -p "Ingrese una opcion [1-5]: " opcion

    #Validar la opcion ingresada
    case $opcion in
        1) echo -e "\nInstalando Postgres...."
            sleep 3
            ;;
        2) echo -e "\nDesinstalando Postgres...."
            sleep 3
            ;;

        3) echo -e "\nHaciendo Respaldo...."
            sleep 3
            ;;

        4) echo -e "\nRestaurando respaldo...."
            sleep 3
            ;;

        5) echo -e "\nSaliendo del programa...."
            exit 0
            ;;
    esac
done


                                                                                                                                                                                                                                                      platzi.sh                                                                                           0000644 0000000 0000000 00000000314 13641143511 011410  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   #!/usr/bin/bash

NEW_DIR = taqzunami

if [! -d "/Users/a2419/development/$NEW_DIR" ];then 
	mkdir Users/a2419/development/$NEW_DIR
fi
cp prueba1 /Users/a2419/$NEW_DIR/

echo "`date`: Todo listo jefe!"



                                                                                                                                                                                                                                                                                                                    reto2.sh                                                                                            0000755 0000000 0000000 00000002620 13641143511 011145  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar como capturar la informacion del usuario: Nombre, Apellido, CI, edad, direccion, numeros telefonicos e email
# validar que direccion ocupe solo 20 digitos, email sea valido y Cedula de 8 digitos.
#Arnoldo Alvarez

cedulaRegex='^[0-9]{08}$'
emailRegex='^.*[@].*[com|es]$'
password=1234

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
read -n10 -p "Ingrese su numero telefonico " telefono
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

if [[ $email =~ $emailRegex ]]; then
    echo "Correo electronico valido $email "
else
    echo "Correo electronico invalido $email "
fi

else
    echo "Clave incorrecta"
    echo "Saliendo del Sistema"

fi





                                                                                                                reto2_1.sh                                                                                          0000755 0000000 0000000 00000003206 13641143511 011366  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
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





                                                                                                                                                                                                                                                                                                                                                                                          reto3.sh                                                                                            0000755 0000000 0000000 00000006634 13641143511 011157  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
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









                                                                                                    reto3_en.sh                                                                                         0000755 0000000 0000000 00000005640 13641143511 011635  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
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

echo "Options: \n
        1.- Steps to avoid CoronaVirus
        2.- Do some math functions
        3.- Verify Phone number format
        4.- Verify a directory
        5.- See the content of a file
        6.- Quit"

echo -e "\n"
read -p "Enter your Option " opcion

case $opcion in
    "1") echo -e "\nWhat you need to do is::
                    a) Wash your hands frequently.
                    b) Elbow. Cough into it.
                    c) Face.Do not touch it
                    d) Space. keep Social distance
                    e) Home. Stay if you can"

         ;;

    "2") read -p "Enter Number A: " numA
         read -p "Enter Number B: " numB
         echo    "Arithmetical Functions
                    1.- Add
                    2.- Multiply
                    3.- Division"
         echo -e "\n"
         read -p "Choose Arithmetical Function: " aritmetica

         case $aritmetica in

              "1")  funcion="Add"
                    numC=$((numA + numB));;
              "2")  funcion="Product"
                    numC=$((numA * numB));;
              "3")  funcion="Division"
                    numC=$((numA / numB));;
                *)  funcion="Function Not defined"
                    echo "Wrong Option";;
         esac

            echo "Mathematical result $funcion: $numC "
         ;;

    "3") read -p "Enter Phone Number: " telefono

            if [[ $telefono =~ $telRegex2 ]]; then
                echo "Wright Format  inside EEUU"
            else
            phone=$telefono
            plainPhone=$(echo $phone | sed "s/[()-.]//g")
            echo "Formato Incorrect inside  EEUU"
            read -n1 -p "Do you want to convert Phone Number format into (123)456.7890 s/n:  "  resp
            echo -e "\n$resp"
             if [ $resp = "s" ]; then
              formatedPhone2=$(echo $plainPhone | sed "s/\([0-9]\{3\}\)\([0-9]\{3\}\)\([0-9]*\)/(\1) \2 . \3/")
              echo "Converted phone number: $formatedPhone2 "
             else
                 echo "Thanks for your time"
             fi
            fi
            ;;

    "4") read -p "Enter the Directory Path: " dirPath
            if [[ -d $dirPath  ]]; then
                echo "Directory $dirPath do Exist"

                else
                    echo "Directorio DO NOT Exist o IS NOT a directorio"
            fi


        ;;

     "5") read -p "Enter file Path: " filePath
         if [[ -e $filePath  ]]; then
             cat $filePath
         else
             echo "File DID NOT Found"
         fi

         ;;

    "6") echo "Quiting...";;
      *) echo "Wrong Option, Sorry"
esac









                                                                                                reto4.sh                                                                                            0000755 0000000 0000000 00000004160 13641143511 011150  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
# Programa para ejemplificar el uso del Break y Continue
#Arnoldo Alvarez

opcion=0

while :
do
    #Limpiar la pantalla
    clear
    #Desplegar el menu de opciones
    echo "****************************************"
    echo "    Programa de Utilidades Varias       "
    echo "****************************************"
    echo "           MENU PRINCIPAL               "
    echo "////////////////////////////////////////"
    echo "1.Procesos Actuales                     "
    echo "2.Memoria Disponible                    "
    echo "3.Espacio en Disco                      "
    echo "4.Informacion de red                    "
    echo "5.Variables de entornos Config          "
    echo "6.Informacion Programa                  "
    echo "7.Backup Informacion                    "
    echo "8.Salir                                 "

    #Leer los datos del Usuario - Capturar  Opcion
    read -n1 -p "Ingrese una opcion [1-8]: " opcion

    #Validar la opcion ingresada
    case $opcion in
        1) echo -e "\nPreparando para ver Procesos Actuales..."
            sleep 3
            top
            #sleep 3
            ;;
        2) echo -e "\nMemoria Disponible...."
            sleep 3
            vm_stat
            sleep 5
            ;;

        3) echo -e "\nEspacio en Disco...."
            df -h
            sleep 3
            ;;

        4) echo -e "\nInformacion de red...."
            sleep 3
            netstat -r
            sleep 5
            ;;

        5) echo -e "\nVariables de Entorno Configuradas...."
            echo $PATH
            sleep 5
            ;;

        6) echo -e "\nInformacion Programa...."
            sleep 3
            for item in ${info[*]}
             do
                 echo $item
             done
             sleep 5
            ;;

        7) echo -e "\nHaciendo Respaldo del directorio /shellCourse, espere...."
            sleep 5
            sudo cp /shellCourse/*.sh /shellCourse/backup_directory
            echo "Respaldo Finalizado.."
            sleep 3
            ;;

        8) echo -e "\nEscoja una Opcion...."
            exit 0
            ;;
    esac
done




                                                                                                                                                                                                                                                                                                                                                                                                                reto5.sh                                                                                            0000755 0000000 0000000 00000012022 13641143511 011145  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
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
FILE=log.txt
DATE=`date +%y%m%d`
TIME=`date +%H%M%S`

#Se crea un archivo .log con fecha y hora y se mueve a un directorio de logs_reto5
NEWFILE=${FILE%.*}_`date +%Y%m%d`_`date +%H%M%S`.${FILE#*.}
touch $NEWFILE
mv $NEWFILE logs_reto5/
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

                    echo "$DATE-$TIME --- Instrucciones Consultadas" >> logs_reto5/$NEWFILE

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
                    echo "$DATE-$TIME --- Opcion No encontrada,Funcion Matematica NO realizada"   >> logs_reto5/$NEWFILE
                    echo "Opcion incorrecta";;
         esac

            echo "Resultado Matematico de la $funcion: $numC "
            echo "$DATE-$TIME --- Usuario realiza funcion matematica $funcion:$numC" >> logs_reto5/$NEWFILE
            sleep 5
            ;;

    "3")    echo -e "\n"
            echo "$DATE-$TIME --- Usuario escoge chequear formato de numero telefonico" >> logs_reto5/$NEWFILE
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
              echo "$DATE-$TIME --- Usuario cambia formato del Numero Telefonico $telefono" >> logs_reto5/$NEWFILE
             else

                 echo "$DATE-$TIME --- Usuario responde NO para cambiar formato de  $telefono" >> logs_reto5/$NEWFILE
                 echo "Volviendo al Menu Principal..."
             fi
            fi

            sleep 5
            ;;

    "4") echo -e "\n"
         read -p "Ingrese la ruta de un directorio: " dirPath
            if [[ -d $dirPath  ]]; then

                echo "$DATE-$TIME --- Usuario consulta satisfactoriamente el directorio $dirPath" >> logs_reto5/$NEWFILE
                echo "El directorio $dirPath SI Existe"

                else
                    echo "El directorio NO Existe o NO es un directorio"
                    echo "$DATE-$TIME --- Usuario No encuentra $dirPath" >> logs_reto5/$NEWFILE
            fi

            sleep 5

        ;;

     "5")echo -e "\n"
         read -p "Ingrese la ruta del archivo: " filePath
         if [[ -e $filePath  ]]; then
             echo "$DATE-$TIME --- Usuario consulta el archivo $filePath" >> logs_reto5/$NEWFILE
             cat $filePath
         else
             echo "No se encuentra el archivo o Nombre de archivo Incorrecto"
             echo "$DATE-$TIME --- Usuario No encuentra $filePath" >> logs_reto5/$NEWFILE
         fi
         sleep 6

         ;;

    "6")    echo -e "\n"
            echo -e "Saliendo..."
            echo "$DATE-$TIME --- Usuario sale de la aplicacion" >> logs_reto5/$NEWFILE
            exit 0

            ;;

      *) echo "Opcion Incorrecta, Lo sentimos"
esac
done









                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              reto6.sh                                                                                            0000755 0000000 0000000 00000014355 13641143511 011161  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
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









                                                                                                                                                                                                                                                                                   utilityHost.sh                                                                                      0000755 0000000 0000000 00000000241 13641143511 012450  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
 #Reto1 del Curso de Programcion en Bash

 nombre=$1
 telefono=$2

 echo "Nombre ingresado: $option"
 echo "Numero telefonico ingresado: $result"

                                                                                                                                                                                                                                                                                                                                                               validatePhone.sh                                                                                    0000755 0000000 0000000 00000001746 13641143511 012705  0                                                                                                    ustar   root                            root                                                                                                                                                                                                                   # ! /bin/bash
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



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          