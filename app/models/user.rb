class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_many :games, dependent: :destroy
  after_create :generate_url

  def delete_unfinished_games
    self.games.where(status: nil).delete_all
  end
  
  def global_stats
    stats = Hash.new
    stats[:total_games] = self.total_games
    stats[:games_per_color] = self.games_per_color
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
  private 
    def generate_url
      date_time = DateTime.new.to_s
      self.url = Base64.urlsafe_encode64(rand(1000..9999).to_s + 'x' + self.id.to_s)
      self.save
    end
end
