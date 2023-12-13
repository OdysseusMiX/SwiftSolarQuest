#  Solar Quest Kit API

## Game
This is the main object that will be created and held in memory. A Game holds all the other objects and has methods to control the objects as needed.

To initialize a new Game, you must specify the number of players. If an invalid number of players is specified, then the initializer fails and returns nil.
```
let game : Game? = Game(numberOfPlayers: 3)
```
### `roll(_:_:) -> [Game.RollResult]` method
Used to tell the game what values were rolled. The game will return one or more roll results for the current player.

### `Game.RollResult` enum
Enumeration of possible resulting actions from a roll for the current player.



## Board
The Board holds information about the layout of the locations, holds information for each location, and defines the connections between locations for pathfinding. 

### `locations` property
An array of Location objects. The starting point for all players is the first element of the array. Position on the board is referenced as an index into the array.

### `positionOfPlayer()` method
Used to determine the position of any player. Provide the player number, which starts at 1.

### `place(player:at:)` method
Used to move players on the board. Provide the player index, starting at 1, and the location index as determined by the `Game.roll` method.

## BoardState (Not Implemented)
The state of the Board holds the mutable state information of the Board. This includes the location of each player and the placement of any fuel stations.


