var NewGame = React.createClass({
  handleClick: function(e){
    ReactDOM.render(<GameBoard />, document.getElementById('app-main'));
  },
  render: function(){
    return <button onClick={this.handleClick}>New Game</button>
  }
});