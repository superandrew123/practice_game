var UserDashboard = React.createClass({
  render: function(){
    const games = this.props.games;
    const date = this.props.created.split('-');
    
    return (
        <div id="dashboard">
          <p id="user-create-date">First recorded game: {date[1] + '-' + date[2] + '-' + date[0]}</p>
          {
            games.map(function(game){
              return <UserGameData  key={game.id}
                                    board={game.board} 
                                    score={game.score}
                                    color={game.primary_color} />
            })
          }
        </div>
      );
  }
});