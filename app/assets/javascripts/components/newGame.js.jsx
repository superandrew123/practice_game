var NewGame = React.createClass({
  handleClick: function(e){
    ReactDOM.render(<GameBoard gameId={this.props.game} />, document.getElementById('app-main'));
  },
  render: function(){
    return (<div>
              <div id="instructions">
                The goal is to get the points. Points are accumulated by clicking on tiles. The score is calculated by subtracting the second largest clicked tile from the most clicked. <br /> For example, if you have 12 Blue tiles, 6 Red, 4 Yellow and 3 Green, your score would be 6 (12 - 6). Clicking a tile changes the color of the tiles around it.
              </div>
              <button onClick={this.handleClick}>New Game</button>
            </div>
      );
  }
});