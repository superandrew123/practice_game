var GameBoard = React.createClass({
  getInitialState: function() {
    return {
      tiles : []
    };
  },
  
  render: function(){
    // 5x5 board to start
    $.ajax('/turn', {
      method: 'POST',
      data: {
        game: {
          board: JSON.stringify(tiles)
        }
      }
    });
    return(<div id="gameBoard">
        {
          tiles.map(function(row, i){
            return row.map(function(tile, e){
              return <Tile color={tile.color} dead={tile.dead} key={i + "-" + e} tileNumber={i + "-" + e} />;
            })
          })
        }
        </div>
      )
  }
});