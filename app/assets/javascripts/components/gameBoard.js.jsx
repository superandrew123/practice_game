var GameBoard = React.createClass({

  render: function(){
    // 5x5 board to start
    gameId = this.props.gameId;
    $.ajax('/turn', {
      method: 'POST',
      data: {
        game: {
          board: JSON.stringify(tiles),
          gameId: this.props.gameId,
          colors: colors
        }
      }
    });
    return(<div id="gameBoard">
        {
          tiles.map(function(row, i){
            return row.map(function(tile, e){
              return <Tile 
                color={tile.color} 
                dead={tile.dead} 
                key={i + "-" + e} 
                tileNumber={i + "-" + e}
                gameId={gameId}
              />;
            })
          })
        }
        </div>
      );
  }
});