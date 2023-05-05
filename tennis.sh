#!/bin/bash
scoreP1=50
scoreP2=50
choiceP1=0
choiceP2=0
ballPossision=0
firstRoundFlag=0
roundLoser=0
winner=3

print_ball() {
    case $ballPossision in
    -3)
        # pleyer 1: out erea 
        echo "O|       |       #       |       | "
    ;;
    -2)
        # plyer 1: 2 erea
        echo " |   O   |       #       |       | "
    ;;
    -1)
        # plyer 1: 1 erea
        echo " |       |   O   #       |       | "
    ;;
    0)
        # middel erea
        echo " |       |       O       |       | "
    ;;
    1)
        # plyer 2: 1 erea
        echo " |       |       #   O   |       | "
    ;;
    2)
        # plyer 2: 2 erea
        echo " |       |       #       |   O   | "
    ;;
    3)
        # plyer 2: out erea
        echo " |       |       #       |       |O"
    ;;

    esac
}

validate_choice() {
    if [ $1 -eq 1 ]
    then
        if [[ $choiceP1 =~ ^[0-9]+$ ]]; then
            if [[ $choiceP1 -le $scoreP1 && $choiceP1 -ge 0 ]]; then
                return 0
            else
                return 1
            fi
        else
            return 1
        fi
    else
        if [[ $choiceP2 =~ ^[0-9]+$ ]]; then
            if [[ $choiceP2 -le $scoreP2 && $choiceP2 -ge 0 ]]; then
                return 0
            else
                return 1
            fi
        else
            return 1
        fi
    fi
}

get_plyer_choice() {
    if [ $1 -eq 1 ]
    then
        echo "PLAYER 1 PICK A NUMBER: "
        read -s choiceP1
        if validate_choice 1; then
            return
        else
            echo "NOT A VALID MOVE !"
            get_plyer_choice 1
        fi
    else
        echo "PLAYER 2 PICK A NUMBER: "
        read -s choiceP2
        if validate_choice 2 ; then
            return
        else
            echo "NOT A VALID MOVE !"
            get_plyer_choice 2
        fi
    fi
}

print_board() {
    echo " Player 1: ${scoreP1}         Player 2: ${scoreP2} "
    echo " --------------------------------- "
    echo " |       |       #       |       | "
    echo " |       |       #       |       | "
    print_ball $ballPossision
    echo " |       |       #       |       | "
    echo " |       |       #       |       | "
    echo " --------------------------------- "
    if [ $firstRoundFlag -eq 0 ]; then
        firstRoundFlag=1
    else
        echo -e "       Player 1 played: ${choiceP1}\n       Player 2 played: ${choiceP2}\n\n"
    fi
}

# setting the ball possision acording to the winner of the round
find_round_loser() {
    # if player 1 lost this round:
    if [ $choiceP1 -lt $choiceP2 ]; then
        roundLoser=1
        if [ $ballPossision -le 0 ]; then
            ballPossision=$((ballPossision-1))
        else    
            ballPossision=-1
        fi
    # if player 2 lost this round:
    elif [ $choiceP1 -gt $choiceP2 ]; then 
        roundLoser=2
        if [ $ballPossision -ge 0 ]; then
            ballPossision=$((ballPossision+1))
        else
            ballPossision=1
        fi
    # this round ended with a tie:
    else
        roundLoser=0
    fi
}

# find out if someone won the game this round
applay_game_rulls() {
    scoreP1=$((scoreP1 - choiceP1))
    scoreP2=$((scoreP2 - choiceP2))

    if [ $ballPossision -eq -3 ]; then
       winner=2
    elif [ $ballPossision -eq 3 ]; then
        winner=1
    elif [ $scoreP1 -le 0 ] && [ $scoreP2 -gt 0 ]; then
        winner=2
    elif [ $scoreP1 -gt 0 ] && [ $scoreP2 -lt 0 ]; then
        winner=1
    elif [ $scoreP1 -eq 0 ] && [ $scoreP2 -eq 0 ]; then
        if [ $ballPossision -eq 0 ]; then
            winner=0
        elif [ $ballPossision -lt 0 ]; then
            winner=2
        else
            winner=1
        fi
    fi
}

play_game() {
    while [[ $winner -eq 3 ]]; do
       print_board
       get_plyer_choice 1
       get_plyer_choice 2
       find_round_loser
       applay_game_rulls 
    done

    print_board
    case $winner in
    0)
        echo "IT'S A DRAW !"
    ;;
    1)
        echo "PLAYER 1 WINS !"
    ;;
    2)
        echo "PLAYER 2 WINS !"
    ;;
    esac
}

play_game
