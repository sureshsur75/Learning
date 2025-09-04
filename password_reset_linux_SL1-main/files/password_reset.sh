#!/bin/bash
##########################################################################################
#Author: Ranjith Kumar R
#Purpose: To change nagios user password randomnly
#Version: V.10
#Date : 23rd Feb 2018
##########################################################################################
USER="rmiipat1"

passwd="/usr/bin/passwd"

genpasswd() {

local l=$1

[ "$l" == "" ] && l=16

tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs

}

pass=`genpasswd`

echo "$pass"

echo -e "$USER:$pass" | chpasswd
