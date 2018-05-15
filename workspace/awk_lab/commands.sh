#!/bin/bash

sort -k1 Car_list | ./report1.awk | less -N

sort -k1 -k5 -k4 -k3 Car_list | ./report2.awk | less -N

sort -k5 -n Car_list | ./report3.awk | less -N

sort -k5 -n Car_list | ./report4.awk | less -N
