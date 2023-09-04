class Ranking < ApplicationRecord
  belongs_to :user
  belongs_to :game
  
  after_save :broadcast
  
  private 

  def broadcast
    body = ranking_with_level.map { |p| RankingSerializer.new(p) }
    ActionCable.server.broadcast(
      "ranking_channel",
      { sender: user.email, body: body }
    )
  end

  def ranking_with_level 
    self.class.where(level: level).order(score: :desc)
  end
end
