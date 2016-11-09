# desc "TODO"
# task give_games_user: :environment do
#   user = User.first
#   if user == nil 
#     user = User.create
#   end
#   @games = Game.where(user_id: nil)
#   @games.each do |game|
#     game.user_id = user.id
#     game.save
#   end
# end
