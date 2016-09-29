class Game < ActiveRecord::Base
  attr_accessor :current_board, :colors
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
    colors.each do |color|
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
    self.score = points
    
    results['points'] = points
    results['scores'] = all_points
    return results
  end
end
