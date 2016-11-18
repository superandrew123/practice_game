var UserStats = React.createClass({
  render: function(){
    return (<div id="user-stats">
      <p>Total Games Played: <span>{this.props.total_games}</span></p>
      <div>
        <p>Games Played Per Color:</p>
        {
          this.props.games_per_color.map(function(games,i){
            return <p className="games-per-color" key={i}>{games.color.capitalize()}: {games.count}</p>;
          })
        }
      </div>
      <p>Average Score: <span>{this.props.mean_score}</span></p>
      <p>Mode of Scores: <span>{this.props.modal_score}</span></p>
    </div>);
  }
});

function build_UserStats(data){
  ReactDOM.render(
    <UserStats 
      total_games={data.total_games}
      games_per_color={data.games_per_color}
      mean_score={data.mean_score}
      modal_score={data.modal_score}
    />,
    document.getElementById('user-data-body'));
}