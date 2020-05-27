# ! /bin/bash
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


