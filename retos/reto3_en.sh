# ! /bin/bash
# Programa para cumplir con el reto#3
#Arnoldo Alvarez

opcion=""
numA=0
numB=0
numC=0
telRegex= '^\(?([0-9]{3})\)?([0-9]{3})[.]?([0-9]{4})$' #Solo acepta el formato telefonico (xxx)xxx.xxxx Ej:(706)612.4602
telRegex2='^\([0-9]\{3\}\)\([0-9]\{3\}\)\([0-9]*\)/(\1) \2 . \3/$'
pathArchivo=""
aritmetica=""
funcion=""
phone=""
resp=""

echo "Options: \n
        1.- Steps to avoid CoronaVirus
        2.- Do some math functions
        3.- Verify Phone number format
        4.- Verify a directory
        5.- See the content of a file
        6.- Quit"

echo -e "\n"
read -p "Enter your Option " opcion

case $opcion in
    "1") echo -e "\nWhat you need to do is::
                    a) Wash your hands frequently.
                    b) Elbow. Cough into it.
                    c) Face.Do not touch it
                    d) Space. keep Social distance
                    e) Home. Stay if you can"

         ;;

    "2") read -p "Enter Number A: " numA
         read -p "Enter Number B: " numB
         echo    "Arithmetical Functions
                    1.- Add
                    2.- Multiply
                    3.- Division"
         echo -e "\n"
         read -p "Choose Arithmetical Function: " aritmetica

         case $aritmetica in

              "1")  funcion="Add"
                    numC=$((numA + numB));;
              "2")  funcion="Product"
                    numC=$((numA * numB));;
              "3")  funcion="Division"
                    numC=$((numA / numB));;
                *)  funcion="Function Not defined"
                    echo "Wrong Option";;
         esac

            echo "Mathematical result $funcion: $numC "
         ;;

    "3") read -p "Enter Phone Number: " telefono

            if [[ $telefono =~ $telRegex2 ]]; then
                echo "Wright Format  inside EEUU"
            else
            phone=$telefono
            plainPhone=$(echo $phone | sed "s/[()-.]//g")
            echo "Formato Incorrect inside  EEUU"
            read -n1 -p "Do you want to convert Phone Number format into (123)456.7890 s/n:  "  resp
            echo -e "\n$resp"
             if [ $resp = "s" ]; then
              formatedPhone2=$(echo $plainPhone | sed "s/\([0-9]\{3\}\)\([0-9]\{3\}\)\([0-9]*\)/(\1) \2 . \3/")
              echo "Converted phone number: $formatedPhone2 "
             else
                 echo "Thanks for your time"
             fi
            fi
            ;;

    "4") read -p "Enter the Directory Path: " dirPath
            if [[ -d $dirPath  ]]; then
                echo "Directory $dirPath do Exist"

                else
                    echo "Directorio DO NOT Exist o IS NOT a directorio"
            fi


        ;;

     "5") read -p "Enter file Path: " filePath
         if [[ -e $filePath  ]]; then
             cat $filePath
         else
             echo "File DID NOT Found"
         fi

         ;;

    "6") echo "Quiting...";;
      *) echo "Wrong Option, Sorry"
esac









