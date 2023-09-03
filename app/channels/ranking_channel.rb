class RankingChannel < ApplicationCable::Channel
  def subscribed
    stream_from "ranking_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data) 
    # Ranking.create!(user: current_user, body: data["body"])
  end
end
