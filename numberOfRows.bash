#!/bin/bash

###################################################################################################################################
# Author: Nasser Albalawi													   #
# Date Created: 09/17/2021													   #
# Descrption: This script will find the number of row for each month of 2020 in tucson_rain.txt with good quality raining readings.#
# Date: 09/17/2021														   #
 ###################################################################################################################################

# Creating the for loop
for month in [01..12]
	do
	  echo "*************************************"
# Counting the number of line for each month of 2020	  
	  #echo "The number of row for each month of 2020 is :"
	  #grep -w "2020-$month" tucson_rain.txt | wc -l

# The number of lines for each month of 2020 with good 	 
	  echo "The number of row for each month of 2020 with good is :"
	  #grep -w $'2020-*-*.*Good' tucson_rain.txt | wc -l
	  grep -w "2020-$month.*Good" tucson_rain.txt | wc -l

# Getting the ten lines or rows for each month of 2020 
          echo "Getting the first and last ten rows or line for each month of 2020 with good is :"
	  grep -w "2020-$month.*Good" tucson_rain.txt| head -n 10
	  grep -w "2020-$month.*Good" tucson_rain.txt| tail -n 10

	  echo "*************************************"
# Getting the total raining of each month of 2019	  
	  echo "total raining of each month of 2019"
	  #grep -w $'2019-*-*.' tucson_rain.txt |wc -l
	  grep -i "2019-$month.*Total rain" tucson_rain.txt | wc -l
	  grep -w "2019-$month." tucson_rain.txt| head -n 10
	  grep -w "2019-$month." tucson_rain.txt| tail -n 10

	  echo "*************************************"

# Getting the total raining of each month of 2018
	  echo "The number of line for 2018"
	  grep -i "2018-$month.*Total rain" tucson_rain.txt | wc -l
          grep -w "2018-$month." tucson_rain.txt| head -n 10
          grep -w "2018-$month." tucson_rain.txt| tail -n 10		
          
	  echo "*************************************"
	  
	  break	
done
