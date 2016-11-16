var UserStats = React.createClass({
  render: function(){
    debugger;
    return '';
  }
});

function build_UserStats(data){
  debugger;
  ReactDOM.render(
    <UserStats 
      total_games={data.total_games}
      games_per_color={data.games_per_color}
      mean_score={data.mean_score}
      modal_score={data.modal_score}
    />,
    document.getElementById('user-data-body'));
}