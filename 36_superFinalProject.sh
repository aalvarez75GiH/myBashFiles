# ! /bin/bash
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
		echo "Nombre del Backup creado: $1/bddRespaldo$fechaActual.bak" >> mails_formats/mail_respaldo.txt
		echo "Se ha enviado un correo electronico"
		sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_respaldo.txt

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
			echo "Nombre del Backup creado: $1/bddRespaldo$fechaActual.bak" >> mails_formats/mail_respaldo.txt
			echo "Se ha enviado un correo electronico"
			sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_respaldo.txt
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
		  echo "Base de datos Restaurada: $directorioBackup/$respaldoRestaurar" >> mails_formats/mail_restauracion.txt
		  echo "Se ha enviado un correo electronico"
		  sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_restauracion.txt
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
		  echo "Base de datos Restaurada: $directorioBackup/$respaldoRestaurar" >> mails_formats/mail_restauracion.txt
		  echo "Se ha enviado un correo electronico"
		  sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_restauracion.txt
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

#A partir de aqui estan las sub funciones relacionadas con AWS
List_Backups_AWS(){
echo -e "\nListando Respaldos en AWS..."
sleep 3
aws s3 ls  s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/

read -n 1 -s -r -p "Presione [ENTER] para continuar..."
}


Upload_Backups_AWS(){
#echo -e "\nCargando BD en AWS..."
read -p "Ingresar el directorio donde se encuentran los respaldos   " directorioBackup
if [ -d $directorioBackup ]; then 
echo "Listando los archivos de Respaldos..."
sleep 3
ls -la $directorioBackup
read -n1 -p "Desea enviar estos archivos .bak a la nube de AWS (s/n)" resp
if [ $resp="s" ]; then
	echo -e "\nEnviando respaldo a la nube..."
	sleep 2
        aws s3 cp $directorioBackup s3://p3rolixbucket2/PruebaBucket/RespaldosAWS --recursive
	echo "Los Archivos de $directorioBackup han sido cargados en AWS" >> mails_formats/mail_Upload_AWS.txt
	echo "Se ha enviado un correo electronico"
	sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_Upload_AWS.txt
else
	echo -e  "C\nCarga de archivos cancelada..."
fi
else

	echo "No se encuentra el directorio de Respaldos ingresado..."
	echo "Verifique nuevamente el nombre y vuelva a intentarlo..."
fi

read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}


Download_Backups_AWS(){
echo -e "\ndescargando BD en AWS..."
sleep 3
read -n 1 -s -r -p "Presione [ENTER] para continuar..."
}


Delete_Backups_AWS(){
echo -e "\nListando Respaldos en AWS..."
sleep 3
aws s3 ls  s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/
read -p "Introduzca el archivo .bak que desea eliminar en AWS..." nombrebak
aws s3 rm  s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/$nombrebak
echo -e "\nEl archivo $nombrebak ha sido eliminado satisfactoriamente de AWS"
echo "El archivo $nombrebak se ha eliminado satirfactoriamente de AWS" >> mails_formats/mail_Delete_AWS.txt
echo "Se ha enviado un correo electronico"
sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_Delete_AWS.txt
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
    echo "6.Tareas en Amazon Web Services         " 
    echo "7.Salir                                 "

    #Leer los datos del Usuario - Capturar  Opcion
    read -n1 -p "Ingrese una opcion [1-7]: " opcion

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

        
    	6) 
	while :
	do
	#Limpiar la pantalla
    	clear

    echo "----------------------------------------"
    echo "    TAREAS EN AMAZON WEB SERVICES       "
    echo "----------------------------------------"
    echo "               SUB MENU                 "
    echo "----------------------------------------"
    echo "1.Listar BD   - AWS Bucket              "
    echo "2.Upload Respaldos   - AWS Bucket       "
    echo "3.Download Respaldos - AWS Bucket       "
    echo "4.Eliminar Respaldos - AWS Bucket       "
    echo "5.Ir al menu Principal                  "

    #Leer los datos del Usuario - Capturar  Opcion
    read -n1 -p "Ingrese una opcion [1-5]: " opcion

    #Validar la opcion ingresada
    case $opcion in
        1) echo -e "\n"
	   List_Backups_AWS

          #sleep 3
            ;;
        2) echo -e "\n"
	   Upload_Backups_AWS

          #sleep 3
            ;;

        3) echo -e "\n"
	   Download_Backups_AWS

          #sleep 3
            ;;
        4) echo -e "\n"
	   Delete_Backups_AWS

          #sleep 3
            ;;
        5) echo -e "\nSaliendo al Menu Principal..."

          #sleep 3
	  break
            ;;
	esac
done
	;;
    
    	7) echo -e "\nSaliendo del programa...."
            exit 0
            ;;
    esac
done

