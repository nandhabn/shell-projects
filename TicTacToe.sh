#!/bin/bash
BG=$(tput rev)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
BLINK=$(tput blink)
NORMAL=$(tput sgr0)
RED=$(tput setaf 1)
function render() {
    printf " "_______"\n"
    printf "|       |\n| "
    for ((i = 1; i < 10; i++)); do
            if [ "${used[$(expr i+j-1)]}" == 1 ]; then 
            printf $BG$(tput setaf 14)"0"$NORMAL" "
            elif [ "${used[$(expr i+j-1)]}" == 2 ]; then 
            printf $BG$(tput setaf 40)"X"$NORMAL" "
            else printf "_ "
            fi

            if [ `expr $i  % 3` -eq 0 ];then 
            printf '|\n| '
            fi
    done
    printf ______"|"
}

function instructions() {
    printf $BG$GREEN"Tic Tac Toe on bash\n"
    printf $BG$RED"Instructions\n"$NORMAL
    printf $GREEN"Game starts with the player 1 \n"$NORMAL

}
function checkWinner() {
    if [[ ${used[0]} -eq ${used[1]} && ${used[0]} -eq ${used[2]} && ${used[1]} -ne _ ]]; then    #123
        printf $GREEN"\nPlayer "${currentPlayer}" has won\n"
        winner=1
    elif [[ ${used[0]} -eq ${used[3]} && ${used[0]} -eq ${used[6]} && ${used[6]} -ne _ ]]; then  #147
        printf $GREEN"\nPlayer "${currentPlayer}" has won\n"
        winner=1
    elif [[ ${used[4]} -eq ${used[1]} && ${used[1]} -eq ${used[7]} && ${used[7]} -ne _ ]]; then #258
        printf $GREEN"\nPlayer "${currentPlayer}" has won\n"
        winner=1
    elif [[ ${used[5]} -eq ${used[8]} && ${used[8]} -eq ${used[2]} && ${used[8]} -ne _ ]]; then #369
        printf $GREEN"\nPlayer "${currentPlayer}" has won\n"
        winner=1      
    elif [[ ${used[4]} -eq ${used[0]} && ${used[8]} -eq ${used[0]} && ${used[8]} -ne _ ]]; then #159
        printf $GREEN"\nPlayer "${currentPlayer}" has won\n"
        winner=1      
    elif [[ ${used[2]} -eq ${used[4]} && ${used[2]} -eq ${used[6]} && ${used[6]} -ne _ ]]; then #357
        printf $GREEN"\nPlayer "${currentPlayer}" has won\n"
        winner=1    
    elif [[ ${used[3]} -eq ${used[4]} && ${used[3]} -eq ${used[5]} && ${used[5]} -ne _ ]]; then #456
        printf $GREEN"\nPlayer "${currentPlayer}" has won\n"
        winner=1     
    elif [[ ${used[6]} -eq ${used[7]} && ${used[7]} -eq ${used[8]} && ${used[8]} -ne _ ]]; then #789
        printf $GREEN"\nPlayer "${currentPlayer}" has won\n"
        winner=1
    elif [ "$(echo ${used[@]} | grep -c _)" -eq 0 ] ; then
    echo $BLUE"\nGame tie\n"
    winner=1
    fi
}

function main() {
    winner=0
    used=(_ _ _ _ _ _ _ _ _)
    currentPlayer=1
    instructions
    printf $BLINK'Let... set... go!!!\n'$NORMAL
    while [ $winner -eq 0 ]; do
        printf "\nNow player "${currentPlayer}" plays\n"
        printf '\nEnter your option:'
        read option
        if [ ! $option ]; then 
        echo $RED"invalid option"$NORMAL
        continue
        fi
        if [  "${used[$(expr option-1)]}" != _ ]; then
            echo $RED${option}" already selected"$NORMAL
            continue
        fi
        used[$(expr $option-1)]=$currentPlayer
        render
        checkWinner
        [ "$currentPlayer" -eq 2 ] && currentPlayer=0
        currentPlayer=`expr ${currentPlayer} + 1`
    done
}
main    