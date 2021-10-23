#!/bin/bash

rm treninky.txt
#rm beachkemp.txt

cp trenink-new.html trenink-old.html
# cp beachkemp-new.html beachkemp-old.html

rm trenink-new.html
#rm beachkemp-new.html

wget http://michalek-beach.rezervuju.cz/training?event_group_id=35 --header="User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:23.0) Gecko/20100101 Firefox/23.0" --keep-session-cookies --save-cookies treninky.txt

wget http://michalek-beach.rezervuju.cz/training?event_group_id=35 --header="User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:23.0) Gecko/20100101 Firefox/23.0" --load-cookies treninky.txt -O trenink-new.html

#2020 wget http://michalek-beach.rezervuju.cz/training?event_group_id=46 --header="User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:23.0) Gecko/20100101 Firefox/23.0" --keep-session-cookies --save-cookies beachkemp.txt

#2020 wget http://michalek-beach.rezervuju.cz/training?event_group_id=46 --header="User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:23.0) Gecko/20100101 Firefox/23.0" --load-cookies beachkemp.txt -O beachkemp-new.html


###diff -u trenink-old.html trenink-new.html | grep -i HRA -B2 -A3 | grep -v \<td > patecni_hra_old.txt
#2020 diff -u trenink-old.html trenink-new.html | grep -i HRA -B2 -A3 | grep -v \<td  | sed  's/\+//g' | sed  's/<\/td>//g' > patecni_hra_old.txt
##diff -u trenink-old.html trenink-new.html | grep -i HRA -B2 -A3 | grep -v \<td | grep -v '[0-9]*\/[0-9]' | grep -v ^- | grep  -v ^--- | grep -v ^@@  > patecni_hra.txt
##diff -u trenink-old.html trenink-new.html | grep ^+ | grep -v '[0-9]*\/[0-9]' | grep -v ^+++ | grep -v ^- | grep  -v ^---  | grep -v ^@@ > vsechny_treninky.txt
##diff -u beachkemp-old.html beachkemp-new.html | grep ^+ | grep -v '[0-9]*\/[0-9]' | grep -v ^+++ | grep -v ^- | grep  -v ^---  | grep -v ^@@ > vsechny_beach_kempy.txt
#2020 diff -u trenink-old.html trenink-new.html | grep -e ^+.*HRA -B2  | grep -v \<td  | sed  's/\+//g' | sed  's/<\/td>//g' > patecni_hra.txt
diff -u trenink-old.html trenink-new.html | grep ^+ | grep -v '[0-9]*\/[0-9]' | grep -v ^+++ | grep -v ^- | grep  -v ^---  | grep -v ^@@ | grep -v \<td | grep -v class | grep -v \<\/tr\> | grep -v ^+\<\/td\> | sed  's/\+//g' | sed  's/<\/td>//g' | grep -v 20[0-9][0-9].[0-9]*:[0-9] > vsechny_treninky.txt
#2020 diff -u beachkemp-old.html beachkemp-new.html | grep ^+ | grep -v '[0-9]*\/[0-9]' | grep -v ^+++ | grep -v ^- | grep  -v ^---  | grep -v ^@@ | grep -v \<td | grep -v class | grep -v \<\/tr\> | grep -v ^+\<\/td\> | sed  's/\+//g' | sed  's/<\/td>//g' | grep -v 20[0-9][0-9].[0-9]*:[0-9] > vsechny_beach_kempy.txt



patecni_hra_old="patecni_hra_old.txt"
patecni_hra="patecni_hra.txt"
vsechny_treninky="vsechny_treninky.txt"
vsecny_beach_kempy="vsechny_beach_kempy.txt"
chybne_texty=$(cat vsechny_treninky.txt | grep "DOCTYPE\|function")

dt=`date '+%A %H:%M:%S %d %b %Y'`



if [ -n  "$chybne_texty" ] ;

        then

                echo konec scriptu
                exit 1

        fi



