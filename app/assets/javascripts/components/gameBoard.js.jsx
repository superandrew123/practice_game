var GameBoard = React.createClass({
  getInitialState: function() {
    return {
      tiles : []
    };
  },
  
  render: function(){
    // 5x5 board to start
    return(<div id="gameBoard">
        {
          tiles.map(function(row, i){
            return row.map(function(color, e){
              return <Tile color={color} key={i + "-" + e} tileNumber={i + "-" + e} />;
            })
          })
        }
        </div>
      )
  }
});