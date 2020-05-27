# ! /bin/bash
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