if [ -s  "$vsecny_beach_kempy" ] ;

        then

#               echo "beach kempy old" | mail  -s "Beach kempy PC" -a From:Beach_Michalek\<zahradnickova.alarm@gmail.com\> magyarr@live.com < vsechny_beach_kempy.txt
#               echo "beach kempy old" | mail  -s "Beach kempy PC " -a From:Beach_Michalek\<zahradnickova.alarm@gmail.com\> sundrys5@seznam.cz < vsechny_beach_kempy.txt
#               echo "beach kempy old" | mail  -s "Beach kempy PC" -a From:Beach_Michalek\<zahradnickova.alarm@gmail.com\> radek.magyar@deutsche-boerse.com < vsechny_beach_kempy.txt
   #             cat vsechny_beach_kempy.txt
                echo -------------------------------ZMENA--------------------------------------------------
                echo $dt >> zmena_vsechny_beach_kempy.txt
        else
                echo -------------------------------ZADNA ZMENA-------------------------------------------
  #              cat vsechny_beach_kempy.txt


        fi

if [ -s  "$patecni_hra_old" ] ;

        then

  #              echo "patecni hra old" | mail  -s "Patecni hra old" -a From:Beach_Michalek\<zahradnickova.alarm@gmail.com\> magyarr@live.com < patecni_hra_old.txt
 #               cat patecni_hra_old.txt
                echo -------------------------------ZMENA--------------------------------------------------
                echo $dt >> zmena_patek_hry_old.txt
        else
                echo -------------------------------ZADNA ZMENA-------------------------------------------
    #            cat patecni_hra_old.txt


        fi


if [ -s  "$patecni_hra" ] ;

        then

 #               echo "patecni hra" | mail  -s "Patecni hra PC" -a From:Beach_Michalek\<zahradnickova.alarm@gmail.com\> magyarr@live.com < patecni_hra.txt
#               echo "patecni hra" | mail  -s "Patecni hra PC" -a From:Beach_Michalek\<zahradnickova.alarm@gmail.com\> sundrys5@seznam.cz < patecni_hra.txt
#               echo "patecni hra" | mail  -s "Patecni hra PC" -a From:Beach_Michalek\<zahradnickova.alarm@gmail.com\> radek.magyar@deutsche-boerse.com < patecni_hra.txt
     #           cat patecni_hra.txt
                echo -------------------------------ZMENA--------------------------------------------------
                echo $dt >> zmena_patecni_hry.txt
        else
                echo -------------------------------ZADNA ZMENA-------------------------------------------
      #          cat patecni_hra.txt


        fi

if [ -s  "$vsechny_treninky" ] ;

        then

                echo "vsechny treninky" | mail  -s "Vsechny treninky PC" -a From:Beach_Michalek\<zahradnickova.alarm@gmail.com\> magyarr@live.com < vsechny_treninky.txt
                echo "vsechny treninky" | mail  -s "Vsechny treninky PC" -a From:Beach_Michalek\<zahradnickova.alarm@gmail.com\> sundrys5@seznam.cz < vsechny_treninky.txt
                echo "vsechny treninky" | mail  -s "Vsechny treninky PC" -a From:Beach_Michalek\<zahradnickova.alarm@gmail.com\> radek.magyar@deutsche-boerse.com < vsechny_treninky.txt
               cat vsechny_treninky.txt
                echo -------------------------------ZMENA--------------------------------------------------
                echo $dt >> zmena_vsechny_treninky.txt
        else
                echo -------------------------------ZADNA ZMENA-------------------------------------------
                cat vsechny_treninky.txt


        fi

rm -- 'training?event_group_id=35'
rm --  training?event_group id=35
rm -- 'training?event_group_id=35.*'
rm --  training?event_group id=35.*
rm -- 'training?event_group_id=35.?'
rm --  training?event_group id=35.?
#rm -- 'training?event_group_id=46'
#rm --  training?event_group id=46.*
