var GameBoard = React.createClass({

  render: function(){
    // 5x5 board to start
    $.ajax('/turn', {
      method: 'POST',
      data: {
        game: {
          board: JSON.stringify(tiles),
          colors: JSON.stringify(colors)
        }
      }
    });

    return(<div>
      <div id="game-stats-container"></div>
        <div id="gameBoard">
        {
          tiles.map(function(row, i){
            return row.map(function(tile, e){
              return <Tile 
                color={tile.color} 
                dead={tile.dead} 
                key={i + "-" + e} 
                tileNumber={i + "-" + e}
              />;
            })
          })
        }
        </div>
      </div>
      );
  }
});