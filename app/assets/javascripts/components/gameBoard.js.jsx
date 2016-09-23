var GameBoard = React.createClass({
  getInitialState() {
    return {
    };
  },
  
  render: function(){
    // 5x5 board to start
    var colors = [
      "red", "blue", "green", "yellow"
    ];
    var tiles = [];
    for(var i = 0; i < 25; i++){
      tiles.push(colors[parseInt(Math.random() * colors.length)]);
    }
    return(<div>
        {
          tiles.map(function(color, e, colors){
            return <Tile color={color} key={e} tileNumber={e} colors={colors}/>;
          })
        }
        </div>
      )
  }
});