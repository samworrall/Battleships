# Battleships

## Description of game

Follows simple rules with the aim of sinking an opponents ship.
There are two players.
Each player has a 10x10 grid, with cells A1 through J10
There are different sizes of ships which can be placed on the grid in the preparation stage of the game.
Each round, players take turn to guess where to launch an attack, aiming to hit their opponents ship.


## Things to do

Implement the game!
Design system for user input
Think about how to keep track of hits and misses.
Unit tests. Integration tests.


## Design considerations

Another developer should be able to use your code without needed to make significant changes to your classes. Classes should be open to another developer extending their use.
Don't have to worry about display? Flexible enough that we have to do little more than rename methods to get it to work with our display?
Structure of the code- if designed well then classes will not depend heavily on each other. If designed badly then the tests will have to be long integration tests instead of small unit tests.


## Advance design considerations

Game state objects not tied directly to the way you are thinking of displaying it. Another developer might choose to display the game in terminal, on a web page, or as a web service accessed on a phone.
Code not directly tied to the input, so it is possible for another developer to add alternate input forms. Keyboard, mouse, gamepad, AI, website?
Keeping the game logic separate, so small variants to the rules could be added without having to change much of the other code and tests.

## User Stories

```
As a player,
So that I can set up my fleet,
I would like to be able to place a battleship on my board
```

```
As a player,
So that I can I can keep track of the health of my fleet
I would like to know if a battleship is destroyed or not
```

```
As a player,
So that I can attack my opponent,
I would like to be able to fire a missile at my opponent's board
```

```
As a player,
So that I know if my missile hit,
I would like to be notified if the missile hit or missed
```

```
As a player, so I don't fire a missile at the same target,
I would like to be able to keep track of my opponent's board
```

```
As a player,
So that I know when to stop firing along a certain line,
I would like to know when I have destroyed an opponent's battleship
```

```
As a player, so I know if I have won,
I would like the game to tell me I have won if all my opponent's battleships are destroyed
```
