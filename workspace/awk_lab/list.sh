#!/bin/bash

sort -k1 Car_list | awk '$2 !~ /placeholder/{print}' | less -N

