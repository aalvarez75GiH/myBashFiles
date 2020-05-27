# ! /bin/bash
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




