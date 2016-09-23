
var Tile = React.createClass({
  changeColor: function (event){
    // adjust the values across the tiles array
    var tileValues = this.props.tileNumber.split('-');
    tileValues = [parseInt(tileValues[0]),parseInt(tileValues[1])];

    if(tileValues[0] == (tiles.length - 1) && (tileValues[1] == tiles[0].length - 1)){
      tiles[tileValues[0]][tileValues[1]] = tiles[0][0];
    } else {
      tiles[tileValues] = tiles[tileValues + 1];
      // var changed = 'tile' + (tileNumber + 1);
      // var nextColor = this.props.colors[tileNumber + 1];
    }
    debugger;
    // document.getElementById(changed).style.backgroundColor = nextColor;
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