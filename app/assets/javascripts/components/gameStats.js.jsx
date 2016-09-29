var GameStats = React.createClass({
  render: function(){
    return (<div id="game-stats">{this.props.message}</div>);
  }
});


function create_GameStats(data){
  debugger;
  var final = document.getElementById('final');
  var message = '';

  final.style.display = "block";
  
  if(status.points > 20){
    message = 'Amazing!';
  } else if(status.points > 15){
    message = 'Great job!';
  } else if(status.points > 10){
    message = 'Well done!';
  } else if(status.points > 7){
    message = 'Not bad!';
  } else {
    message = 'Hmmm, not not bad';
  }
  final.innerHTML = 'Game Over: ' + message;

  ReactDOM.render(<GameStats />, document.getElementById('game-stats-container'));
}