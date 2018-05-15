#!/bin/bash

echo "Hello, Welcome to Rock-Paper-Scissors!"


printf "choose: "
read input

choice2=$(((RANDOM%3) + 1))

case $input in
  rock) choice=1;;
  paper) choice=2;;
  scissors) choice=3;;
  *) choice=4;;
esac

case $choice2 in
  1) comp=rock;;
  2) comp=scissors;;
  3) comp=paper;;
esac

if (( choice == 4 )); then
  result=invalid
elif (((( choice == 1 )) && (( choice2 == 3 ))))\
  || (((( choice == 2 )) && (( choice2 == 1 ))))\
  || (((( choice == 3 )) && (( choice2 == 2 )))); then
  result=win
elif (((( choice2 == 1 )) && (( choice == 3 ))))\
  || (((( choice2 == 2 )) && (( choice == 1 ))))\
  || (((( choice2 == 3 )) && (( choice == 2 )))); then
  result=lose
else
  result=tie
fi

echo "Result: $result"
time=$(date +"%m-%d-%Y %H:%M:%S")

record="$input vs $comp, $result. Played on $time"

dir="$PWD/rps_$(date +"%B_%Y")/"
filename="game_$(date +"%B_%d-%A_%H:%M")"

if [ ! -d $dir ] ; then
  mkdir $dir
fi

echo $record >> "$dir/$filename.txt"
