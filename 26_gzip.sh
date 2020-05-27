# ! /bin/bash
# Programa para ejemplificar el empaquetamiento con el comando tar y  gzip
#Arnoldo Alvarez


echo "Empaquetar todos los Scripts ubicados en /shellCourse "
tar -cvf shellCourse.tar *.sh
gzip shellCourse.tar

echo "Empaquetando un solo archivo"
gzip -9 9_options.sh
