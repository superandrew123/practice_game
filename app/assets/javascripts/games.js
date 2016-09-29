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

var colors = ["red", "blue", "green", "yellow"];
var tiles = createTiles();
var gameId = 0;

function display_game_status(status){
  document.getElementById('score').innerHTML = "Score: " + status.points;
  var score_text = status.scores.map(function(score_data){
    return score_data[0].toUpperCase() + ": " + score_data[1];
  });
  document.getElementById('tile-scores').innerHTML = score_text.join("<br>");
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