# ! /bin/bash
# Programa para crear un PIN de seguridad aleatorio de 4 digitos
#Arnoldo Alvarez


unset password
prompt="Ingrese el PIN Inicial de seguridad (4 digitos):  "
while IFS= read -p "$prompt" -r -s -n 1 char
do
    if [[ $char == $'\0' ]]
    then
        break
    fi
    prompt='*'
    password+="$char"
done
echo
echo "Done. Password=$password"

