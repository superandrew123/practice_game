class Game < ActiveRecord::Base
  def self.win?(turn)
    # Check to see if the board is complete 
    won = true
    win_color = turn[0][0]
    turn.each { |row|
      row.each { |col|
        if(col != win_color)
          won = false
        end
      }
    }
    won
  end
end
