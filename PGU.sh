# !/bin/bash
# Programa para configurar directorios y rutas de Programa de Utilidades de Postgres
#main_path=$HOME
#app_path=/home/ubuntu/shellCourse
#backup_path=/home/ubuntu/shellCourse/Respaldos/
#mail_path=/home/ubuntu/shellCourse/mails_formats
#logs_path=/home/ubuntu/shellCourse/logs_PGU
#downloads_path=/home/ubuntu/shellCourse/downloadsFromAWS
#configFiles_path=/home/ubuntu/shellCourse/PGU_config_files
#initial_file=/home/ubuntu/shellCourse/PGU_config_files/initial.txt
 

function_install(){

if [ -d $configFiles_path  ]; then
	echo -e "\nExiste Directorio de Configuracion"
	 fileToInitiate=$(sudo ls -S $configFiles_path/initial.txt)
	   if [ $? = 1 ]; then
	      sudo chmod 777 $confiFiles_path 
	      sudo touch $configFiles_path/initial.txt
	      echo "Linea de Prueba..." > $configFiles_path/initial.txt
	      echo "Creando archivo de Inicio, Espere..."
	      sleep 4
	      echo -e "\n --- Se ha creado el archivo de Inicio correctamente..."
	   else
              clear 
	      echo -e "\n --- Inicializando Aplicacion, Espere..."
              sleep 3     
      fi

	else
        clear
        echo "Aplicacion no se encuentra Instalada/Configurada"
        read -n 1 -p "Desea Instalar/Configurar Aplicacion (s/n)" respIns
        if [ $respIns = "s" ]; then
                creating_confFiles_path=$(sudo mkdir $configFiles_path)
                #echo -e "\n"
       		#sudo chmod 777 $confiFiles_path
         	sudo touch $configFiles_path/initial.txt
         	echo "Linea de Prueba..." > $configFiles_path/initial.txt
	        echo -e  "\n --- Creando archivo de Inicio, Espere..."
	        sleep 4
         	echo   " --- Se ha creado el archivo de Inicio correctamente..."
           	#if [ -d $app_path  ]; then
		#	echo -e "\nExiste Directorio de Aplicacion"
		#else
                 #creating_app_path=$(sudo mkdir /home/ubuntu/shellCourse)
                 #echo "Se ha creado $app_path  "
 		#fi

 		if [ -d $backup_path  ]; then
         	  echo "Existe Directorio de Backups"
 		else
         	  creating_backup_path=$(sudo mkdir $backup_path)
         	  echo " --- Se ha creado el Directorio para Respaldos..."
 		fi
#Se procedera a crear los siguientes archivos de formatos de correo electronico:
#mail_Delete_AWS.txt*
#mail_Delete_AWS_err.txt*
#mail_Download_AWS.txt*
#mail_Download_AWS_err.txt*
#mail_Upload_AWS.txt*
#mail_Upload_AWS_err.txt*
#mail_Verify1.txt*
#mail_Verify2.txt*
#mail_Verify3.txt*
#mail_install.txt*
#mail_install_err.txt*
#mail_respaldo.txt*
#mail_restauracion.txt*
#mail_restauracion_err.txt*
#mail_text.txt*
#mail_uninstall.txt*
#mail_uninstall_err.txt*
if [ -d $mail_path  ]; then
         echo "Existe Directorio de Emails"
 else
	 echo  " --- Creando Formatos de Correo Electronico..."
	 sleep 3
         flag=true
	 while [ "$flag" = true ]
	 do
	 read -p " * * * Introduzca direccion de Correo Electronico a configurar: " emailAddress
	 #--------------------------------------------------------------------------
	if  [[ $emailAddress =~ $regex ]]; then
	#while [ "$flag" = true ]
	#do
	 #---------------------------------------------------------------------------
	 echo  " * * * Esta direccion de Correo $emailAddress sera utilizada por"
	 echo  "     la Aplicacion para enviar los eventos realizados por el Usuario"
	 sleep 3
         creating_mail_path=$(sudo mkdir /home/ubuntu/shellCourse/mails_formats)
         sudo chmod 777 $mail_path
         sudo touch $mail_path/mail_Delete_AWS.txt
         echo "to:$emailAddress" > $mail_path/mail_Delete_AWS.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_Delete_AWS.txt
         echo "Subject:Deleted file from AWS Cloud is Done..." >> $mail_path/mail_Delete_AWS.txt
         sudo touch $mail_path/mail_Delete_AWS_err.txt
         echo "to:$emailAddress" > $mail_path/mail_Delete_AWS_err.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_Delete_AWS_err.txt
         echo "Subject:Deleting file from AWS Failed" >> $mail_path/mail_Delete_AWS_err.txt
         sudo touch $mail_path/mail_Download_AWS.txt
         echo "to:$emailAddress" > $mail_path/mail_Download_AWS.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_Download_AWS.txt
         echo "Subject:Download from AWS Cloud is Done..." >> $mail_path/mail_Download_AWS.txt
         sudo touch $mail_path/mail_Download_AWS_err.txt
         echo "to:$emailAddress" > $mail_path/mail_Download_AWS_err.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_Download_AWS_err.txt
         echo "Subject:Download from AWS Failed..." >> $mail_path/mail_Download_AWS_err.txt
         sudo touch $mail_path/mail_Upload_AWS.txt
         echo "to:$emailAddress" > $mail_path/mail_Upload_AWS.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_Upload_AWS.txt
         echo "Subject:Upload to AWS Cloud is Done..." >> $mail_path/mail_Upload_AWS.txt
         sudo touch $mail_path/mail_Upload_AWS_err.txt
         echo "to:$emailAddress" > $mail_path/mail_Upload_AWS_err.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_Upload_AWS_err.txt
         echo "Subject:Upload Process to AWS failed..." >> $mail_path/mail_Upload_AWS_err.txt
         sudo touch $mail_path/mail_Verify1.txt
         echo "to:$emailAddress" > $mail_path/mail_Verify1.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_Verify1.txt
         echo "Subject:Postgres NOT Found..." >> $mail_path/mail_Verify1.txt
         sudo touch $mail_path/mail_Verify2.txt
         echo "to:$emailAddress" > $mail_path/mail_Verify2.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_Verify2.txt
         echo "Subject:Postgres NOT Found..." >> $mail_path/mail_Verify2.txt
	 sudo touch $mail_path/mail_Verify3.txt
         echo "to:$emailAddress" > $mail_path/mail_Verify2.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_Verify2.txt
         echo "Subject:Postgres NOT Found..." >> $mail_path/mail_install.txt
         sudo touch $mail_path/mail_Verify4.txt
         echo "to:$emailAddress" > $mail_path/mail_Verify4.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_Verify4.txt
         echo "Subject:Postgres NOT Found..." >> $mail_path/mail_Verify4.txt
         sudo touch $mail_path/mail_Verify5.txt
         echo "to:$emailAddress" > $mail_path/mail_Verify5.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_Verify5.txt
         echo "Subject:Postgres NOT Found..." >> $mail_path/mail_Verify5.txt
         sudo touch $mail_path/mail_install.txt
         echo "to:$emailAddress" > $mail_path/mail_install.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_install.txt
         echo "Subject:Installation Process Done..." >> $mail_path/mail_install.txt
         sudo touch $mail_path/mail_install_err.txt
         echo "to:$emailAddress" > $mail_path/mail_install_err.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_install_err.txt
         echo "Subject:Installation Process failed..." >> $mail_path/mail_install_err.txt
         sudo touch $mail_path/mail_respaldo.txt
         echo "to:$emailAddress" > $mail_path/mail_respaldo.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_respaldo.txt
         echo "Subject:Backup is Done..." >> $mail_path/mail_respaldo.txt
         sudo touch $mail_path/mail_restauracion.txt
         echo "to:$emailAddress" > $mail_path/mail_restauracion.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_restauracion.txt
         echo "Subject:Restoration Process is Done..." >> $mail_path/mail_restauracion.txt
         sudo touch $mail_path/mail_restauracion_err.txt
         echo "to:$emailAddress" > $mail_path/mail_restauracion_err.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_restauracion_err.txt
         echo "Subject:DB Restoration Process failed..." >> $mail_path/mail_restauracion_err.txt
         sudo touch $mail_path/mail_uninstall.txt
         echo "to:$emailAddress" > $mail_path/mail_uninstall.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_uninstall.txt
         echo "Subject:Uninstall Postgres - Done" >> $mail_path/mail_uninstall.txt
         sudo touch $mail_path/mail_uninstall_err.txt
         echo "to:$emailAddress" > $mail_path/mail_uninstall_err.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_uninstall_err.txt
         echo "Subject:Uninstall Postgres - Failed" >> $mail_path/mail_uninstall_err.txt
         sudo touch $mail_path/mail_PIN.txt
         echo "to:$emailAddress" > $mail_path/mail_PIN.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_PIN.txt
         echo "Subject:PIN de Seguridad" >> $mail_path/mail_PIN.txt
         sudo touch $mail_path/mail_creacion.txt
         echo "to:$emailAddress" > $mail_path/mail_creacion.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_creacion.txt
         echo "Subject:DB Creation Process is Done " >> $mail_path/mail_creacion.txt
         sudo touch $mail_path/mail_creacion_err.txt
         echo "to:$emailAddress" > $mail_path/mail_creacion_err.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_creacion_err.txt
         echo "Subject:DB Creation Process Failed" >> $mail_path/mail_creacion_err.txt
         sudo touch $mail_path/mail_removeDB.txt
         echo "to:$emailAddress" > $mail_path/mail_removeDB.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_removeDB.txt
         echo "Subject:DB Removing Process is Done " >> $mail_path/mail_removeDB.txt
         sudo touch $mail_path/mail_removeDB_err.txt
         echo "to:$emailAddress" > $mail_path/mail_removeDB_err.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_removeDB_err.txt
         echo "Subject:DB Removing Process Failed" >> $mail_path/mail_removeDB_err.txt
         sudo touch $mail_path/mail_restartApp.txt
         echo "to:$emailAddress" > $mail_path/mail_restartApp.txt
         echo "from:Admin@p3rolix.com" >> $mail_path/mail_restartApp.txt
         echo "Subject:DB Restarting/Uninstalling App" >> $mail_path/mail_restartApp.txt
	 echo " --- Formatos de Correo Electronico creados Correctamente..."
	 sleep 3
	 flag=false
 else
  	echo -e " --- Formato de Correo Electronico Incorrecto, vuelva a Intentarlo..."
        flag=true	
fi

done
fi

       

	 if [ -d $backupFinal_path  ]; then
           echo "Existe Directorio final de Backups"
 	else
           creating_BackupFinal_path=$(sudo mkdir $backupFinal_path)
           echo " --- Directorio final de Archivos de Backups creado correctamente..."
 	fi
	 
	if [ -d $logs_path  ]; then
           echo "Existe Directorio de Logs"
 	else
           creating_logs_path=$(sudo mkdir $logs_path)
           echo " --- Directorio de Almacenamiento de Archivos de Auditoria creado correctamente..."
 	fi

	 if [ -d $last_log_path  ]; then
           echo "Existe Directorio de log de Reinicio"
 	else
           creating_last_log_path=$(sudo mkdir $last_log_path)
           echo " --- Directorio de Almacenamiento de Log de Reinicializacion creado correctamente..."
 	fi

 	if [ -d $downloads_path  ]; then
           echo "Existe Directorio de Downloads"
 	     else
              creating_downloads_path=$(sudo mkdir $downloads_path)
               echo " --- Directorio para Almacenamiento de Descargas creado correctamente..."
 	fi
                sleep 3
        else

                echo -e "\n * * * Cancelada instalacion..."
                sudo rm -r $app_path
                read -n 1 -s -r -p " * * * Presione [ENTER] para Salir..."
                clear

  fi
fi

 
 #exportar la variable nombre para que este disponible para otros procesos

 #export initial_file
 #export opcion
#llamar al archivo donde vamos a exportar la variable nombre



}

