
var Tile = React.createClass({
  changeColor: function (row, col){
    // top
    if(tiles[row - 1] !== undefined && !tiles[row - 1][col].dead){
      // Grab the color above the tile above and replace the tile above's color with that color
      if(tiles[row - 2] !== undefined){
        tiles[row - 1][col].color = tiles[row - 2][col].color;

      } else {
        // grab bottom row
        tiles[row - 1][col].color = tiles[tiles.length - 1][col].color;
      }
    }
    // bottom
    if(tiles[row + 1] !== undefined && !tiles[row + 1][col].dead){
      // Grab the color below the tile below and replace the tile below's color with that color
      if(tiles[row + 2] !== undefined){
        tiles[row + 1][col].color = tiles[row + 2][col].color;

      } else {
        // grab top row
        tiles[row + 1][col].color = tiles[0][col].color;
      }
    }
    // left
    if(tiles[row][col - 1] !== undefined && !tiles[row][col - 1].dead){
      // Grab the color left of the tile left of this and replace the tile left's color with that color
      if(tiles[row][col - 2] !== undefined){
        tiles[row][col - 1].color = tiles[row][col - 2].color;

      } else {
        // grab far right row
        tiles[row][col - 1].color = tiles[row][tiles[0].length - 1].color;
      }
    }
    // right
    if(tiles[row][col + 1] !== undefined && !tiles[row][col + 1].dead){
      // Grab the color right of the tile right of this and replace the tile right's color with that color
      if(tiles[row][col + 2] !== undefined){
        tiles[row][col + 1].color = tiles[row][col + 2].color;

      } else {
        // grab far left row
        tiles[row][col + 1].color = tiles[row][0].color;
      }
    }
    ReactDOM.render(<GameBoard gameId={this.props.gameId} />, document.getElementById('app-main'));
  },
  handleClick: function(event){
    // adjust the values across the tiles array
    var tileValues = this.props.tileNumber.split('-');
    var row = parseInt(tileValues[0]);
    var col = parseInt(tileValues[1]);
    tiles[row][col].clicks += 1;

    if(!tiles[row][col].dead){
      this.changeColor(row, col);
    }
    if(tiles[row][col].clicks >= 1){
      tiles[row][col].dead = true;
    }
  },
  render: function(){
    if(this.props.dead){
      var colorStatus = this.props.color + '-disabled';
    } else {
      var colorStatus = this.props.color;
    }
    var classes = "tile " + colorStatus;
    return (<div 
          id={'tile' + this.props.tileNumber}
          className={classes}
          color={this.props.color}
          onClick={this.handleClick}
      />);
  }
});