#!/bin/bash

echo -e "\nhello test bash\n"
#clear the target file
truncate -s 0 file_utf8_modified.txt
echo "press 1 if you want to create a new file"
echo "press 2 if you want to modify the existing file"
read CHOICE
if [[ $CHOICE -eq 1 ]]
then
echo "please enter desired new file name"
read TARGETFILE
else
TARGETFILE=file_utf8_modified.txt 
fi
#get occurrences of "Mike" from origin
echo "grep lines containing 'Mike' from main text file:"
grep -in "Mike" file_utf8.txt
#get occurrences of "DATA1" from origin 
echo -e "\ngrep lines containing 'data 1' from main text file:\n"
grep -in "data1" file_utf8.txt

#switch the original occurrences to the desired ones 
awk '
/Mike/ {gsub(/Mike/, "TestDB")}
/DATA1/ {gsub(/DATA1/, "PRIMARY")}
{print}
' file_utf8.txt > "$TARGETFILE"

#check changes Mike > TestDB
echo -e "\nModified text lines after awk(Mike > TestDB):\n"
grep -in "testdb" "$TARGETFILE"
#check changes DATA1 > PRIMARY 
echo -e "\nModified text lines after awk(DATA1 > PRIMARY):\n"
grep -in "$TARGETFILE" | awk -F ":" '{print $1 ":" $2}'
