1. Hide cheats in the code to reward curious players who look through the source.

2. Make rooms modular. Game always starts in lobby, but elevator exits to random room.

3. Give players helpful info as rewards for completing puzzles (fun computer tricks, good places to eat, cool gems, etc).

4. At the end of the game players are given the combination to a locked locker. Inside is a real, tangible prize.











Rooms:

Yoga Room
Ping Pong Room






Controller logic loop

Controller checks room for completeness
Get user input
Ask if room responds to user input
  -If no, reply with default "I dont understand"
  -If yes, send command to room.
Controller waits to see if the room needs an additional response.
  -If no, redo the loop
  -If yes, controller asks for more user input