main_path=$HOME
app_path=/home/ubuntu/shellCourse
backup_path=/home/ubuntu/shellCourse/Respaldos/
mail_path=/home/ubuntu/shellCourse/mails_formats
logs_path=/home/ubuntu/shellCourse/logs_PGU/
downloads_path=/home/ubuntu/shellCourse/downloadsFromAWS
configFiles_path=/home/ubuntu/shellCourse/PGU_config_files
initial_file=/home/ubuntu/shellCourse/PGU_config_files/initial.txt
last_log_path=/home/ubuntu/reinit_log_path/
backupFinal_path=/home/ubuntu/backupPostDelete/
emailAddress=""
regex="^[a-z0-9!#\$%&'*+/=?^_\`{|}~-]+(\.[a-z0-9!#$%&'*+/=?^_\`{|}~-]+)*@([a-z0-9]([a-z0-9-]*[a-z0-9])?\.)+[a-z0-9]([a-z0-9-]*[a-z0-9])?\$"
#respInicio="s"

if [[ $respInicio = "s" ]]; then
       sudo rm -r $app_path 
       clear
       echo  " --- La Aplicacion se ha reiniciado con Exito..."
       echo  " --- Si desea cargar de nuevo el Proceso de Instalacion pruebe escribiendo: "
       echo  "     sudo bash PGU_Ex_SEC.sh  en el terminal de Linux" 
       read -n 1 -s -r -p "Presione [ENTER] para continuar..."
       echo
       cd $main_path
       exit 0 
