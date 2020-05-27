# ! /bin/bash
# Programa para ejemplificar el uso del Break y Continue
#Arnoldo Alvarez

opcion=0
fechaActual=`date +%Y%m%d`
FILE=log.txt
DATE=`date +%y%m%d`
TIME=`date +%H%M%S`
pin=""
pin_final=""
pin_inicial=""
local_email_Address="" 
intentos=3
hidden_PIN=""
respInicio=""

#Esta es la funcion instalar PostGres
instalar_postgres () {
 DATE=`date +%y%m%d`
 TIME=`date +%H%M%S`
 echo "$DATE-$TIME --- Usuario ingresa al modulo de Instalacion de Postgres" >> $logs_path/$NEWFILE
 echo -e "\nVerificando Estado de PostgresSQL"
 sleep 3
 verifyInstall=$(which psql)
 if [ $? -eq 0 ]; then
     echo "PostGres ya se encuentra instalado en el equipo "
     echo "$DATE-$TIME --- Instento de Instalacion fallido: Postgres ya esta instaldo" >> $logs_path/$NEWFILE
     #sudo -i.bak -e '4,100d' /home/ubuntu/shellCourse/mails_formats/mail_install_err.txt 
     sudo sed -i.bak -e '4,100d' $mail_path/mail_install_err.txt 
     sudo rm $mail_path/*.bak 
     echo "Usuario ingresa al modulo de Instalacion de Postgres" >> $mail_path/mail_install_err.txt
     echo "Usuario intenta instalar Postgres pero el mismo ya se encuentra instalado" >> $mail_path/mail_install_err.txt
     sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_install_err.txt
 else
      read -s -p "Introduzca password de Admin para proceder a Instalar Postgres " password
      echo -e "\n"
      read -s -p "Introduzca el password para el usuario postgres " passwordPostgres
      echo "$password" | sudo -S apt update
      echo "$password" | sudo -S apt-get -y install postgresql postgresql-contrib
      sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '{$passwordPostgres}';"
      echo "$password" | sudo -S systemctl enable postgresql.service
      echo "$password" | sudo -S systemctl start postgresql.service
      sudo sed -i.bak -e '4,100d' $mail_path/mail_install.txt 
      sudo rm $mail_path/*.bak 
      echo "Usuario ingresa al modulo de Instalacion de Postgres" >> $mail_path/mail_install.txt
      echo "Usuario ha instalado Postgres con exito" >> $mail_path/mail_install.txt
      sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_install.txt
      echo "$DATE-$TIME --- Instalacion de Postgres satisfactoria" >> $logs_path/$NEWFILE
 fi


}

#Esta es la funcion desinstalar PostGres
desinstalar_postgres () {
     PINCreation
     if [ $hidden_PIN = $pin_final ];then
        #read -s -p  "Ingrese el PIN  nuevamente para confirmar: " numeroPIN
        enmascarar_PIN_Conf
	if [ $hidden_PIN = $pin_final ];then
		echo "$DATE-$TIME --- Usuario usa  PIN $pin_final para Ingresar en Desinstalar Postgresql" >> $logs_path/$NEWFILE
    DATE=`date +%y%m%d`
    TIME=`date +%H%M%S`
    echo "$DATE-$TIME --- Usuario ingresa al modulo de Desinstalacion de Postgres" >> $logs_path/$NEWFILE
    echo -e "\nVerificando Estado de PostgresSQL..."
    sleep 3
    verifyInstall=$(which psql)
    if [ $? -eq 1 ]; then
        echo " PostGres NO se encuentra instalado en el Equipo "
	echo "$DATE-$TIME --- Intento de desinstalacion Fallida: Ya desinstalado" >> $logs_path/$NEWFILE
        sudo sed -i.bak -e '4,100d' $mail_path/mail_uninstall_err.txt 
     	sudo rm $mail_path/*.bak 
	echo "Usuario ingresa al modulo de Desinstalacion de Postgres" >> $mail_path/mail_uninstall_err.txt
     	echo "Usuario intenta desinstalar Postgres pero el mismo ya se encuentra desinstalado" >> $mail_path/mail_uninstall_err.txt
     	sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_uninstall_err.txt
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
        sudo sed -i.bak -e '4,100d' $mail_path/mail_uninstall.txt 
     	sudo rm $mail_path/*.bak 
        echo "Usuario ingresa al modulo de Desinstalacion de Postgres" >> $mail_path/mail_uninstall.txt
        echo "Usuario ha Desinstalado Postgres con exito" >> $mail_path/mail_uninstall.txt
        sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_uninstall.txt
	echo "$DATE-$TIME --- Desinstalacion de Postgres satisfactoria" >> $logs_path/$NEWFILE
	echo -e "\nDesinstalacion Finalizada..."
	sleep 3
	return
     fi
else
	echo -e "\nPIN Incorrecto, Intente de Nuevo.."
	read -n 1 -s -r -p "Presione [ENTER] para continuar..."
        echo "$DATE-$TIME --- Usuario No puede Confirmar PIN de Seguridad - Modulo de Desinstalacion" >> $logs_path/$NEWFILE
        sudo sed -i.bak -e '4,100d' $mail_path/mail_uninstall_err.txt 
     	sudo rm $mail_path/*.bak 
	echo "Usuario ingresa al modulo de Desinstalacion de Postgres" >> $mail_path/mail_uninstall_err.txt
     	echo "PIN NO confirmado - Error al intentar desinstalar Postgres" >> $mail_path/mail_uninstall_err.txt
     	sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_uninstall_err.txt
fi
else
	echo "$DATE-$TIME --- Intento de PIN fallido 3 veces - Modulo de Desinstalacion" >> $logs_path/$NEWFILE
	echo -e "\nPIN Incorrecto, Intente de Nuevo.."
        sudo sed -i.bak -e '4,100d' $mail_path/mail_uninstall_err.txt 
     	sudo rm $mail_path/*.bak 
	echo "Usuario ingresa al modulo de Desinstalacion de Postgres" >> $mail_path/mail_uninstall_err.txt
     	echo "PIN Incorrecto - Error al intentar desinstalar Postgres" >> $mail_path/mail_uninstall_err.txt
     	sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_uninstall_err.txt
	read -n 1 -s -r -p "Presione [ENTER] para continuar..."
fi

}

#Esta es la funcion Crear Base de Datos en Postgres
crear_BD(){
DATE=`date +%y%m%d`
TIME=`date +%H%M%S`
echo "$DATE-$TIME --- Usuario entra al modulo Crear Base de Datos" >> $logs_path/$NEWFILE
echo "Listando BD actuales en Postgres..."
sleep 3
sudo -u postgres psql -c "\l"
read -p "Ingrese nombre de BD a crear: " bddCrear
echo -e "\n"
echo -e "\nVerificando que la BD $bddCrear NO exista previamnete en Postgres..."     
verifyBdd= $(sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -wq $bddCrear)
if [ $? -eq 0 ]; then
                  echo -e "\nLa BD $bddCrear ya Existe en Postgres..."
                  sleep 4
		  echo "$DATE-$TIME --- Intento de Creacion de BD Fallido..." >> $logs_path/$NEWFILE
                  echo "$DATE-$TIME --- $bddCrear ya se encuentra en Postgres" >> $logs_path/$NEWFILE
                  sudo sed -i.bak -e '4,100d' $mail_path/mail_creacion_err.txt
                  sudo rm $mail_path/*.bak
                  echo "Base de Datos $bddCrear ya se encuentra en Postgres" >> $mail_path/mail_creacion_err.txt
                  sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_creacion_err.txt
                  clear
		  echo "Listando Bases de datos en Postgres..."
                  sudo -u postgres psql -c "\l"
           else
                  echo  "La BD destino no se encuentra creada, Se procedera a crear la BD $bddCrear"
                  echo  "Creando Base de Datos..."
                  sleep 4
                  sudo -u postgres psql -c "CREATE DATABASE $bddCrear"
                  echo -e "\nBase de datos $bddCrear creada satisfactoriamente..."
		  echo "$DATE-$TIME --- Base de datos $bddCrear creada con exito " >> $logs_path/$NEWFILE
                  sudo sed -i.bak -e '4,100d' $mail_path/mail_creacion.txt
                  sudo rm $mail_path/*.bak
                  echo "Se ha creado con Exito la Base de Datos $bddCrear " >> $mail_path/mail_creacion.txt
                  sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_creacion.txt
                  echo -e  "\nLa BD $bddCrear Se ha creado con Exito..."
		  echo
		  clear
                  echo "Listando Bases de datos en Postgres..."
		  sudo -u postgres psql -c "\l"
	  fi


}

#Esta es la funcion Sacar Respaldo
sacar_respaldo () {
DATE=`date +%y%m%d`
TIME=`date +%H%M%S`
echo "$DATE-$TIME --- Usuario entra al modulo Sacar Respaldo" >> $logs_path/$NEWFILE
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
		echo "Respaldo realizado Correctamente en el directorio para Respaldos..."
		echo "$DATE-$TIME --- Respaldo realizado:bddRespaldo$fechaActual.bak" >> $logs_path/$NEWFILE
                sudo sed -i.bak -e '4,100d' $mail_path/mail_respaldo.txt 
     	        sudo rm $mail_path/*.bak 
		echo "Nombre del Backup creado $1/bddRespaldo$fechaActual.bak" >> $mail_path/mail_respaldo.txt
		sudo ssmtp arnoldo_alvarez@hotmail.com <  $mail_path/mail_respaldo.txt

	else
		echo -e  "\nEl directorio Principal para Respaldos NO Existe"
		read -n1 -p "Desea crear el directorio Principal para Respaldos (s/n)" respbdd
		if [ $respbdd = "s" ]; then
			sudo mkdir $1
			echo "$password" | sudo -S chmod 755 $1
			echo -e "\nCreando DPR (Directorio Principal para Respaldos)..."
		       	sleep 3
			echo  "Realizando respaldo..."
			echo "$DATE-$TIME --- Directorio $1 creado con Exito" >> $logs_path/$NEWFILE
			sleep 3
			sudo -u postgres pg_dump -Fc $bddRespaldo > "$1/bddRespaldo$fechaActual.bak"
			echo "Respaldo realizado Correctamente en DPR..."
			echo "$DATE-$TIME --- Respaldo realizado:bddRespaldo$fechaActual.bak" >> $logs_path/$NEWFILE
                        sudo sed -i.bak -e '4,100d' $mail_path/mail_respaldo.txt 
     	                sudo rm $mail_path/*.bak 
			echo "Nombre del Backup creado: $1/bddRespaldo$fechaActual.bak" >> $mail_path/mail_respaldo.txt
			sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_respaldo.txt
		else
			
			echo "$DATE-$TIME --- Saliendo sin finalizar Respaldo" >> $logs_path/$NEWFILE
			echo -e "\nSaliendo sin realizar Respaldo..."
			sleep 3
		fi

		fi


}


#Esta es la funcion Restaurar Respaldo
restaurar_respaldo () {
DATE=`date +%y%m%d`
TIME=`date +%H%M%S`
echo "$DATE-$TIME --- Usuario entra al modulo Restaurar Respaldo" >> $logs_path/$NEWFILE
echo -e  "\nChequeando Directorio de Respaldos..."
if [ -d $backup_path ]; then 

echo "Listando archivos de Respaldo disponibles para restaurar..."
sleep 3
fileToRestore=$(ls $backup_path | grep %*.bak)
echo "$fileToRestore"
read -p "Ingresar el archivo .bak a restaurar:  " respaldoRestaurar
#echo -e "\n"
if [ -f "$backup_path/$respaldoRestaurar" ]; then

        sudo -u postgres psql -c "\l"
	read -p "Ingrese nombre de BD a restaurar:  " bdDestino
        echo -e "\nVerificando disponibilidad de la BD: $bdDestino"	
	verifyBdd= $(sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -wq $bdDestino)
	if [ $? -eq 0 ]; then
		  echo "Restaurando en la Base de Datos destino: $bdDestino"
		  sudo -u postgres pg_restore -Fc -d $bdDestino "$backup_path/$respaldoRestaurar"
		  echo -e "\n$backup_path$respaldoRestaurar"
		  echo "$DATE-$TIME --- Archivo $respaldoRestaurar restaurado con Exito" >> $logs_path/$NEWFILE
		  echo "$DATE-$TIME --- $respaldoRestaurar restaurado en BD: $bdDestino" >> $logs_path/$NEWFILE
                  sudo sed -i.bak -e '4,100d' $mail_path/mail_restauracion.txt 
     	          sudo rm $mail_path/*.bak 
		  echo "Archivo de BD  Restaurado $directorioBackup/$respaldoRestaurar" >> $mail_path/mail_restauracion.txt
		  echo "BD $bdDestino se ha restaurado con exito" >> $mail_path/mail_restauracion.txt
		  sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_restauracion.txt
	       	  clear
		  echo "Listar Bases de datos..."
      		  sudo -u postgres psql -c "\l"
	   else
	 	  echo  "La BD destino no se encuentra..."
		  echo  "Creando Base de Datos destino..."
		  sleep 4
		  sudo -u postgres psql -c "CREATE DATABASE $bdDestino"
		  sudo -u postgres pg_restore -Fc -d $bdDestino "$backup_path/$respaldoRestaurar"
		  echo -e "\n$backup_path/$respaldoRestaurar"
		  echo -e "\nBase de datos $bdDestino creada satisfactoriamente..."
	       	  clear
		  echo "Listar Bases de datos..."
      		  sudo -u postgres psql -c "\l"
		  echo "$DATE-$TIME --- Archivo $respaldoRestaurar restaurado con Exito" >> $logs_path/$NEWFILE
		  echo "$DATE-$TIME --- $respaldoRestaurar restaurado en BD: $bdDestino" >> $logs_path/$NEWFILE
                  sudo sed -i.bak -e '4,100d' $mail_path/mail_restauracion.txt 
     	          sudo rm $mail_path/*.bak 
		  echo "Archivo de BD Restaurado $backup_path/$respaldoRestaurar" >> $mail_path/mail_restauracion.txt
		  echo "Nueva BD creada con exito $bdDestino " >> $mail_path/mail_restauracion.txt
		  sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_restauracion.txt
	  fi
      
else
	echo "No se encuentra el archivo de Respaldo Ingresado"
	echo "Verifique nuevamente el nombre y vuelva a intentarlo..."
	echo "$DATE-$TIME --- No se encontro el archivo de Respaldo Ingresado" >> $logs_path/$NEWFILE
        sudo sed -i.bak -e '4,100d' $mail_path/mail_restauracion_err.txt 
     	sudo rm $mail_path/*.bak 
     	echo "Usuario ingresa nombre de Archivo de Respaldo NO encontrado" >> $mail_path/mail_restauracion_err.txt
     	sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_restauracion_err.txt
fi
else
	echo "No se encuentra el directorio de Respaldos ingresado..."
	echo "Verifique nuevamente el nombre y vuelva a intentarlo..."
	echo "$DATE-$TIME --- No se encontro el Directorio de Respaldo $respaldoRestaurar" >> $logs_path/$NEWFILE
        sudo sed -i.bak -e '4,100d' $mail_path/mail_restauracion_err.txt 
     	sudo rm $mail_path/*.bak 
     	echo "Usuario ingresa nombre de Directorio de Respaldo NO encontrado" >> $mail_path/mail_restauracion_err.txt
     	sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_restauracion_err.txt
fi

}


#Esta es la funcion para Eliminar Base de Datos local en Postgres
delete_BD(){
DATE=`date +%y%m%d`
TIME=`date +%H%M%S`
echo "$DATE-$TIME --- Usuario entra al modulo Eliminar Base de Datos en Postgres" >> $logs_path/$NEWFILE
echo "Listando BD actuales en Postgres..."
sleep 3
sudo -u postgres psql -c "\l"
read -p "Ingrese nombre de BD a eliminar: " bddEliminar
echo -e "\n"
echo -e "\nVerificando que la BD $bddEliminar exista previamente en Postgres..."     
verifyBdd= $(sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -wq $bddEliminar)
if [ $? -eq 0 ]; then
                  echo -e "\nLa BD $bddEliminar se ha encontrado Satisfactoriamente..."
                  sleep 4
		  read -n 1 -p "Confirma que desea Eliminar $bddEliminar (s/n)" respElim
	  if [ $respElim = "s" ]; then
		    PINCreation
     	     if [ $hidden_PIN = $pin_final ];then
        	    enmascarar_PIN_Conf
        	if [ $hidden_PIN = $pin_final ];then 
		  echo "$DATE-$TIME --- Usuario usa  PIN $pin_final para Eliminar una BD en Postgresql" >> $logs_path/$NEWFILE
                  echo
		  sudo -u postgres psql -c "DROP DATABASE $bddEliminar"
                  echo -e "\nBase de datos $bddEliminar eliminada satisfactoriamente..."
                  echo "$DATE-$TIME --- $bddEliminar se ha eliminado de Postgres" >> $logs_path/$NEWFILE
                  sudo sed -i.bak -e '4,100d' $mail_path/mail_removeDB.txt
                  sudo rm $mail_path/*.bak
                  echo "Base de Datos $bddEliminar se ha removido de Postgres" >> $mail_path/mail_removeDB.txt
                  sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_removeDB.txt
                  clear
		  echo "Listar Bases de datos..."
                  sudo -u postgres psql -c "\l"
               else
        	  echo "$DATE-$TIME --- Usuario No puede Confirmar PIN de Seguridad - Modulo de Eliminacion BD" >> $logs_path/$NEWFILE
		  echo -e "\nPIN NO confirmado, Intente de Nuevo.."
		  sudo sed -i.bak -e '4,100d' $mail_path/mail_removeDB_err.txt
	          sudo rm $mail_path/*.bak
                  echo "Usuario ingresa al modulo de Eliminacion ed BD Postgres" >> $mail_path/mail_removeDB_err.txt
                  echo "Usuario NO confirma PIN - Eliminacion de BD cancelada" >> $mail_path/mail_removeDB_err.txt
                  sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_removeDB_err.txt

	       fi
             else
		echo "$DATE-$TIME --- Intento de PIN fallido 3 veces - Modulo de Eliminacion de BD" >> $logs_path/$NEWFILE
        	echo -e "\nPIN Incorrecto, Intente de Nuevo.."
		sudo sed -i.bak -e '4,100d' $mail_path/mail_removeDB_err.txt
	        sudo rm $mail_path/*.bak
                echo "Usuario ingresa al modulo de Eliminacion ed BD Postgres" >> $mail_path/mail_removeDB_err.txt
                echo "Intento de PIN fallido 3 veces - Eliminacion de BD cancelada" >> $mail_path/mail_removeDB_err.txt
                sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_removeDB_err.txt
	     fi
         else
		 echo "$DATE-$TIME --- Eliminacion cancelada" >> $logs_path/$NEWFILE
                 echo -e "\nSaliendo sin eliminar Base de Datos..."
		 sudo sed -i.bak -e '4,100d' $mail_path/mail_removeDB_err.txt
	         sudo rm $mail_path/*.bak
                 echo "Usuario ingresa al modulo de Eliminacion ed BD Postgres" >> $mail_path/mail_removeDB_err.txt
                 echo "Usuario cancela el proceso de Eliminacion de BD" >> $mail_path/mail_removeDB_err.txt
                 sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_removeDB_err.txt
        	
	 fi
 else
	echo -e  "\nNo se encuentra la BD a eliminar..."
        sudo sed -i.bak -e '4,100d' $mail_path/mail_removeDB_err.txt 
     	sudo rm $mail_path/*.bak 
	echo "Usuario ingresa al modulo de Eliminacion ed BD Postgres" >> $mail_path/mail_removeDB_err.txt
     	echo "Usuario intenta Eliminar la BD $bddEliminar pero la misma NO se encuentra" >> $mail_path/mail_removeDB_err.txt
     	sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_removeDB_err.txt
 fi
  
}


lista_de_BD(){
DATE=`date +%y%m%d`
TIME=`date +%H%M%S`
echo -e  "\Las Bases de Datos Actuales: "
sudo -u postgres psql -c "\l"
echo "$DATE-$TIME --- Usuario consulta lista de Bases de Datos existentes" >> $logs_path/$NEWFILE

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
	echo "$DATE-$TIME --- Usuario consulta lista de Respaldos almacenados en AWS" >> $logs_path/$NEWFILE
else
	echo "$DATE-$TIME --- Usuario consulta lista vacia de Respaldos almacenados en AWS" >> $logs_path/$NEWFILE
	echo "No hay Archivos de Respaldos en AWS"

fi
	
read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}


Upload_Backups_AWS(){
DATE=`date +%y%m%d`
TIME=`date +%H%M%S`
echo "$DATE-$TIME --- Usuario Ingresa al modulo de carga hacia AWS" >> $logs_path/$NEWFILE
echo "Listando archivos de Respaldos disponibles..."
sleep 3
filesToUpload=$(ls $backup_path | grep %*.bak)
echo "$filesToUpload"
if [ -d $backup_path ]; then 
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
	filesToUpload=$(ls $backup_path | grep %*.bak)
	echo -e "\n$filesToUpload"
	echo
	read -p "Ingrese nombre del Archivo a Cargar:  " nombreCarga  
	fileToUpload=$(ls $backup_path | grep $nombreCarga) 
 if [ $? = 0 ]; then
	aws s3 cp $backup_path$nombreCarga s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/
        sudo sed -i.bak -e '4,100d' $mail_path/mail_Upload_AWS.txt
        sudo rm $mail_path/*.bak
        echo -e "\n Ha cargado un archivo de respaldo correctamente..."   
        echo "El Usuario ha ingresado en el modulo de Carga en AWS y ha realizado la tarea siguiente.."  >> $mail_path/mail_Upload_AWS.txt
        echo "El archivo $nombreCarga ha sido cargados en AWS" >> $mail_path/mail_Upload_AWS.txt
        echo "$DATE-$TIME --- Archivo $nombreCarga enviados a AWS con Exito" >> $logs_path/$NEWFILE
        sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_Upload_AWS.txt
else
       echo -e "\nArchivo NO encontrado..."	
fi 

        ;;

	2)
        sudo aws s3 cp $backup_path s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/ --recursive 
	sudo sed -i.bak -e '4,100d' $mail_path/mail_Upload_AWS.txt
        sudo rm $mail_path/*.bak
        echo -e "\n Se han cargado todos los archivos de $backup_path -- OK"   
        echo "El Usuario ha ingresado en el modulo de Carga en AWS y ha realizado la tarea siguiente.."  >> $mail_path/mail_Upload_AWS.txt
        echo "Los Archivos contenidos en $backup_path han sido cargados en AWS" >> $mail_path/mail_Upload_AWS.txt
        echo "$DATE-$TIME --- Archivos en $backup_path enviados a AWS con Exito" >> $logs_path/$NEWFILE
        sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_Upload_AWS.txt

	;;

	3)
	echo -e  "\nCarga de Archivos en AWS cancelada..."
	echo "$DATE-$TIME --- Usuario cancela Carga de Archivos a AWS" >> $logs_path/$NEWFILE
        sudo sed -i.bak -e '4,100d' $mail_path/mail_Upload_AWS_err.txt 
     	sudo rm $mail_path/*.bak 
	echo "Usuario ha cancelado Upload hacia AWS" >> $mail_path/mail_Upload_AWS_err.txt
	sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_Upload_AWS_err.txt
	;;

esac

#-----------------------------------------------------------------

else

	echo "$DATE-$TIME --- No se encontro el directorio de Respaldos Ingresado" >> $logs_path/$NEWFILE
	echo "No se encuentra el directorio de Respaldos ingresado..."
	echo "Verifique nuevamente el nombre y vuelva a intentarlo..."
        sudo sed -i.bak -e '4,100d' $mail_path/mail_Upload_AWS_err.txt 
     	sudo rm $mail_path/*.bak 
	echo "Upload hacia AWS NO Realizado - NO se encuentra el Directorio" >> $mail_path/mail_Upload_AWS_err.txt
	sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_Upload_AWS_err.txt
fi

read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}


Download_Backups_AWS(){
DATE=`date +%y%m%d`
TIME=`date +%H%M%S`
echo "$DATE-$TIME --- Usuario Ingresa al modulo de Descarga desde AWS" >> $logs_path/$NEWFILE
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
       mkdir $downloads_path/$nombreCarpeta$fechaActual
       aws s3 cp s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/$nombreDescarga  $downloads_path/$nombreCarpeta$fechaActual
       echo -e "\nArchivo .bak descargado satisfactoriamente en: $nombreCarpeta$fechaActual"
       sleep 3
       echo "$DATE-$TIME --- Archivo $nombreDescarga Descargado de AWS con Exito" >> $logs_path/$NEWFILE
       echo "$DATE-$TIME --- Archivo descargado en $nombreCarpeta$fechaActual" >> $logs_path/$NEWFILE
       sudo sed -i.bak -e '4,100d' $mail_path/mail_Download_AWS.txt 
       sudo rm $mail_path/*.bak 
       echo "Archivo $nombreDescarga  ha sido descargado satisfactoriamente desde AWS" >> $mail_path/mail_Download_AWS.txt
       echo "Archivo $nombreDescarga  descargado desde AWS en la ruta: $nombreCarpeta$fechaActual" >> $mail_path/mail_Download_AWS.txt
       sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_Download_AWS.txt
       else

        echo -e "\nNombre de archivo Incorrecto o NO existe..."
        echo "$DATE-$TIME --- Archivo $nombreDescarga NO encontrado en AWS" >> $logs_path/$NEWFILE
        sudo sed -i.bak -e '4,100d' $mail_path/mail_Download_AWS_err.txt 
     	sudo rm $mail_path/*.bak 
        echo "Se Cancela Descarga desde AWS - No se encuentra archivo Ingresado" >> $mail_path/mail_Download_AWS_err.txt
        sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_Download_AWS_err.txt
fi
else
        echo -e "\nNo hay archivos para Descargar "
        echo "$DATE-$TIME --- No hay Archivos para Descargar desde AWS" >> $logs_path/$NEWFILE
        sudo sed -i.bak -e '4,100d' $mail_path/mail_Download_AWS_err.txt 
     	sudo rm $mail_path/*.bak 
        echo "Se Cancela Descarga desde AWS - No hay archivos para Descargar" >> $mail_path/mail_Download_AWS_err.txt
        sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_Download_AWS_err.txt

fi


	read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}


Delete_Backups_AWS(){
DATE=`date +%y%m%d`
TIME=`date +%H%M%S`
echo "$DATE-$TIME --- Usuario Ingresa al modulo de Eliminacion de Archivos en  AWS" >> $logs_path/$NEWFILE
echo -e "\nPuede escoger una de las opciones siguientes:"
echo "1.Eliminar solo un archivo especifico"
echo "2.Eliminar todos los archivos"
echo "3.Cancelar Operacion"
echo -e "\n"
read -n 1 -p "Ingrese una opcion: " opcion
case $opcion in 
	
1)

fileToDelete=$(aws s3 ls s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/ | grep %*.bak)
if [ $? = 0 ]; then
echo -e "\n"
echo  "$fileToDelete"
echo -e "\n"
read -p "Introduzca el archivo de Respaldo que desea Eliminar: " nombrebak
verifyBakAWS=$(aws s3 ls  s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/ | grep $nombrebak)
if [ $? = 0 ]; then
echo -e "\nArchivo encontrado satisfactoriamente..."
aws s3 rm  s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/$nombrebak
sudo sed -i.bak -e '4,100d' $mail_path/mail_Delete_AWS.txt 
sudo rm $mail_path/*.bak 
echo -e "\nEl archivo $nombrebak ha sido eliminado satisfactoriamente de AWS"
echo "El Usuario ha ingresado en el modulo de Eliminacion en  AWS y ha realizado la tarea siguiente.. "  >> $mail_path/mail_Delete_AWS.txt
echo "El archivo $nombrebak se ha eliminado satirfactoriamente de AWS" >> $mail_path/mail_Delete_AWS.txt
sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_Delete_AWS.txt
echo "$DATE-$TIME --- Archivo $nombrebak Eliminado de AWS con Exito" >> $logs_path/$NEWFILE
else
        echo -e "\nNombre de archivo Incorrecto o NO existe..."
        echo "$DATE-$TIME --- Archivo $nombrebak NO encontrado en AWS" >> $logs_path/$NEWFILE
        sudo sed -i.bak -e '4,100d' $mail_path/mail_Delete_AWS_err.txt 
     	sudo rm $mail_path/*.bak 
        echo "Se cancela eliminacion en  AWS - Nombre de archivo Ingresado No se encuentra" >> $mail_path/mail_Delete_AWS_err.txt
        sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_Delete_AWS_err.txt
fi
else
	echo -e "\nNo hay archivos para Eliminar"
        echo "$DATE-$TIME --- No hay Archivos para Eliminar en AWS" >> $logs_path/$NEWFILE
        sudo sed -i.bak -e '4,100d' $mail_path/mail_Delete_AWS_err.txt 
     	sudo rm $mail_path/*.bak 
        echo "Se cancela eliminacion en  AWS - No hay archivos para Eliminar en AWS" >> $mail_path/mail_Delete_AWS_err.txt
        sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_Delete_AWS_err.txt
fi

;;

2) echo -e "\n"
	clear
	echo -e "\nDesea Eliminar todos los siguientes Archivos de Respaldos (s/n) "
	filesToDelete=$(aws s3 ls s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/ | grep %*.bak)
	echo -e "\n$filesToDelete"
	echo -e "\n"
	read -n 1 -p "Oprima 1 para Proceder, Oprima cualquier otra tecla para cancelar... " respDel 
	if [ $respDel = "1" ]; then
	echo -e "\n"	
	aws s3 rm  s3://p3rolixbucket2/PruebaBucket/RespaldosAWS/ --recursive
	sudo sed -i.bak -e '4,100d' $mail_path/mail_Delete_AWS.txt 
	sudo rm $mail_path/*.bak 
	echo -e "\nTodo los archivos han sido eliminados satisfactoriamente de AWS"
	echo "El Usuario ha ingresado en el modulo de Eliminacion en  AWS y ha realizado la tarea siguiente: "  >> $mail_path/mail_Delete_AWS.txt
	echo "Todos los archivos se han eliminado satirfactoriamente de AWS" >> $mail_path/mail_Delete_AWS.txt
	sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_Delete_AWS.txt
	echo "$DATE-$TIME --- Archivo $nombrebak Eliminado de AWS con Exito" >> $logs_path/$NEWFILE
else


	echo -e "\nSe ha cancelado la eliminacion de todos los Archivos de AWS..."
        echo "$DATE-$TIME --- Se ha cancelado eliminacion de todos los Archivos en AWS" >> $logs_path/$NEWFILE
        sudo sed -i.bak -e '4,100d' $mail_path/mail_Delete_AWS_err.txt 
     	sudo rm $mail_path/*.bak 
        echo "Se cancela eliminacion de todos los Archivos en AWS" >> $mail_path/mail_Delete_AWS_err.txt
        sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_Delete_AWS_err.txt

fi
;;


	3)
	echo -e  "\nEliminacion de todos los Archivos en AWS cancelada..."
	echo "$DATE-$TIME --- Se ha cancelado eliminacion de todos los Archivos en AWS" >> $logs_path/$NEWFILE
        sudo sed -i.bak -e '4,100d' $mail_path/mail_Upload_AWS_err.txt 
     	sudo rm $mail_path/*.bak 
	echo "Se Cancela Eliminacion de todos los Archivos en AWS" >> $mail_path/mail_Upload_AWS_err.txt
	sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_Upload_AWS_err.txt
	;;
esac

read -n 1 -s -r -p "Presione [ENTER] para continuar..."
}

restartApp(){
#comodin="s"
#echo -e "\n$respInicio"
#echo "$respInicio"
sudo sed -i.bak -e '1,100d' $logs_path/$NEWFILE
sudo rm $logs_path/*.bak
echo "$DATE-$TIME --- Usuario Procede a Reiniciar los Directorios " >> $logs_path/$NEWFILE
echo "$DATE-$TIME --- Usuario confirma el numero PIN $pin_final y Reinicia Directorios" >> $logs_path/$NEWFILE
sudo mv $logs_path$NEWFILE $last_log_path
echo -e "\nProcediendo a Reinicializar los Directorios..."
echo -e "\n$respInicio"
sleep 6
export respInicio
sudo bash $main_path/PGU_Ex_SEC.sh
exit 0
#read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}


PINCreation(){
pin_final=""
for ((i=0; i<4; i++))
do
    pin=$((1 + RANDOM % 9))
    #arregloPin[i]=$pin
    pin_final=$pin_final$pin
done
sudo sed -i.bak -e '4,100d' $mail_path/mail_PIN.txt
        sudo rm $mail_path/*.bak
        echo "Se ha creado el siguiente PIN  $pin_final" >> $mail_path/mail_PIN.txt
        sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_PIN.txt
        echo -e "\n --- Se ha enviado un PIN de Seguridad a la direccion: $emailAddress"
        echo " --- Vaya a esa direccion de correo electronico y verifique el PIN enviado"       
        sleep 3
        echo -e "\n"
enmascarar_PIN
}

enmascarar_PIN(){
#echo -e "\n$pin_final"
unset hidden_PIN
prompt="Ingrese el PIN de seguridad (4 digitos):  "
while IFS= read -p "$prompt" -r -s -n 1 char
do
    if [[ $char == $'\0' ]]
    then
        break
    fi
    prompt='*'
    hidden_PIN+="$char"
done

}

enmascarar_PIN_Conf(){
#echo -e "\n$pin_final"
unset hidden_PIN
echo
prompt="Ingrese el PIN  nuevamente para confirmar:  "
while IFS= read -p "$prompt" -r -s -n 1 char
do
    if [[ $char == $'\0' ]]
    then
        break
    fi
    prompt='*'
    hidden_PIN+="$char"
done

}

#-------------- INITIAL PIN CREATION PROCESS ------------------------------------------

for ((i=0; i<4; i++))
do
	pin=$((1 + RANDOM % 9))
	pin_inicial=$pin_inicial$pin
done
	sudo sed -i.bak -e '4,100d' $mail_path/mail_PIN.txt
        sudo rm $mail_path/*.bak
        echo "Se ha creado el siguiente PIN Inicial $pin_inicial" >> $mail_path/mail_PIN.txt
        sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_PIN.txt
        echo -e "\n --- Se ha enviado un PIN Inicial de Seguridad a $emailAddress"
        echo " --- Vaya a esa direccion de correo electronico y verifique el PIN Inicial enviado"	
        sleep 3
	echo -e "\n"
#read -p "Ingrese el PIN Inicial de seguridad (4 digitos):  " numeroPIN
enmascarar_PIN
if [ $hidden_PIN = $pin_inicial ];then
        enmascarar_PIN_Conf
	#read -p "Ingrese el PIN Inicial nuevamente para confirmar: " numeroPIN
	if [ $hidden_PIN = $pin_inicial ];then
#-------------- APP INITIALIZATION ----------------------------------------------------
    NEWFILE=${FILE%.*}_${DATE}_${TIME}.${FILE#*.}
    touch $NEWFILE
    mv $NEWFILE $logs_path
    echo "$DATE-$TIME --- Usuario entrando al Sistema..." >> $logs_path/$NEWFILE
    echo "$DATE-$TIME --- Usuario ha utilizado el siguiente PIN para iniciar:$pin_inicial" >> $logs_path/$NEWFILE

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
    echo "3.Tareas Basicas de Postgress           "
    echo "4.Tareas en Amazon Web Services         " 
    echo "5.Tareas de Reinicio de Aplicacion      "
    echo "6.Salir                                 "

    #Leer los datos del Usuario - Capturar  Opcion
    read -n1 -p "Ingrese una opcion [1-6]: " opcion

    #Validar la opcion ingresada
    case $opcion in
        1) instalar_postgres

          #sleep 3
            ;;

        2)  
	   desinstalar_postgres 

           #sleep 3
            ;;

        3) PINCreation
           if [ $hidden_PIN = $pin_final ];then
           enmascarar_PIN_Conf
                if [ $hidden_PIN = $pin_final ];then
                echo "$DATE-$TIME --- Usuario usa  PIN $pin_final para Ingresar en Modulo Basico" >> $logs_path/$NEWFILE
                echo "$DATE-$TIME --- Usuario hace uso de  Modulo de Tareas Basicas" >> $logs_path/$NEWFILE
        while :
        do
        DATE=`date +%y%m%d`
        TIME=`date +%H%M%S`
        #Limpiar la pantalla
        clear

    echo "----------------------------------------"
    echo "    TAREAS BASICAS DE POSTGRESQL        "
    echo "----------------------------------------"
    echo "               SUB MENU                 "
    echo "----------------------------------------"
    echo "1.Crear una BD en Postgres              "
    echo "2.Respaldar una BD en Postgres          "
    echo "3.Restaurar una BD en Postgres          "
    echo "4.Eliminar una BD en Postgres           "
    echo "5.Listar BD en Postgres                 " 
    echo "6.Cancelar                              "		

    #Leer los datos del Usuario - Capturar  Opcion
    read -n1 -p "Ingrese una opcion [1-6]: " opcion

    #Validar la opcion ingresada
    case $opcion in
	    
	    1) verifyInstall=$(which psql)
                if [ $? -eq 1 ]; then
                        clear
                        echo -e "\nPostGres NO se encuentra instalado en el Equipo "
                        echo  "Instale Postgres y vuelva a intentar esta Operacion..."
                        echo "$DATE-$TIME --- Error - Postgres NO instalado" >> $logs_path/$NEWFILE
                        echo "$DATE-$TIME --- Modulo: Creacion de BD Local en Postgres" >> $logs_path/$NEWFILE
                        echo "Error:Intento de Creacion de BD Fallido"  >> $mail_path/mail_Verify4.txt
                        sudo sed -i.bak -e '4,100d' $mail_path/mail_Verify4.txt
                        sudo rm $mail_path/*.bak
                        echo "Usuario intenta crear una BD pero Postgres NO se encuentra instalado" >> $mail_path/mail_Verify4.txt
                        sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_Verify4.txt
                else
                        echo -e "\n"
                        #echo "Se realizara el Respaldo en la ruta $backup_path"
                        #read -p "Indique Directorio: " directorioBackup
                        crear_BD 
                fi

		read -n 1 -s -r -p "Presione [ENTER] para continuar..."
		    ;;
	    
	    2) verifyInstall=$(which psql)
		if [ $? -eq 1 ]; then
			clear
			echo -e "\nPostGres NO se encuentra instalado en el Equipo "
	  		echo  "Instale Postgres y vuelva a intentar esta Operacion..."
			echo "$DATE-$TIME --- Error - Postgres NO instalado" >> $logs_path/$NEWFILE
			echo "$DATE-$TIME --- Modulo: Sacar Respaldo BD Local" >> $logs_path/$NEWFILE
			echo "Error:Intento de Respaldo Fallido"  >> $mail_path/mail_Verify1.txt
        		sudo sed -i.bak -e '4,100d' $mail_path/mail_Verify1.txt 
     			sudo rm $mail_path/*.bak 
			echo "Usuario intenta hacer respaldo pero Postgresql NO se encuentra instalado" >> $mail_path/mail_Verify1.txt
			sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_Verify1.txt
		else
			echo -e "\n"
			#echo "Se realizara el Respaldo en la ruta $backup_path"
			#read -p "Indique Directorio: " directorioBackup
			sacar_respaldo $backup_path
		fi

		read -n 1 -s -r -p "Presione [ENTER] para continuar..."
            ;;

       	    3) verifyInstall=$(which psql)
		if [ $? -eq 1 ]; then
			clear
			echo -e "\nPostGres NO se encuentra instalado en el Equipo "
	  		echo  "Instale Postgres y vuelva a intentar esta Operacion..."
			echo "$DATE-$TIME --- Error - Postgres NO instalado" >> $logs_path/$NEWFILE
			echo "$DATE-$TIME --- Modulo: Restaurar Respaldo BD Local" >> $logs_path/$NEWFILE
			echo "Error:Intento de Restauracion Fallida"  >> $mail_path/mail_Verify2.txt
        		sudo sed -i.bak -e '4,100d' $mail_path/mail_Verify2.txt 
     			sudo rm $mail_path/*.bak 
			echo "Usuario intenta restaurar una BD pero Postgresql NO se encuentra instalado" >> $mail_path/mail_Verify2.txt
			sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_Verify2.txt
		else
			echo -e "\n"
			restaurar_respaldo $backup_path
		fi

		read -n 1 -s -r -p "Presione [ENTER] para continuar..."
           
            ;;
    		4) verifyInstall=$(which psql)
                if [ $? -eq 1 ]; then
                        clear
                        echo -e "\nPostGres NO se encuentra instalado en el Equipo "
                        echo  "Instale Postgres y vuelva a intentar esta Operacion..."
                        echo "$DATE-$TIME --- Error - Postgres NO instalado" >> $logs_path/$NEWFILE
                        echo "$DATE-$TIME --- Modulo: Eliminacion de BD Local en Postgres" >> $logs_path/$NEWFILE
                        echo "Error:Intento de Eliminacion de BD Fallido"  >> $mail_path/mail_Verify5.txt
                        sudo sed -i.bak -e '4,100d' $mail_path/mail_Verify5.txt
                        sudo rm $mail_path/*.bak
                        echo "Usuario intenta Eliminar una BD  pero Postgresql NO se encuentra instalado" >> $mail_path/mail_Verify5.txt
                        sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_Verify5.txt
                else
                        echo -e "\n"
                        #echo "Se realizara el Respaldo en la ruta $backup_path"
                        #read -p "Indique Directorio: " directorioBackup
                        delete_BD 
                fi
		read -n 1 -s -r -p "Presione [ENTER] para continuar..."
		;;
#---------------------------------------------------------------------------------------------------------		
    		5)verifyInstall=$(which psql)
		 if [ $? -eq 1 ]; then
			clear
			echo -e "\nPostGres NO se encuentra instalado en el Equipo "
	  		echo  "Instale Postgres y vuelva a intentar esta Operacion..."
			echo "$DATE-$TIME --- Error - Postgres NO instalado" >> $logs_path/$NEWFILE
			echo "$DATE-$TIME --- Modulo: Listar BD's Locales" >> $logs_path/$NEWFILE
			echo "Error:Intento de Listar BD Fallido"  >> $mail_path/mail_Verify3.txt
        		sudo sed -i.bak -e '4,100d' $mail_path/mail_Verify3.txt 
     			sudo rm $mail_path/*.bak 
			echo "Usuario intenta Listar BD pero Postgresql NO se encuentra instaldo" >> $mail_path/mail_Verify3.txt
			sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_Verify3.txt
		else
			echo -e "\n"
		lista_de_BD 
	fi
		read -n 1 -s -r -p "Presione [ENTER] para continuar..."
	       	;;

		6) echo -e "\nSaliendo al Menu Principal..."
        	   echo "$DATE-$TIME --- Usuario sale del Modulo de Tareas Basicas " >> $logs_path/$NEWFILE
        	   sleep 3
		   break
	;;
  	esac
	done
else 
	echo "PIN NO Confirmado..."
        echo "$DATE-$TIME --- Usuario No puede Confirmar PIN de Seguridad - Tareas Basicas" >> $logs_path/$NEWFILE
fi
else
	echo "aja"
	echo "$DATE-$TIME --- Intento de PIN fallido 3 veces - Tareas Basicas" >> $logs_path/$NEWFILE
fi
  	
;;
  4) PINCreation
	   if [ $hidden_PIN = $pin_final ];then
           enmascarar_PIN_Conf
		if [ $hidden_PIN = $pin_final ];then
	        echo "$DATE-$TIME --- Usuario usa  PIN $pin_final para Ingresar en Modulo de AWS" >> $logs_path/$NEWFILE
		echo "$DATE-$TIME --- Usuario hace uso de  Modulo AWS" >> $logs_path/$NEWFILE
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
    echo "1.Listar Respaldos   - AWS Bucket       "
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
	   echo "$DATE-$TIME --- Usuario sale del Modulo AWS " >> $logs_path/$NEWFILE
	  
	break
	
            ;;
	esac
done
else
	echo "PIN NO Confirmado..."
	echo "$DATE-$TIME --- Usuario No puede Confirmar PIN de Seguridad - Modulo AWS" >> $logs_path/$NEWFILE
  fi
else
       echo "$DATE-$TIME --- Intento de PIN fallido 3 veces - Modulo AWS" >> $logs_path/$NEWFILE
fi
	;;
    
	5)PINCreation
 if [ $hidden_PIN = $pin_final ];then
           enmascarar_PIN_Conf
   if [ $hidden_PIN = $pin_final ];then
                echo "$DATE-$TIME --- Usuario usa  PIN $pin_final para Ingresar en Tareas de Config" >> $logs_path/$NEWFILE
                echo "$DATE-$TIME --- Usuario hace uso de  Modulo de Tareas de Configuracion" >> $logs_path/$NEWFILE
        while :
        do
        DATE=`date +%y%m%d`
        TIME=`date +%H%M%S`
        #Limpiar la pantalla
        clear

    echo "----------------------------------------"
    echo "        TAREAS DE CONFIGURACION         "
    echo "----------------------------------------"
    echo "               SUB MENU                 "
    echo "----------------------------------------"
    echo "1.Reiniciar solo Directorios            "
    echo "2.Reiniciar y Desinstalar Postgresql    "
    echo "3.Cancelar                              "
	 #Leer los datos del Usuario - Capturar  Opcion
    	read -n1 -p "Ingrese una opcion [1-3]: " opcion

    	#Validar la opcion ingresada
    	case $opcion in
        1) echo -e "\n"
 	read -n 1 -p "Esta seguro que desea Reiniciar los directorios Principales (s/n)" respInicio
      if [[ $respInicio = "s" ]]; then
        #restartApp $respInicio
	#sudo sed -i.bak -e '1,100d' $logs_path/$NEWFILE 
     	#sudo rm $logs_path/*.bak 
	echo "$DATE-$TIME --- Usuario Procede a Reiniciar los Directorios " >> $logs_path/$NEWFILE
	echo "$DATE-$TIME --- Usuario confirma el numero PIN $pin_final y Reinicia Directorios" >> $logs_path/$NEWFILE
        sudo sed -i.bak -e '4,100d' $mail_path/mail_restartApp.txt
     	sudo rm $mail_path/*.bak 
	echo "Usuario procede a Reiniciar Directorios Principales" >> $mail_path/mail_restartApp.txt
	sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_restartApp.txt
	sudo mv $logs_path$NEWFILE $last_log_path
        filesToUpload=$(ls $backup_path | grep %*.bak)
	sudo mv $backup_path$filesToUpload  $backupFinal_path
	echo -e "\nProcediendo a Reinicializar los Directorios..."
	read -n 1 -s -r -p "Presione [ENTER] para continuar..."
	sleep 6
	export respInicio
	bash $main_path/PGU_Ex_SEC.sh
        exit 0	
      else
	echo "$DATE-$TIME --- Usuario cancela Reinicializacion de la Aplicacion" >> $logs_path/$NEWFILE
        echo -e "\nSaliendo sin Reincializar Aplicacion..."
        sleep 7
        break
      fi
      ;; 
      
      2) echo -e "\n"
         read -n 1 -p "Esta seguro que desea Reiniciar y Desinstalar Postgres (s/n)" respInicio
      if [ $respInicio = "s" ]; then
        echo -e "\nEste Procedimiento procedera a desinstalar Postgres y eliminar las carpetas princpales de la Aplicacion" 
	echo "Si aun no se encuentra totalmente seguro en este punto, aun podria oprimir las teclas control+C y haria una"
	echo "salida abrupta del proceso de desinstalacion. De lo contrario continue oprimiendo ENTER"
	sleep 3
	read -n 1 -s -r -p "Presione [ENTER] para continuar..."
	desinstalar_postgres 
	#sudo sed -i.bak -e '1,100d' $logs_path/$NEWFILE 
     	#sudo rm $logs_path/*.bak 
	echo "$DATE-$TIME --- Usuario utiliza el numero PIN $pin_final para realizar la siguiente tarea: " >> $logs_path/$NEWFILE
	echo "$DATE-$TIME --- Usuario ha reiniciado y desinstalado la Aplicacion " >> $logs_path/$NEWFILE
        sudo sed -i.bak -e '4,100d' $mail_path/mail_restartApp.txt
     	sudo rm $mail_path/*.bak 
	echo "Usuario procede a reiniciar/desinstalar Aplicacion" >> $mail_path/mail_restartApp.txt
	sudo ssmtp arnoldo_alvarez@hotmail.com < $mail_path/mail_restartApp.txt
        filesToUpload=$(ls $backup_path | grep %*.bak)
	sudo mv $backup_path$filesToUpload $backupFinal_path
	sudo mv $logs_path$NEWFILE $last_log_path
	echo -e "\nProcediendo a Reinicializar los Directorios..."
	sleep 6
	export respInicio
	bash $main_path/PGU_Ex_SEC.sh
        exit 0	
        #restartApp
	#export respInicio
        #echo $respInicio
	#read -n 1 -s -r -p "Presione [ENTER] para continuar..."
	#bash $main_path/PGU_Ex_SEC.sh
      else
        echo "$DATE-$TIME --- Usuario cancela Reinicializacion de la Aplicacion" >> $logs_path/$NEWFILE
        echo -e "\nSaliendo sin Desinstalar/Reiniciar Aplicacion..." 
        sleep 3
        break
      fi
      ;;

      3) echo -e "\nSaliendo al Menu Principal..."
         echo "$DATE-$TIME --- Usuario sale del Modulo de Tareas de Configuracion " >> $logs_path/$NEWFILE
         sleep 3
         break
        ;;
    
  esac
     
    
   done   
else
    echo -e "\nPIN NO Confirmado, Saliendo sin Reiniciar Aplicacion"
    sleep 3
    echo "$DATE-$TIME --- Usuario No puede Confirmar PIN de Seguridad - Modulo AWS" >> $logs_path/$NEWFILE
   fi
else
 echo -e "\nPIN Incorrecto, Saliendo sin Reiniciar Aplicacion"
 sleep 3
 echo "$DATE-$TIME --- Intento de PIN fallido 3 veces - Modulo AWS" >> $logs_path/$NEWFILE
fi


	read -n 1 -s -r -p "Presione [ENTER] para continuar..."
     
	;;

	
	6) 
	   echo -e "\nSaliendo del programa...."
	   echo "$DATE-$TIME --- Usuario saliendo del  Sistema..." >> $logs_path/$NEWFILE
	   cd $main_path
           exit 0
            
	   ;;
    esac


done

     else
	echo -e "\nPIN NO Confirmado correctamente..."
	echo "Intente Cargar la Aplicacion nuevamente..." 
     fi
else
	echo -e "\nPIN Inicial NO Valido..."
	echo "Intente Cargar la Aplicacion nuevamente..." 
        exit 0
fi



