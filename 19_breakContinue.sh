# ! /bin/bash
# Programa para ejemplificar el uso del Break y Continue
#Arnoldo Alvarez

echo "Sentencias Break y Continue"

for file in $(ls)
do
    for num in {1..4}
    do
        if [ $file = "10_download.sh" ]; then
            break;
        elif [[ $file == 4* ]]; then
            continue;
        else
            echo "Nombre archivo:$file _ $num"
        fi
    done
done

