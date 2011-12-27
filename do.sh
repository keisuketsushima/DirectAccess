#!/bin/sh

if test -n "$1" ; then
    len=$1
else
    len=1000000
    echo "The length of data is automatically specified by ${len}."
fi

gfortran -o datasource.out datasource.f90
echo "compiled datasource.f90"
gfortran -o fig47.out fig47.f90
echo "compiled fig47.f90"

echo $len | ./datasource.out
echo "executed datasource.out"
echo $len | ./fig47.out
echo "all finished"