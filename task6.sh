#! /bin/bash

echo "Hello!"

read -p 'Enter your username (CASE SENSITIVE): ' userName

echo -e "\n"

cd /home/$userName

echo "Working directory: "
pwd

echo -e "\n"

read -p 'Enter preferred measurement for units of space ( c - bytes, k - kilobytes, M - megabytes, G - gigabytes): ' unitType

echo -e "\n"

read -p 'Enter the minimum size of files you want to be found: ' size

echo -e "\n"

find . -type f -size +$size$unitType -exec ls -lsh {} \;

echo -e "\nSaving: output -> output.txt file..."

echo -e "Size entered: $size $unitType B\n" > output.txt

find . -type f -size +$size$unitType -exec ls -lsh {} \; >> output.txt

echo -e "\nCompressing: output.txt -> backup.tgz..."

tar -cvf backup.tgz output.txt

echo -e "\n"
