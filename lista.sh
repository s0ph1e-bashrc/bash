#!/bin/bash

echo 'Digite pela extensão que deseja procurar (não é necessário adicionar .) ou digite 0 para procurar por todos os formatos.'
read formato
clear
echo 'Pesquisando por diretórios e arquivos...'
echo ''

for palavra in $(cat lista.txt)
do
diretorio=$(curl -s -o /dev/null -w "%{http_code}" $1/$palavra/)
  if [ $diretorio == "200" ]
  then
  echo "Diretorio encontrado: $1/$palavra"
  fi 

  if [ $formato != 0 ]
  then 
  arquivo=$(curl -s -o /dev/null -w "%{http_code}" $1/$palavra.$formato) 
  else
  arquivo=$(curl -s -o /dev/null -w "%{http_code}" $1/$palavra)
  fi 

  if [ $arquivo == "200" ]
  then
  echo "Arquivo encontrado: $1/$palavra"
  fi 
done
