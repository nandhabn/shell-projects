#!/bin/bash

# echo "$(tput rev)"
printf $(tput setaf 14)"0 slkmf\n"
for i in 0 1 2 3 4 5 6 7;do
A=$(tput setaf $i)
printf "${A}hello $i\n"
done
printf "$(tput blink) this is blinking"78ju 

