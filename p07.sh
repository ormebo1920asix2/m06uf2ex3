#!/bin/bash

if (( $EUID != 0 )) 
	then echo "El scrip s'ha d'executar en root"
	exit 1
	
	else
	
	function opcio(){
		
		op=$(zenity --entry --text "Vols continuar?" --entry-text "S - N");
		
		if [[ $op == "S" ]]
		then
			main
		fi
		
		if [[ $op == "N" ]]
		then
			exit 5
		fi
	
	}
	
	function main(){
	clear
	
	dir=$(zenity --file-selection --title="Selecciona el directori" --directory --width=620 --height=200)
	
	if [ -d /var/$dir ]
	then
		cp /etc/sshd/sshd_config /var/$dir
		cp /etc/cups/cupsd.conf /var/$dir
		zenity --info --text "Fitxers copiats"
		opcio
	else
		zenity --info --text "La carpeta no existeix"
	fi
	}
	
	main
fi
