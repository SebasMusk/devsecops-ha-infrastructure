#!/bin/bash 
#Cargamos nuestro modelo de inventario que utiliza Ansible (inicialmente sin 
#las dirreciones IP de las maquinas Harbor)
cp modeloInventory.ini inventory.ini
#Añadimos el contenido del fichero ip_harbors.txt al final de nuestro inventario,
#de este modo en un futuro podemos escalar el cluster harbor simplemente añadiendo
#al final del fichero de IPs la nueva IP de la maquina a añadir.
cat ip_harbors.txt >> inventory.ini
#Lanzamos la instalacion.
ansible-playbook -i inventory.ini montar.yml
