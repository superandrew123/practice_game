class Game < ActiveRecord::Base
  def self.win?(turn)
    # Check to see if the board is complete 
    won = true
    board_locked = true
    win_color = turn[0][0]

    turn.each { |row|
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
  def self.get_score(turn)
    # Return a hash with score per color and final score
    results = Hash.new
    turn.each do |row|
      row.each do |tile|
        if(results[tile['color']] == nil)
          results[tile['color']] = 0
        end
        results[tile['color']] += 1
      end
    end
    score = results.sort_by {|color, count| - count}

    results['points'] = score[0][1] - score[1][1]
    results['scores'] = score
    return results
  end
end
