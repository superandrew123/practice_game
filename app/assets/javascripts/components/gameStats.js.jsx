var GameStats = React.createClass({
  handleClick: function(){
    location.reload();
  },
  render: function(){
    new Audio('/assets/sounds/yay.mp3').play();
    return (<div id="game-stats">
      <p>You scored higher than {this.props.higher} of players.</p>
      <p>You scored lower than {this.props.lower} of players.</p>
      <p>{this.props.your_color.capitalize()} was used to score {this.props.your_color_occurance} of the time.</p>
      <p>Highest score: {this.props.high_score}</p>
      <p>Average score: {this.props.average}</p>
      <button onClick={this.handleClick}>New Game</button>
    </div>);
  }
});


function create_GameStats(data){
  var final = document.getElementById('final');
  var message = '';

  if(data.points > 20){
    message = 'Amazing!';
  } else if(data.points > 15){
    message = 'Great job!';
  } else if(data.points > 10){
    message = 'Well done!';
  } else if(data.points > 7){
    message = 'Not bad!';
  } else {
    message = 'Hmmm, not not bad';
  }
  final.style.display = "block";
  final.innerHTML = 'Game Over: ' + message;

  ReactDOM.render(
    <GameStats
      higher={data.higher}
      lower={data.lower}
      average={data.average}
      high_score={data.high_score}
      your_color={data.your_color}
      your_color_occurance={data.your_color_occurance}
    />, document.getElementById('game-stats-container'));
}