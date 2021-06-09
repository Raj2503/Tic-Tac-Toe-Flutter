# Tic Tac Toe

The classic Tic Tac Toe game with **Flutter Services** and **Spotify API** integration to listen to music while playing.


  
## Project Structure: 
The rough breakdown of the current state of the game will consist of 
Game Logic, I/O and Spotify. The game logic consists of detecting taps of the user (selection of a cell from the grid)
and Computer choosing his next move based on current state of the grid.
The I/O includes mostly interaction of Touch Inputs given by the user and user 
given being the Independent choice of playing as 'X' or 'O'.
The Spotify API gets autherization from the user to access spotify and plays a given playlist feed into the code.  

I couldn't find myself a way to access the user's private playlists, so now it just plays the public playlists of spotify.  

Further down the line, I would love to find a way to access user's private data and play playlists of his/her choice.
The plan is to improve the Computer's algorithm to give a tough fight to the user and also add a highscore and multiplayer features. 
  
  
## Dependencies
1. get_it: ^1.0.3+2
2. rflutter_alert: ^1.0.3
3. rxdart: ^0.22.0
4. spotify_sdk: ^2.1.0

  
## App Preview
<img src="https://media.giphy.com/media/FsvZ1eUa9hOoi74yDi/giphy.gif"/>

### NOTE: 
Currently Only **Spotify Andriod Sdk** has been integrated, so it will only play music in only Andriod for now.