else
	#echo -e "\n$respInicio"
	#echo -e "\nNo reconoce RespInicio"
        #read -n 1 -s -r -p "Presione [ENTER] para continuar..."
	echo
fi        



if [ -d $app_path ]; then

   function_install 
     else
	    clear
	    echo " --- Creando Directorio Principal de la Aplicacion..."
	    sleep 4
	    sudo mkdir $app_path
	    echo  " --- Descargando Archivo de Operaciones..."
	    sleep 4 
	    sudo cp /home/ubuntu/myBashFiles/39_PGU_AWS_MAIL_LOGS_CONF_SEC.sh $app_path
	    function_install 
    fi

	 flag=true
         while [ "$flag" = true ]
       do
	 clear
	  read -p "Confirme nuevamente su direccion de correo electronico: " emailAddress
	  if  [[ $emailAddress =~ $regex ]]; then
              echo -e "\nCorreo confirmado..." 
              flag=false	  
      else
		echo -e " --- Formato de Correo Electronico Incorrecto, vuelva a Intentarlo..."
        	sleep 3
		flag=true
	
	fi
     done
fileToInitiate=$(sudo ls -S $configFiles_path/initial.txt)
if [ $? = 0 ]; then
	clear
	
		echo -e "\n * * * Aplicacion Inicializada..."
		read -n 1 -s -r -p " * * * Presione [ENTER] para Ejecutar Postgres Utilities Application..."
		sleep 3
		#export main_path

		export main_path
		export app_path
		export backup_path
		export mail_path
		export logs_path
		export downloads_path
		export configFiles_path
		export initial_file
		export emailAddress
		export last_log_path
		export backupFinal_path
		bash $app_path/39_PGU_AWS_MAIL_LOGS_CONF_SEC.sh
	else
		clear
		echo -e "\nEjecucion Cancelada..."
		echo    "No se ha conseguido el archivo de Inicio..."

fi


