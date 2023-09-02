class RankingSerializer < ActiveModel::Serializer
  attributes :id, :level, :score, :timing, :created_at, :updated_at, :user, :game

  def user 
    object.user
  end

  def game 
    object.game
  end
end
