# ! /bin/bash
# Programa para ejemplificar el uso de los Loops Anidados
#Arnoldo Alvarez

echo "Loops Anidados"

#for file in $(ls)
#do
 #   for num in {1..4}
  #  do
   #     echo "Nombre archivo:$file _ $num"
    #done
#done

for ((i=00; i<24; i++))
do
    for ((ii=0; ii<60; ii++))
    do
        contador=$(($contador+1))
        if [ $i -lt 10 ]; then
            hour="0$i"
        else
            hour=$i
        fi
        if [ $ii -lt 10 ]; then
            min="0$ii"
        else
            min=$ii
        fi
        hourarray[$contador]="$hour:$min"
    done
done

echo "Valores Array : ${hourarray[*]}"
echo "Tamaño Array : ${#hourarray[*]}"
