// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function newGame(){
  return fetch('/games/new',{
    mode:'cors',
    method: 'GET'
  }).then(function(response){
    return response;
  })
}

function createTiles(){
  var tiles = [];
  var colors = [
    "red", "blue", "green", "yellow"
  ];
  var y = 0;
  for(var i = 0; i < 25; i++){
    if(i != 0 && i % 5 == 0){
      y++;
    }
    if(tiles[y] === undefined){
      tiles[y] = [];
    }
    var tile = {
      clicks: 0,
      color: colors[parseInt(Math.random() * colors.length)],
      dead: false
    };
    tiles[y].push(tile);
  }
  return tiles;
}

var tiles = createTiles();

function display_game_status(status){
  document.getElementById('score').innerHTML = "Score: " + status.points;
  document.getElementById('tile-color').innerHTML = status.scores[0][0];
  document.getElementById('tile-count').innerHTML = status.scores[0][1];
}

function game_over(status, conditions){
  var final = document.getElementById('final');
  var message = '';

  final.style.display = "block";
  
  if(status.points > 20){
    message = 'Amazing!';
  } else if(status.points > 15){
    message = 'Great job!';
  } else if(status.points > 10){
    message = 'Well done!';
  } else if(status.points > 7){
    message = 'Not bad!';
  } else {
    message = 'Hmmm, not not bad';
  }
  final.innerHTML = 'Game Over: ' + message;
}