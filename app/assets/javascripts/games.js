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
tiles = JSON.parse('[[{"clicks":1,"color":"green","dead":true},{"clicks":1,"color":"blue","dead":true},{"clicks":1,"color":"blue","dead":true},{"clicks":1,"color":"blue","dead":true},{"clicks":1,"color":"green","dead":true}],[{"clicks":1,"color":"red","dead":true},{"clicks":1,"color":"green","dead":true},{"clicks":1,"color":"red","dead":true},{"clicks":1,"color":"green","dead":true},{"clicks":1,"color":"red","dead":true}],[{"clicks":1,"color":"green","dead":true},{"clicks":1,"color":"blue","dead":true},{"clicks":1,"color":"red","dead":true},{"clicks":1,"color":"red","dead":true},{"clicks":1,"color":"blue","dead":true}],[{"clicks":1,"color":"red","dead":true},{"clicks":1,"color":"blue","dead":true},{"clicks":1,"color":"red","dead":true},{"clicks":1,"color":"yellow","dead":true},{"clicks":1,"color":"green","dead":true}],[{"clicks":1,"color":"green","dead":true},{"clicks":1,"color":"blue","dead":true},{"clicks":1,"color":"yellow","dead":true},{"clicks":1,"color":"green","dead":true},{"clicks":1,"color":"green","dead":true}]]');
var gameId = 0;

function display_game_status(status){
  document.getElementById('score').innerHTML = "Score: " + status.points;
  var score_text = status.scores.map(function(score_data){
    return score_data[0].toUpperCase() + ": " + score_data[1];
  });
  document.getElementById('tile-scores').innerHTML = score_text.join("<br>");
}