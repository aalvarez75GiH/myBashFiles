# ! /bin/bash
# Programa para ejemplificar el uso del Break y Continue
#Arnoldo Alvarez

opcion=0
fechaActual=`date +%Y%m%d`
FILE=log.txt
DATE=`date +%y%m%d`
TIME=`date +%H%M%S`



 #Esta es la funcion instalar PostGres
instalar_postgres () {
 DATE=`date +%y%m%d`
 TIME=`date +%H%M%S`
 echo "$DATE-$TIME --- Usuario ingresa al modulo de Instalacion de Postgres" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
 echo -e "\nVerificando Estado de PostgresSQL"
 sleep 3
 verifyInstall=$(which psql)
 if [ $? -eq 0 ]; then
     echo "PostGres ya se encuentra instalado en el equipo "
     echo "$DATE-$TIME --- Instento de Instalacion fallido: Postgres ya esta instaldo" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
     #sudo -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_install_err.txt 
     sudo sed -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_install_err.txt 
     sudo rm /home/ubuntu/shellCourse/mails_formats/*.bak 
     echo "Usuario ingresa al modulo de Instalacion de Postgres" >> mails_formats/mail_install_err.txt
     echo "Usuario intenta instalar Postgres pero el mismo ya se encuentra instalado" >> mails_formats/mail_install_err.txt
     sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_install_err.txt
 else
      read -s -p "Introduzca password de Admin para proceder a Instalar Postgres " password
      echo -e "\n"
      read -s -p "Introduzca el password para el usuario postgres " passwordPostgres
      echo "$password" | sudo -S apt update
      echo "$password" | sudo -S apt-get -y install postgresql postgresql-contrib
      sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '{$passwordPostgres}';"
      echo "$password" | sudo -S systemctl enable postgresql.service
      echo "$password" | sudo -S systemctl start postgresql.service
      sudo sed -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_install.txt 
      sudo rm /home/ubuntu/shellCourse/mails_formats/*.bak 
      echo "Usuario ingresa al modulo de Instalacion de Postgres" >> mails_formats/mail_install.txt
      echo "Usuario ha instalado Postgres con exito" >> mails_formats/mail_install.txt
      sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_install.txt
      echo "$DATE-$TIME --- Instalacion de Postgres satisfactoria" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
 fi

 echo -e "\nInstalacion Finalizada.."
 sleep 3 
 read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}

#Esta es la funcion desinstalar PostGres
desinstalar_postgres () {

    DATE=`date +%y%m%d`
    TIME=`date +%H%M%S`
    echo "$DATE-$TIME --- Usuario ingresa al modulo de Desinstalacion de Postgres" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
    echo -e "\nVerificando Estado de PostgresSQL..."
    sleep 3
    verifyInstall=$(which psql)
    if [ $? -eq 1 ]; then
        echo " PostGres NO se encuentra instalado en el Equipo "
	echo "$DATE-$TIME --- Intento de desinstalacion Fallida: Ya desinstalado" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
        sudo sed -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_uninstall_err.txt 
     	sudo rm /home/ubuntu/shellCourse/mails_formats/*.bak 
	echo "Usuario ingresa al modulo de Desinstalacion de Postgres" >> mails_formats/mail_uninstall_err.txt
     	echo "Usuario intenta desinstalar Postgres pero el mismo ya se encuentra desinstalado" >> mails_formats/mail_uninstall_err.txt
     	sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_uninstall_err.txt
    else
        read -s -p "Introduzca password de Admin para proceder a Desinstalar Postgres " password
	echo -e "\n"
	echo "$password" | sudo -S systemctl stop postgresql.service
       	echo "$password" | sudo -S apt-get -y --purge remove postgresql\*
       	echo "$password" | sudo -S rm -r /etc/postgresql
        echo "$password" | sudo -S rm -r /etc/postgresql-common
       	echo "$password" | sudo -S rm -r /var/lib/postgresql
	echo "$password" | sudo -S userdel -r postgres
        echo "$password" | sudo -S groupdel postgresql
        sudo sed -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_uninstall.txt 
     	sudo rm /home/ubuntu/shellCourse/mails_formats/*.bak 
        echo "Usuario ingresa al modulo de Desinstalacion de Postgres" >> mails_formats/mail_uninstall.txt
        echo "Usuario ha Desinstalado Postgres con exito" >> mails_formats/mail_uninstall.txt
        sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_uninstall.txt
	echo "$DATE-$TIME --- Desinstalacion de Postgres satisfactoria" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
	echo -e "\nDesinstalacion Finalizada..."
	sleep 3
fi

read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}

#Esta es la funcion Sacar Respaldo
sacar_respaldo () {
DATE=`date +%y%m%d`
TIME=`date +%H%M%S`
echo "$DATE-$TIME --- Usuario entra al modulo Sacar Respaldo" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
echo "Listando BD disponibles para Respaldar..."
sleep 3
sudo -u postgres psql -c "\l"
read -p "Ingrese nombre de BD a Respaldar: " bddRespaldo
echo -e "\n"
	if [ -d "$1" ]; then
		echo "Estableciendo permisos del directorio"
		sleep 3
		echo "$password" | sudo -S chmod 755 $1
		echo "Realizando respaldo..."
		sleep 3
		sudo -u postgres pg_dump -Fc $bddRespaldo > "$1/bddRespaldo$fechaActual.bak"
		echo "Respaldo realizado Correctamente en la ubicacion: $1/bddRespaldo$fechaActual.bak"
		echo "$DATE-$TIME --- Respaldo realizado:bddRespaldo$fechaActual.bak" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
                sudo sed -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_respaldo.txt 
     	        sudo rm /home/ubuntu/shellCourse/mails_formats/*.bak 
		echo "Nombre del Backup creado $1/bddRespaldo$fechaActual.bak" >> mails_formats/mail_respaldo.txt
		sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_respaldo.txt

	else
		echo -e  "\nEl directorio $1 No Existe"
		echo -e "\n"
		read -n1 -p "Desea crear el directorio $1 (s/n)" respbdd
		if [ $respbdd = "s" ]; then
			sudo mkdir $1
			echo "$password" | sudo -S chmod 755 $1
		       	echo -e "\nRealizando respaldo..."
			echo "$DATE-$TIME --- Directorio $1 creado con Exito" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
			sleep 3
			sudo -u postgres pg_dump -Fc $bddRespaldo > "$1/bddRespaldo$fechaActual.bak"
			echo "Respaldo realizado Correctamente en la ubicacion: $1/bddRespaldo$fechaActual.bak"
			echo "$DATE-$TIME --- Respaldo realizado:bddRespaldo$fechaActual.bak" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
                        sudo sed -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_respaldo.txt 
     	                sudo rm /home/ubuntu/shellCourse/mails_formats/*.bak 
			echo "Nombre del Backup creado: $1/bddRespaldo$fechaActual.bak" >> mails_formats/mail_respaldo.txt
			sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_respaldo.txt
		else
			
			echo "$DATE-$TIME --- Saliendo sin finalizar Respaldo" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
			echo -e "\nSaliendo sin realizar Respaldo..."
			sleep 3
		fi

		fi

read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}


#Esta es la funcion Restaurar Respaldo
restaurar_respaldo () {
DATE=`date +%y%m%d`
TIME=`date +%H%M%S`
echo "$DATE-$TIME --- Usuario entra al modulo Restaurar Respaldo" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
read -p "Ingresar el directorio donde se encuentran los respaldos   " directorioBackup
if [ -d $directorioBackup ]; then 

echo "Listando archivos de Respaldo disponibles para restaurar..."
sleep 3
fileToRestore=$(ls $directorioBackup | grep %*.bak)
echo "$fileToRestore"
read -p "Ingresar el archivo .bak a restaurar:  " respaldoRestaurar
#echo -e "\n"
if [ -f "$directorioBackup/$respaldoRestaurar" ]; then

	read -p "Ingrese nombre de BD a restaurar:  " bdDestino
        echo -e "\nVerificando disponibilidad de la BD: $bdDestino"	
	verifyBdd= $(sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -wq $bdDestino)
	if [ $? -eq 0 ]; then
		  echo "Restaurando en la Base de Datos destino: $bdDestino"
		  sudo -u postgres pg_restore -Fc -d $bdDestino "$directorioBackup/$respaldoRestaurar"
		  echo "$DATE-$TIME --- Archivo $respaldoRestaurar restaurado con Exito" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
		  echo "$DATE-$TIME --- $respaldoRestaurar restaurado en BD: $bdDestino" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
                  sudo sed -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_restauracion.txt 
     	          sudo rm /home/ubuntu/shellCourse/mails_formats/*.bak 
		  echo "Archivo de BD  Restaurado $directorioBackup/$respaldoRestaurar" >> mails_formats/mail_restauracion.txt
		  echo "Nueva BD creada con exito $bdDestino " >> mails_formats/mail_restauracion.txt
		  sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_restauracion.txt
	       	  echo "Listar Bases de datos..."
      		  sudo -u postgres psql -c "\l"
	   else
	 	  echo  "La BD destino no se encuentra..."
		  echo  "Creando Base de Datos destino..."
		  sleep 4
		  sudo -u postgres psql -c "CREATE DATABASE $bdDestino"
		  sudo -u postgres pg_restore -Fc -d $bdDestino "$directorioBackup/$respaldoRestaurar"
		  echo -e "\nBase de datos $bdDestino creada satisfactoriamente..."
	       	  echo "Listar Bases de datos..."
      		  sudo -u postgres psql -c "\l"
		  echo "$DATE-$TIME --- Archivo $respaldoRestaurar restaurado con Exito" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
		  echo "$DATE-$TIME --- $respaldoRestaurar restaurado en BD: $bdDestino" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
                  sudo sed -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_restauracion.txt 
     	          sudo rm /home/ubuntu/shellCourse/mails_formats/*.bak 
		  echo "Archivo de BD Restaurado $directorioBackup/$respaldoRestaurar" >> mails_formats/mail_restauracion.txt
		  echo "Nueva BD creada con exito $bdDestino " >> mails_formats/mail_restauracion.txt
		  sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_restauracion.txt
	  fi
      
else
	echo "No se encuentra el archivo de Respaldo Ingresado"
	echo "Verifique nuevamente el nombre y vuelva a intentarlo..."
	echo "$DATE-$TIME --- No se encontro el archivo de Respaldo Ingresado" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
        sudo sed -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_restauracion_err.txt 
     	sudo rm /home/ubuntu/shellCourse/mails_formats/*.bak 
     	echo "Usuario ingresa nombre de Archivo de Respaldo NO encontrado" >> mails_formats/mail_restauracion_err.txt
     	sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_restauracion_err.txt
fi
else
	echo "No se encuentra el directorio de Respaldos ingresado..."
	echo "Verifique nuevamente el nombre y vuelva a intentarlo..."
	echo "$DATE-$TIME --- No se encontro el Directorio de Respaldo Ingresado" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
        sudo sed -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_restauracion_err.txt 
     	sudo rm /home/ubuntu/shellCourse/mails_formats/*.bak 
     	echo "Usuario ingresa nombre de Directorio de Respaldo NO encontrado" >> mails_formats/mail_restauracion_err.txt
     	sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_restauracion_err.txt
fi

read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}

lista_de_BD(){
DATE=`date +%y%m%d`
TIME=`date +%H%M%S`
echo -e  "\Las Bases de Datos Actuales: "
sudo -u postgres psql -c "\l"
echo "$DATE-$TIME --- Usuario consulta lista de Bases de Datos existentes" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}

#A partir de aqui estan las sub funciones relacionadas con AWS
List_Backups_AWS(){
DATE=`date +%y%m%d`
TIME=`date +%H%M%S`
echo -e "\nListando archivos de Respaldos en la nube..."
sleep 3
fileToList=$(aws s3 ls  s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/ | grep %*.bak)
if [ $? = 0 ]; then
	aws s3 ls s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/ | grep %*.bak
	echo "$DATE-$TIME --- Usuario consulta lista de Respaldos almacenados en AWS" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
else
	echo "No hay Archivos de Respaldos en AWS"

fi
	
read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}


Upload_Backups_AWS(){
DATE=`date +%y%m%d`
TIME=`date +%H%M%S`
echo "$DATE-$TIME --- Usuario Ingresa al modulo de carga hacia AWS" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
read -p "Ingresar el directorio donde se encuentran los respaldos   " directorioBackup
if [ -d $directorioBackup ]; then 
echo "Listando archivos de Respaldos disponibles..."
sleep 3
filesToUpload=$(ls $directorioBackup | grep %*.bak)
echo "$filesToUpload"
echo -e "\nPuede escoger una de las opciones siguientes:"
echo "1.Cargar solo un archivo especifico"
echo "2.Cargar todos los archivos"
echo "3.Salir sin cargar Archivo"
echo -e "\n"
read -n 1 -p "Ingrese una opcion: " opcion
#read -n 1 -p "Desea cargar estos archivos de respaldo en la nube (s/n)" resp

#-----------------------------------------------------------------
case $opcion in
	1)echo -e "\n" 
	read -p "Ingrese nombre del Archivo a Cargar:  " nombreCarga  
	fileToUpload=$(ls $directorioBackup | grep $nombreCarga) 
 if [ $? = 0 ]; then
	aws s3 cp $directorioBackup/$nombreCarga s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/
        sudo sed -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_Upload_AWS.txt
        sudo rm /home/ubuntu/shellCourse/mails_formats/*.bak
        echo -e "\n Ha cargado un archivo de respaldo correctamente..."   
        echo "El Usuario ha ingresado en el modulo de Carga en AWS y ha realizado la tarea siguiente.."  >> mails_formats/mail_Upload_AWS.txt
        echo "El archivo $nombreCarga ha sido cargados en AWS" >> mails_formats/mail_Upload_AWS.txt
        echo "$DATE-$TIME --- Archivo $nombreCarga enviados a AWS con Exito" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
        sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_Upload_AWS.txt
else
       echo -e "\nArchivo NO encontrado..."	
fi 

        ;;

	2)
	#aws s3 cp $directorioBackup/$filesToUpload s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/
        sudo aws s3 cp $directorioBackup/$filestoUpload s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/ --recursive 

	sudo sed -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_Upload_AWS.txt
        sudo rm /home/ubuntu/shellCourse/mails_formats/*.bak
        echo -e "\n Se han cargado todos los archivos de $directorioBackup -- OK"   
        echo "El Usuario ha ingresado en el modulo de Carga en AWS y ha realizado la tarea siguiente.."  >> mails_formats/mail_Upload_AWS.txt
        echo "Los Archivos contenidos en $directorioBackup han sido cargados en AWS" >> mails_formats/mail_Upload_AWS.txt
        echo "$DATE-$TIME --- Archivos en $directorioBackup enviados a AWS con Exito" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
        sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_Upload_AWS.txt

	;;

	3)
	echo -e  "\nCarga de Archivos en AWS cancelada..."
	echo "$DATE-$TIME --- Usuario cancela Carga de Archivos a AWS" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
        sudo sed -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_Upload_AWS_err.txt 
     	sudo rm /home/ubuntu/shellCourse/mails_formats/*.bak 
	echo "Usuario ha cancelado Upload hacia AWS" >> mails_formats/mail_Upload_AWS_err.txt
	sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_Upload_AWS_err.txt
	;;

esac

#-----------------------------------------------------------------

else

	echo "$DATE-$TIME --- No se encontro el directorio de Respaldos Ingresado" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
	echo "No se encuentra el directorio de Respaldos ingresado..."
	echo "Verifique nuevamente el nombre y vuelva a intentarlo..."
        sudo sed -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_Upload_AWS_err.txt 
     	sudo rm /home/ubuntu/shellCourse/mails_formats/*.bak 
	echo "Upload hacia AWS NO Realizado - NO se encuentra el Directorio" >> mails_formats/mail_Upload_AWS_err.txt
	sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_Upload_AWS_err.txt
fi

read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}


Download_Backups_AWS(){
DATE=`date +%y%m%d`
TIME=`date +%H%M%S`
echo "$DATE-$TIME --- Usuario Ingresa al modulo de Descarga desde AWS" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
fileToDownload=$(aws s3 ls s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/ | grep %*.bak)
if [ $? = 0 ]; then
       echo -e "\nListando archivos de Respaldos disponibles en la nube..."
       sleep 3
       aws s3 ls  s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/ | grep %*.bak
       read -p "Introduzca nombre del archivo de respaldo que desea descargar de AWS:  " nombreDescarga
       verifyBakAWS=$(aws s3 ls  s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/ | grep $nombreDescarga)
       if [ $? = 0 ]; then
       echo -e "\nArchivo encontrado satisfactoriamente..."
       nombreCarpeta="AWS_Recovered_Files"
       echo -e  "\nSe va a crear un directorio para estos archivos con el nombre de: $nombreCarpeta$fechaActual" 
       mkdir /home/ubuntu/shellCourse/downloadsFromAWS/$nombreCarpeta$fechaActual
       aws s3 cp s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/$nombreDescarga  /home/ubuntu/shellCourse/downloadsFromAWS/$nombreCarpeta$fechaActual
       echo -e "\nArchivo .bak descargado satisfactoriamente en: $nombreCarpeta$fechaActual"
       echo "$DATE-$TIME --- Archivo $nombreDescarga Descargado de AWS con Exito" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
       echo "$DATE-$TIME --- Archivo descargado en $nombreCarpeta$fechaActual" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
       sudo sed -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_Download_AWS.txt 
       sudo rm /home/ubuntu/shellCourse/mails_formats/*.bak 
       echo "Archivo $nombreDescarga  ha sido descargado satisfactoriamente desde AWS" >> mails_formats/mail_Download_AWS.txt
       echo "Archivo $nombreDescarga  descargado desde AWS en la ruta: $nombreCarpeta$fechaActual" >> mails_formats/mail_Download_AWS.txt
       sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_Download_AWS.txt
       else

        echo -e "\nNombre de archivo Incorrecto o NO existe..."
        echo "$DATE-$TIME --- Archivo $nombreDescarga NO encontrado en AWS" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
        sudo sed -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_Download_AWS_err.txt 
     	sudo rm /home/ubuntu/shellCourse/mails_formats/*.bak 
        echo "Se Cancela Descarga desde AWS - No se encuentra archivo Ingresado" >> mails_formats/mail_Download_AWS_err.txt
        sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_Download_AWS_err.txt
fi
else
        echo -e "\nNo hay archivos para Descargar "
        echo "$DATE-$TIME --- No hay Archivos para Descargar desde AWS" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
        sudo sed -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_Download_AWS_err.txt 
     	sudo rm /home/ubuntu/shellCourse/mails_formats/*.bak 
        echo "Se Cancela Descarga desde AWS - No hay archivos para Descargar" >> mails_formats/mail_Download_AWS_err.txt
        sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_Download_AWS_err.txt
fi


read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}


Delete_Backups_AWS(){
DATE=`date +%y%m%d`
TIME=`date +%H%M%S`
echo "$DATE-$TIME --- Usuario Ingresa al modulo de Eliminacion de Archivos en  AWS" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
fileToDelete=$(aws s3 ls s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/ | grep %*.bak)
if [ $? = 0 ]; then
echo -e "\nListando archivos de Respaldos disponibles en la nube..."
sleep 3
aws s3 ls  s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/ | grep %*.bak
read -p "Introduzca el archivo de Respaldo que desea Eliminar: " nombrebak
verifyBakAWS=$(aws s3 ls  s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/ | grep $nombrebak)
if [ $? = 0 ]; then
echo -e "\nArchivo encontrado satisfactoriamente..."
aws s3 rm  s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/$nombrebak
sudo sed -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_Delete_AWS.txt 
sudo rm /home/ubuntu/shellCourse/mails_formats/*.bak 
echo -e "\nEl archivo $nombrebak ha sido eliminado satisfactoriamente de AWS"
echo "El Usuario ha ingresado en el modulo de Eliminacion en  AWS y ha realizado la tarea siguiente.. "  >> mails_formats/mail_Delete_AWS.txt
echo "El archivo $nombrebak se ha eliminado satirfactoriamente de AWS" >> mails_formats/mail_Delete_AWS.txt
sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_Delete_AWS.txt
echo "$DATE-$TIME --- Archivo $nombrebak Eliminado de AWS con Exito" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
else
        echo -e "\nNombre de archivo Incorrecto o NO existe..."
        echo "$DATE-$TIME --- Archivo $nombrebak NO encontrado en AWS" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
        sudo sed -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_Delete_AWS_err.txt 
     	sudo rm /home/ubuntu/shellCourse/mails_formats/*.bak 
        echo "Se Cancela Eliminacion en  AWS - Nombre de archivo Ingresado No se encuentra" >> mails_formats/mail_Delete_AWS_err.txt
        sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_Delete_AWS_err.txt
fi
else
	echo -e "\nNo hay archivos para Eliminar"
        echo "$DATE-$TIME --- No hay Archivos para Eliminar en AWS" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
        sudo sed -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_Delete_AWS_err.txt 
     	sudo rm /home/ubuntu/shellCourse/mails_formats/*.bak 
        echo "Se Cancela Eliminacion en  AWS - No hay archivos para Eliminar en AWS" >> mails_formats/mail_Delete_AWS_err.txt
        sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_Delete_AWS_err.txt
fi



read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}

#-------------- CREATION OF LOG FILE ----------------------------------------------------
NEWFILE=${FILE%.*}_${DATE}_${TIME}.${FILE#*.}
touch $NEWFILE
mv $NEWFILE /home/ubuntu/shellCourse/logs_PGU/
echo "$DATE-$TIME --- Usuario entrando al Sistema..." >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
#---------------------------------------------------------------------------------------

while :
do
    #Limpiar la pantalla
    clear
    #Captar fecha y hora
    DATE=`date +%y%m%d`
    TIME=`date +%H%M%S`
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

        3) verifyInstall=$(which psql)
		if [ $? -eq 1 ]; then
			clear
			echo -e "\nPostGres NO se encuentra instalado en el Equipo "
	  		echo  "Instale Postgres y vuelva a intentar esta Operacion..."
			echo "$DATE-$TIME --- Error - Postgres NO instalado" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
			echo "$DATE-$TIME --- Modulo: Sacar Respaldo BD Local" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
			echo "Error:Intento de Respaldo Fallido"  >> mails_formats/mail_Verify1.txt
        		sudo sed -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_Verify1.txt 
     			sudo rm /home/ubuntu/shellCourse/mails_formats/*.bak 
			echo "Usuario intenta hacer respaldo pero Postgresql NO se encuentra instalado" >> mails_formats/mail_Verify1.txt
			sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_Verify1.txt
			read -n 1 -s -r -p "Presione [ENTER] para continuar..."
		else
			echo -e "\n"
			read -p "Indique Directorio: " directorioBackup
			sacar_respaldo $directorioBackup
		fi

            ;;

        4) verifyInstall=$(which psql)
		if [ $? -eq 1 ]; then
			clear
			echo -e "\nPostGres NO se encuentra instalado en el Equipo "
	  		echo  "Instale Postgres y vuelva a intentar esta Operacion..."
			echo "$DATE-$TIME --- Error - Postgres NO instalado" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
			echo "$DATE-$TIME --- Modulo: Restaurar Respaldo BD Local" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
			echo "Error:Intento de Restauracion Fallida"  >> mails_formats/mail_Verify2.txt
        		sudo sed -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_Verify2.txt 
     			sudo rm /home/ubuntu/shellCourse/mails_formats/*.bak 
			echo "Usuario intenta restaurar una BD pero Postgresql NO se encuentra instalado" >> mails_formats/mail_Verify2.txt
			sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_Verify2.txt
			read -n 1 -s -r -p "Presione [ENTER] para continuar..."
		else
			echo -e "\n"
			restaurar_respaldo $directorioRespaldos
		fi

           
            ;;
    	
    	5) verifyInstall=$(which psql)
		if [ $? -eq 1 ]; then
			clear
			echo -e "\nPostGres NO se encuentra instalado en el Equipo "
	  		echo  "Instale Postgres y vuelva a intentar esta Operacion..."
			echo "$DATE-$TIME --- Error - Postgres NO instalado" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
			echo "$DATE-$TIME --- Modulo: Listar BD's Locales" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
			echo "Error:Intento de Listar BD Fallido"  >> mails_formats/mail_Verify3.txt
        		sudo sed -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_Verify3.txt 
     			sudo rm /home/ubuntu/shellCourse/mails_formats/*.bak 
			echo "Usuario intenta Listar BD pero Postgresql NO se encuentra instaldo" >> mails_formats/mail_Verify3.txt
			sudo ssmtp arnoldo_alvarez@hotmail.com < mails_formats/mail_Verify3.txt
			read -n 1 -s -r -p "Presione [ENTER] para continuar..."
		else
			echo -e "\n"
		lista_de_BD 
	fi
	       	;;

        
    	6) echo "$DATE-$TIME --- Usuario hace uso de  Modulo AWS" >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
	while :
	do
    	DATE=`date +%y%m%d`
    	TIME=`date +%H%M%S`
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
	   echo "$DATE-$TIME --- Usuario sale del Modulo AWS " >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
	  
	break
            ;;
	esac
done
	;;
    
    	7) 
	   echo -e "\nSaliendo del programa...."
	   echo "$DATE-$TIME --- Usuario saliendo del  Sistema..." >> /home/ubuntu/shellCourse/logs_PGU/$NEWFILE
            exit 0
            ;;
    esac
done

