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
    tiles[y].push(colors[parseInt(Math.random() * colors.length)]);
  }
  return tiles;
}

var tiles = createTiles();