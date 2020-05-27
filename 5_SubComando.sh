# ! /bin/bash
# Programa para asignar comandos a variables para su posterior utilizacion.
#Arnoldo Alvarez

nombreCurso=$1
horario=$2
ubicacionActual=`pwd`
infoKernel=$(uname -a)

echo "El nombre del Curso es: $nombreCurso"
echo "El horario del mismo es: $horario"
echo "La ubicacion actual donde estamos es: $ubicacionActual"
echo "Informacion del Kernel es: $infoKernel"





