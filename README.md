# OO Tic-Tac-Toe Challenge

Hello! This repo contains my code for an object oriented Tic-Tac-Toe game runable from the command line. There is no web-based interface, only command line input and output.

### My logic for determining a win

My goal from the start was to make an algorithm that would work for a board shape of any size. I ended up with the following idea for a board of size n (n rows and n columns):

If each mark, X or O, comes along with a value of 1 or -1, the win tests can use the sum of those values to test for the required number of marks compared to n.

In this scenario, if a row, column, or diagonal is all occupied by the same mark, the sum will add up to either n or -n. Thus, that's what the "won" methods test for: to see if any row, any column, or any diagonal have values that add up to n or -n. If they add up to n, the only possibility is that they are all occupied by X's and the game is won. If they add up to -n, they are all occupied by O's, and the game is similarly won.

One nice advantage of this system is that the methods to check winning scenarios do not have to worry about checking to see if all the spaces are occupied or not. This is so because a space is initialized with a value of 0. Since the test for winning only needs to know if the game is over, any sum between -n and n simply signifies that the winning condition for that line (row, column, diagonal) has not been met; whether it's because there are empty squares or some squares are X's while others are O's doesn't matter.

This solution is scalable as well, because the logic scales as n does. Playing on a 5-by-5 board? A sum of 5 still means all spaces along that line are occupied by X's and the game is won, and the same goes for -5 and O's.

The only other test for end-game that is needed is to test for wether the game board is full with no winner. That can simply be achieved for seeing if there are any spaces still remaining with a value of 0. If that is the case and the other winning tests haven't returned true, the game board is full with no winner.

### Things I would have liked to have done if I had more time

1. A larger test suite

There's always more tests to be written! It would of course be ideal to have 100% coverage with tests, but I sadly didn't have the time to make much headway in the realm of coverage.

The tests for the winning combinations were very useful in helping me check the logic and data manipulations, especially because they let me use pries in the individual methods without having to run the whole program.

2. Making the computer player smart

In a simple game of Tic-Tac-Toe on a 3x3 board, I think the move priority would be something like this:

  - Take a space that results in a win
  - Take a space that blocks the opponent from winning
  - Take the middle space
  - Take a corner space (can be part of 3 different ways to win)
  - Take an edge space.

3. Add functionality to let two human players play against each other.
