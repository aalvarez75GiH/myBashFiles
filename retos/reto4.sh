# ! /bin/bash
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




