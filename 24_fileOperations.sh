# ! /bin/bash
# Programa para ejemplificar las operaciones de un archivo
#Arnoldo Alvarez

echo "Operaciones de archivo"
mkdir -m 755 backupScripts

echo -e "\nCopiar Scripts en backupScripts"
cp *.* backupScripts/
ls -la backupScripts/

echo -e "\nMover el directorio backupScripts a otra ubicacion: $HOME"
mv backupScripts $HOME
echo -e "\nArchivo movido satisfactoriamente"

echo -e "\nEliminar los archivos txt del directorio $HOME/backupScripts"
rm  $HOME/backupScripts/*.txt
echo -e "\nArchivos txt eliminados!"



