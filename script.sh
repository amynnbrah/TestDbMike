#!/bin/bash

echo -e "\nhello test bash\n"
echo "grep lines containing 'Mike' from main text file:"
grep -in "Mike" file_utf8.txt
awk '{gsub(/Mike/, "TestDB"); print}' file_utf8.txt >> file_utf8_modified.txt
echo -e "\nModified text lines after awk(Mike > TestDB):"
grep -in "testdb" file_utf8_modified.txt


echo -e "\ngrep lines containing 'data 1' from main text file:\n"
grep -in "data1" file_utf8.txt
awk '{gsub(/DATA1/, "PRIMARY"); print}' file_utf8.txt >> file_utf8_modified.txt
echo -e "\nModified text lines after awk(DATA1 > PRIMARY):"
grep -in "primary" file_utf8_modified.txt | awk -F ":" '{print $1 ":" $2}'
