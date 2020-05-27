#! /bin/bash
# Programa para hacer prueba con la fecha y hora
# Crea un archivo log_date_time.txt y lo almacena en donde se este ejecutando.
FILE=log.txt
NEWFILE=${FILE%.*}_`date +%Y%m%d`_`date +%H%M%S`.${FILE#*.}
touch $NEWFILE
echo "El archivo $NEWFILE fue creado con exito"

