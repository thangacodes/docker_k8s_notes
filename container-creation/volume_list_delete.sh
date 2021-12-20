#!/bin/bash

echo "Enter 1 to list out docker volumes"
echo "Enter 2 to delete out docker volume"
read -p "Enter the number to list/delete:" NUMBER
if [ $NUMBER -eq 1 ]; then
  docker volume ls
elif [ $NUMBER -eq 2 ];then
  read -p "Enter the volume id to delete:" VOLID
  docker volume rm -f $VOLID

else
   echo "Enter only the number 1 or 2"
fi

