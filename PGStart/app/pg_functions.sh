#!/bin/sh
#functions.sh
#�������� ������� 
is_it_a_directory () 
{
#is_it_a_directory
#�����: is_it_a_directory ���_�������� 
#
if [ $# -lt 1 ]; then
echo "is_it_a_directory: I need a directory name to check"
return 1 
fi
# ��� ������� ?
DIRECTORY_NAME=$1
if [ ! -d $DIRECTORY_NAME ]; then
return 1 
else
return 0 
fi
}
#----------------------------------------------------------------------------------
error_msg ()
{
echo -e "\007"
echo $@
echo -e "\007"
return 0
}