var UserGameData = React.createClass({
  render: function(){
    const board = JSON.parse(this.props.board);
    return(<div className="game-data">
            <table className="mini-board"><tbody>
              {
                board.map(function(row, y){
                  return(<tr key={y} className="mini-row">
                        {
                          row.map(function(col, x){
                            return <td key={x} className={"mini-tile mini-tile-" + col.color}></td>;
                          })
                        }
                      </tr>);
                })
              }
            </tbody></table>
            <div className="game-numbers">
              <p>Score: {this.props.score}</p>
              <p>Primary Color: {this.props.color.capitalize()}</p>
            </div>
          </div>);
  }
});