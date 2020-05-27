# ! /bin/bash
# Programa para crear un PIN de seguridad aleatorio de 4 digitos
#Arnoldo Alvarez


pin=""
pin_inicial=""
sumaPin=0
numeroPIN=""


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


for ((i=0; i<4; i++))
do
	pin=$((1 + RANDOM % 9))
	pin_inicial=$pin_inicial$pin
done

    while :
pin_final=""
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


    esac
done
