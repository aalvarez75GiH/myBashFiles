# !/bin/bash
# Programa para aprender a declarar variables
 opcion=0
 nombre="Arnoldo"

 #echo "Opcion: $opcion y nombre: $nombre"

 #exportar la variable nombre para que este disponible para otros procesos

 export nombre
 export opcion
#llamar al archivo donde vamos a exportar la variable nombre

./2_variables2.sh

