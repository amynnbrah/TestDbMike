#!/bin/bash

echo -e "\nhello test bash\n"

awk '{gsub(/Mike/, "TestDB"); print}' file_utf8.txt >> file_utf8_modified.txt
echo -e "\nmike >> testDB"
awk '{gsub(/DATA1/, "PRIMARY"); print}' file_utf8.txt >> file_utf8_modified.txt
echo -e "\nDATA1 >> PRIMARY"
