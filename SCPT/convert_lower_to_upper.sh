#!/bin/bash
read -p "Enter the name: " string
echo $string
echo "convert to upper case: ${string^^}"
echo "convert to lower case: ${string,,}"
