var GameStats = React.createClass({
  render: function(){
    return (<div id="game-stats">
      <p>You scored higher than {this.props.higher} of players.</p>
      <p>You scored lower than {this.props.lower} of players.</p>
      <p>{this.props.your_color.capitalize()} was used to score {this.props.your_color_occurance} of the time.</p>
      <p>Highest score: {this.props.high_score}</p>
      <p>Average score: {this.props.average}</p>
    </div>);
  }
});


function create_GameStats(data){
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