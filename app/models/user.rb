class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_many :games, dependent: :destroy
  after_create :generate_url

  def delete_unfinished_games
    self.games.where(status: nil).delete_all
  end
  
  def stats
    stats = Hash.new
    stats[:total_games] = self.total_games
    stats[:games_per_color] = self.games_per_color
    stats[:mean_score] = self.mean_score
    stats[:modal_score] = self.modal_score
    stats
  end

  def total_games
    self.games.length
  end

  def games_per_color
    colors = self.games.pluck(:primary_color).uniq
    totals = Hash.new
    colors.each do |color| 
      totals[color] = self.games.where(primary_color: color).count
    end
    totals
  end

  def mean_score
    (Game.where(user_id: self.id).average(:score) * 100).to_i / 100.0
  end

  def modal_score
    scores = Game.where(user_id: self.id).order(:score).pluck(:score)
    mode_values = scores.inject(Hash.new(0)) { |score_keys, score|
      score_keys[score] += 1
      score_keys
    }
    mode = [false, 1]
    mode_values.each { |k, v|
      if v > mode[1]
        mode = [k, v]
      end
    }
    return mode[0] ? mode[0] : 'No Modal Score'
  end

  private 
    def generate_url
      self.url = Base64.urlsafe_encode64(rand(1000..9999).to_s + 'x' + self.id.to_s)
      self.save
    end
end
