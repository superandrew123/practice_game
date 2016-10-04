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

Array.prototype.shuffle = function() {
  var j, x, i;
  for (i = this.length; i; i--) {
    j = Math.floor(Math.random() * i);
    x = this[i - 1];
    this[i - 1] = this[j];
    this[j] = x;
  }
}

function createTiles(){
  var tiles = [];
  var y = 0;
  var total_tiles = 25;
  var count_of_colors = parseInt(total_tiles / colors.length);
  var tile_colors = [];
  for(var i = 0; i < colors.length; i++){
    tile_colors = tile_colors.concat(returnColors(colors[i],count_of_colors));
  }
  for(var i = 0; i < total_tiles - tile_colors.length; i++){
    tile_colors.push(colors[parseInt(Math.random() * colors.length)]);
  }
  tile_colors.shuffle();
  for(var i = 0; i < total_tiles; i++){
    if(i != 0 && i % 5 == 0){
      y++;
    }
    if(tiles[y] === undefined){
      tiles[y] = [];
    }
    var tile = {
      clicks: 0,
      color: tile_colors[i],
      dead: false
    };
    tiles[y].push(tile);
  }
  return tiles;
  function returnColors(color,count){
    var colors_array = [];
    for(var i = 0; i < count; i++){
      colors_array.push(color);
    }
    return colors_array;
  }
}

var colors = ["red", "blue", "green", "yellow"];
var tiles = createTiles();

// Comment in/out the following line for testing
// tiles = JSON.parse('[[{"clicks":1,"color":"green","dead":true},{"clicks":1,"color":"blue","dead":true},{"clicks":1,"color":"blue","dead":true},{"clicks":1,"color":"blue","dead":true},{"clicks":1,"color":"green","dead":true}],[{"clicks":1,"color":"red","dead":true},{"clicks":1,"color":"green","dead":true},{"clicks":1,"color":"red","dead":true},{"clicks":1,"color":"green","dead":true},{"clicks":1,"color":"red","dead":true}],[{"clicks":1,"color":"green","dead":true},{"clicks":1,"color":"blue","dead":true},{"clicks":1,"color":"red","dead":true},{"clicks":1,"color":"red","dead":true},{"clicks":1,"color":"blue","dead":true}],[{"clicks":1,"color":"red","dead":true},{"clicks":1,"color":"blue","dead":true},{"clicks":1,"color":"red","dead":true},{"clicks":1,"color":"yellow","dead":true},{"clicks":1,"color":"green","dead":true}],[{"clicks":1,"color":"green","dead":true},{"clicks":1,"color":"blue","dead":true},{"clicks":1,"color":"yellow","dead":true},{"clicks":1,"color":"green","dead":true},{"clicks":1,"color":"green","dead":true}]]');
var gameId = 0;

function display_game_status(status){
  document.getElementById('score').innerHTML = "Score: " + status.points;
  var score_text = status.scores.map(function(score_data){
    return score_data[0].capitalize() + ": " + score_data[1];
  });
  document.getElementById('tile-scores').innerHTML = score_text.join("<br>");
}

String.prototype.capitalize = function() {
    return this.replace(/(?:^|\s)\S/g, function(a) { return a.toUpperCase(); });
};
