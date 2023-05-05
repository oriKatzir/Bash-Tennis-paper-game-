# Bash-Tennis-paper-game

This is a shell script written in Bash that simulates a tennis paper game between two players. 

## Usage

To run the script, navigate to its directory in the terminal and execute the following command:

```bash
./basketball.sh
```

## Gameplay

- Each player starts with 50 points.
- At the start of each round, the ball is placed in the middle row.
- Players take turns choosing a number between 0 and their remaining score.
- The player who chooses the smaller number moves the ball left by one row, and the player who chooses the larger number moves the ball right by one row.
- If a player's score reaches 0, they lose the game.
- If the ball goes out of bounds (i.e., reaches row -3 or 3), the player on the opposite side wins the game.
- The game also ends if both players' scores reach 0, and the winner is determined by the ball's position.

## Gameplay Example

```
 Player 1: 50         Player 2: 50 
 --------------------------------- 
 |       |       #       |       | 
 |       |       #       |       | 
 |       |       O       |       | 
 |       |       #       |       | 
 |       |       #       |       | 
 --------------------------------- 
PLAYER 1 PICK A NUMBER: 30
PLAYER 2 PICK A NUMBER: 20

       Player 1 played: 30
       Player 2 played: 20

 Player 1: 20         Player 2: 30 
 --------------------------------- 
 |       |       #       |       | 
 |       |       #       |       | 
 |       |       #   O   |       | 
 |       |       #       |       | 
 |       |       #       |       | 
 --------------------------------- 
PLAYER 1 PICK A NUMBER: 20
PLAYER 2 PICK A NUMBER: 30

       Player 1 played: 20
       Player 2 played: 30

 Player 1: 0         Player 2: 20 
 --------------------------------- 
 |       |       #       |       | 
 |       |       #       |       | 
 |       |       #       |   O   | 
 |       |       #       |       | 
 |       |       #       |       | 
 --------------------------------- 
PLAYER 1 PICK A NUMBER: 0
PLAYER 2 PICK A NUMBER: 20

       Player 1 played: 0
       Player 2 played: 20

 Player 1: 0         Player 2: 0 
 --------------------------------- 
 |       |       #       |       | 
 |       |       #       |       | 
 |       |       #       |       | 
 |       |       #       |       | 
 |       |       #       |       | 
 --------------------------------- 

Player 2 Wins!
```

## Author

This script was written by Ori Katzir.
