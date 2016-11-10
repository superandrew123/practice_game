class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_many :games, dependent: :destroy
  after_create :generate_url

  def generate_url
    date_time = DateTime.new.to_s
    self.url = Base64.urlsafe_encode64(rand(10000).to_s + 'x' + self.id.to_s)
    self.save
  end
end
