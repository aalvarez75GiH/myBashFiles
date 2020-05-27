# ! /bin/bash
# Programa para ejemplificar el empaquetamiento con el comando pbzip
#Arnoldo Alvarez


echo "Empaquetar todos los Scripts ubicados en /shellCourse "
tar -cvf shellCourse.tar *.sh
pbzip2 -f shellCourse.tar

echo "Empaquetando un directorio con tar y pbzip2"
#tar -cf *.sh -c > shellCourseDos.tar.bz2
sudo tar -cf *.sh -c > shellCourseDos.tar.bz2 
