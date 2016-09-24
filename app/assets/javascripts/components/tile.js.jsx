
var Tile = React.createClass({
  changeColor: function (event){
    // adjust the values across the tiles array
    var tileValues = this.props.tileNumber.split('-');
    var row = parseInt(tileValues[0]);
    var col = parseInt(tileValues[1]);

    // top
    if(tiles[row - 1] !== undefined){
      // Grab the color above the tile above and replace the tile above's color with that color
      if(tiles[row - 2] !== undefined){
        tiles[row - 1][col] = tiles[row - 2][col];

      } else {
        // grab bottom row
        tiles[row - 1][col] = tiles[tiles.length - 1][col];
      }
    }
    // bottom
    if(tiles[row + 1] !== undefined){
      // Grab the color below the tile below and replace the tile below's color with that color
      if(tiles[row + 2] !== undefined){
        tiles[row + 1][col] = tiles[row + 2][col];

      } else {
        // grab top row
        tiles[row + 1][col] = tiles[0][col];
      }
    }
    // left
    if(tiles[row][col - 1] !== undefined){
      // Grab the color left of the tile left of this and replace the tile left's color with that color
      if(tiles[row][col - 2] !== undefined){
        tiles[row][col - 1] = tiles[row][col - 2];

      } else {
        // grab far right row
        tiles[row][col - 1] = tiles[row][tiles[0].length - 1];
      }
    }
    // right
    if(tiles[row][col + 1] !== undefined){
      // Grab the color right of the tile right of this and replace the tile right's color with that color
      if(tiles[row][col + 2] !== undefined){
        tiles[row][col + 1] = tiles[row][col + 2];

      } else {
        // grab far left row
        tiles[row][col + 1] = tiles[row][0];
      }
    }

    ReactDOM.render(<GameBoard />, document.getElementById('app-main'));
  },
  handleClick: function(event){
    this.changeColor(event);
  },
  render: function(){
    var tileStyle = {
      'backgroundColor': this.props.color
    }
    return (<div 
          id={'tile' + this.props.tileNumber}
          className="tile" 
          color={this.props.color}
          style={tileStyle} 
          onClick={this.handleClick}
      />);
  }
});