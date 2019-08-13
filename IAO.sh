#!/bin/bash
# -*-Shell-script-*-
#
#/**
# * Title    : OS auto-detection binary Installer 
# * Auther   : by Alex, Lee
# * Created  : 04-10-2019
# * Modified :
# * E-mail   : cine0831@gmail.com
#**/
#
#set -e
#set -x

usage() {
    echo "
Usage: ${0##*/} [options]

Options:

    -f
    -h

Examples:
    ${0##*/} -f filename

Description:
    -f             target list for installing
    -h             display this help and exit
"
exit 1
}


# O/S list
if [ -f /usr/mgmt/IAO/IAO.list ]; then
    . /usr/mgmt/IAO/IAO.list
else 
    echo "can not read O/S list."
fi
CNT=${#OS_system_list[@]}


# detect O/S Version
if [ -f /usr/bin/lsb_release ]; then
    OS_system_ver=$(lsb_release -d | cut -d':' -f 2 | sed 's/^\s//g' | cut -d'(' -f 1 | cut -d'.' -f 1 | sed -e 's/^ *//g' -e 's/ *$//g')
elif [ -f /etc/redhat-release ]; then
    OS_system_ver=$(cat /etc/redhat-release | cut -d'(' -f 1 | cut -d'.' -f 1 | sed -e 's/^ *//g' -e 's/ *$//g')
fi

for ((i=0; i<$CNT; i++)); do
    OS_ver_init=$(echo "${OS_system_list[$i]}" | cut -d':' -f1)
    OS_ver_full=$(echo "${OS_system_list[$i]}" | cut -d':' -f2)

    if [ "${OS_ver_full}" == "${OS_system_ver}" ]; then
        ##echo "This is ${OS_ver_init} . ${OS_ver_full}"
        break
    fi
done


# installing
function installing(){
    local default_dir="/home/_work/build"
    local tgt_ver=$1
    local tgt_file=${default_dir}$2
    local tgt_path=${default_dir}$3

    if [ "${OS_ver_init}" == "${tgt_ver}" ]; then
        ##echo -e "$tgt_ver , $tgt_file , $tgt_path"
        if [ -f $tgt_file ]; then
            tar -xpf ${tgt_file} -C ${tgt_path}
        else
            echo "taget ${tgt_file} file is not."
        fi
    fi
    
}


# split argument from file
function test(){
    local filename=$1
    local tgt_ver=''
    local tgt_file=''
    local tgt_path=''

    while read line; do
        tgt_ver=$(echo ${line} | cut -d':' -f1)
        tgt_file=$(echo ${line} | cut -d':' -f2)
        tgt_path=$(echo ${line} | cut -d':' -f3)

        installing "$tgt_ver" "$tgt_file" "$tgt_path"
    done < $filename
}


while getopts "f:h" opt 
do
    case $opt in
        f) shift
           test $1
           ;;
        h) usage       
           ;;
        ?) usage
           ;;
    esac
done
