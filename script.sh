#!/bin/bash

#default target file
TARGETFILE=file_utf8_modified.txt 
#hello test
echo -e "\nhello test bash\n"
#clear the target file
truncate -s 0 file_utf8_modified.txt

#give the user a choice between using default file or creating a new one
echo "press 1 if you want to create a new file"
echo "press any other button if you want to modify the existing file"
read CHOICE

#if user creates a new file
if [[ $CHOICE -eq 1 ]]
then
#get file name
echo "please enter desired new file name"
read TARGETFILE
#make sure the file is clear
truncate -s 0 $TARGETFILE

fi
#get occurrences of "Mike" from origin
echo "grep lines containing 'Mike' from main text file:"
grep -in --color=auto "Mike" file_utf8.txt
#get occurrences of "DATA1" from origin 
echo -e  "\ngrep lines containing 'data 1' from main text file:\n"
grep -in --color=auto "data1" file_utf8.txt

#switch the original occurrences to the desired ones 
awk '
/Mike/ {gsub(/Mike/, "TestDB")}
/DATA1/ {gsub(/DATA1/, "PRIMARY")}
{print}
' file_utf8.txt > "$TARGETFILE"

#check changes Mike > TestDB
echo -e "\nModified text lines after awk(Mike > TestDB):\n"
grep -in --color=auto "testdb" "$TARGETFILE"
#check changes DATA1 > PRIMARY 
echo -e "\nModified text lines after awk(DATA1 > PRIMARY):\n"
grep -in --color=auto "PRIMARY" "$TARGETFILE" 
