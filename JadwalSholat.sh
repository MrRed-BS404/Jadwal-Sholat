#!/bin/bash

# Jadwal Sholat Version Bogor System 404 (??????Mr.Red??????)
# Bogor System 404
# Anonymous Indonesia

# color
lightblue='\e[1;34m'
yellow='\e[1;33m'
red='\e[1;31m'
white='\e[1;37m'

# user agent
useragent="Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:61.0) Gecko/20100101 Firefox/61.0"

# getAPI
ambil(){
	curl -s -A "${useragent}" "https://time.siswadi.com/pray/${kota}" >> result.lst
	if [[ $(cat result.lst) =~ "invalid address g88" ]]; then
		echo "[!] Kota Salah ..."
	else
		LozShubuh=$(cat result.lst | grep -Po '(?<="Fajr": ").*?(?=")')
		LozDzuhur=$(cat result.lst | grep -Po '(?<="Dhuhr": ").*?(?=")')
		LozAshar=$(cat result.lst | grep -Po '(?<="Asr": ").*?(?=")')
		LozMaghrib=$(cat result.lst | grep -Po '(?<="Maghrib": ").*?(?=")')
		LozIsya=$(cat result.lst | grep -Po '(?<="Isha": ").*?(?=")')
		

		echo -e $lightblue"Tanggal  : $yellow`date`"
		echo -e $lightblue"Kota     : $yellow$kota"
		echo -e $red"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
		echo -e $white"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
		echo -e $lightblue"Shubuh   : $red$LozShubuh"
		echo -e $lightblue"Dzuhur   : $red$LozDzuhur"
		echo -e $lightblue"Ashar    : $red$LozAshar"
		echo -e $lightblue"Magrib   : $red$LozMaghrib"
		echo -e $lightblue"Isya     : $red$LozIsya"
		
	fi
}

# banner
banner(){
echo -e $lightblue"			Thanks to $red Bogor System 404"
echo -e $lightblue"			Made with $red by Mr.Red"
echo -e $lightblue"			We Are $red Muslim Cyber"
echo ""
}

clear
read -p "Masukan Nama Kota Anda: " kota;
read -p "Mari Menuju Kemenangan (enter)";
clear
banner
ambil
rm -f result.lst
