
var Tile = React.createClass({
  handleClick: function(event){
    var tileNumber = this.props.tileNumber;
    if(tileNumber == (this.props.colors.length - 1)){
      var nextColor = this.props.colors[0];
    } else {
      var nextColor = this.props.colors[tileNumber + 1]
    }
    event.target.style.backgroundColor = nextColor;
  },
  render: function(){
    var tileStyle = {
      'backgroundColor': this.props.color
    }
    return (<div 
          id={'tile' + this.props.tileNumber}
          className="tile" 
          style={tileStyle} 
          onClick={this.handleClick}
      />);
  }
});