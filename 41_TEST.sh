# ! /bin/bash
# Programa para crear un PIN de seguridad aleatorio de 4 digitos
#Arnoldo Alvarez




#for ((i=0; i<4; i++))
#do
 #   pin=$((1 + RANDOM % 9))
    #arregloPin[i]=$pin
  #  pin_final=$pin_final$pin
   # sumaPin=$((sumaPin + pin))
   # echo $pin 
#done
#echo $pin_final
#echo $sumaPin

#read -p "Ingrese el PIN de seguridad (4 digitos):  " numeroPIN
#if [ $numeroPIN = $pin_final ];then
#	echo "PIN VALIDO"
#else
#	echo "PIN INVALIDO"
#fi
Desinstalar(){

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

echo 
echo "Done. Password=$hidden_PIN"
sleep 4
if [ $hidden_PIN = $pin_final ];then
        read -s -p  "Ingrese el PIN  nuevamente para confirmar: " numeroPIN
        if [ $numeroPIN = $pin_final ];then
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
     fi
else
	 echo -e "\nPIN Incorrecto, Intente de Nuevo.."
        read -n 1 -s -r -p "Presione [ENTER] para continuar..."
        echo "$DATE-$TIME --- Usuario No puede Confirmar PIN de Seguridad - Modulo de Desinstalacion" >> $logs_path/$NEWFILE
fi
else
        echo "$DATE-$TIME --- Intento de PIN fallido 3 veces - Modulo de Desinstalacion" >> $logs_path/$NEWFILE
fi
}

pin=""
pin_inicial=""
sumaPin=0
numeroPIN=""
pin_final=""	

for ((i=0; i<4; i++))
do
	pin=$((1 + RANDOM % 9))
	pin_inicial=$pin_inicial$pin
done

    while :
do
    for ((i=0; i<4; i++))
    do
	    pin=$((1 + RANDOM % 9))
            pin_final=$pin_final$pin
    done
	
	#Limpiar la pantalla
    clear
    #Captar fecha y hora
    #Desplegar el menu de opciones
    echo "----------------------------------------"
    echo "PGUTIL - Programa de Utilidades PostGres"
    echo "----------------------------------------"
    echo "           MENU PRINCIPAL               "
    echo "----------------------------------------"
    echo "1.Mostrar PIN                           "
    echo "2.Mostrar PIN inicial                   "
    echo "3.Mostrar PIN 3                         "
    echo "4.Desinstalar Postgres                  "    
    
    
    #Validar la opcion ingresada
    read -n 1 -p "Ingrese la opcion: " opcion
    case $opcion in
        
	    1) echo -e  "\n$pin_final"
	
	      read -n 1 -s -r -p "Presione [ENTER] para continuar..."
      	    ;;

            2) echo -e "\n$pin_inicial"
	      read -n 1 -s -r -p "Presione [ENTER] para continuar..."

            ;;

            3) echo -e "\nSaliendo..."
	       exit 0
	       ;;
       	    4)echo -e "\n$pin_final"
	      sleep 3 
	      Desinstalar $pin_final


    esac
done
