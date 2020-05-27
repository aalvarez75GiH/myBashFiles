# ! /bin.bash
#Programa para ejemplificar el paso de argumentos

nombreCurso=$1
horarioCurso=$2

echo "El nombre del Curso es: $nombreCurso dictado en el horario: $horarioCurso"
echo "El numero de parametros enviados es: $#"
echo "Los partametros enviados son: $*"
echo "El nombre de este programa es: $0"



