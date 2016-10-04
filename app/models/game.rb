class Game < ActiveRecord::Base
  attr_accessor :current_board, :colors_raw
  def self.stats(score)
    connection = ActiveRecord::Base.connection

    game_stats_query = '
      SELECT 
        avg(score) as average,
        max(score) as high_score,
        (SELECT 
          COUNT(primary_color) from games where primary_color = \'green\') as greens,
        (SELECT 
          COUNT(primary_color) from games where primary_color = \'red\') as reds,
        (SELECT 
          COUNT(primary_color) from games where primary_color = \'yellow\') as yellows,
        (SELECT 
          COUNT(primary_color) from games where primary_color = \'blue\') as blues,
        (SELECT 
          COUNT(score)
          from games 
            where score > ' + score["points"].to_s + '
            and score IS NOT NULL
        ) as above,
        (SELECT 
          COUNT(score)
          from games 
            where score <= ' + score["points"].to_s + '
            and score IS NOT NULL
        ) as below  
      FROM games'
    game_stats = connection.execute(game_stats_query)[0]
    total_colors = game_stats['greens'].to_i + game_stats['blues'].to_i + game_stats['yellows'].to_i + game_stats['reds'].to_i
    your_color_occurance = game_stats[score['scores'][0][0] + 's'].to_i * 1.0 / total_colors

    total_games = game_stats['above'].to_i + game_stats['below'].to_i
    scored_lower_than = game_stats['above'].to_i / (total_games * 1.0)
    scored_higher_than = game_stats['below'].to_i / (total_games * 1.0)

    return {
      high_score: game_stats['high_score'].to_i,
      average: game_stats['average'].to_i,
      higher: self.pretty_percents(scored_higher_than, 1),
      lower: self.pretty_percents(scored_lower_than, 1),
      your_color: score['scores'][0][0],
      your_color_occurance: self.pretty_percents(your_color_occurance, 1),
      points: score["points"]
    }
  end
  def self.pretty_percents(float, decimals)
    return ((float * (10 ** (2 + decimals))).to_i * 1.0 / (10 ** (decimals))).to_s + '%'
  end
  def win?
    # Check to see if the board is complete 
    won = true
    board_locked = true
    win_color = self.current_board[0][0]

    self.current_board.each { |row|
      row.each { |col|
        won = false if(col['color'] != win_color)
        board_locked = false if(!col['dead'])
      }
    }
    return {
      win: won,
      board_locked: board_locked
    }
  end
  def get_score
    # Return a hash with score per color and final score
    results = Hash.new
    self.colors_raw.each do |color|
      results[color] = 0
    end
    # binding.pry
    self.current_board.each do |row|
      row.each do |tile|
        if(tile['dead'])
          results[tile['color']] += 1
        end
      end
    end
    all_points = results.sort_by {|color, count| - count}

    # Score is the count of your best color - the count of your second best color
    points = all_points[0][1] - all_points[1][1]
    
    results['points'] = points
    results['scores'] = all_points
    return results
  end
end
