class RankingSerializer < BaseSerializer
  include ApplicationHelper
  attributes :id, :level, :score, :timing, :created_at, :updated_at, :player, :game

  def player 
    UserSerializer.new(object.user)
  end

  def game 
    GameSerializer.new(object.game)
  end
end
