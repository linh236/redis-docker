class RankingsController < ApplicationController
  before_action :set_params, only: [:show]
  def index
    @rankings = Ranking.joins(:user, :game).all.order(created_at: :desc)
  end

  def level_ranking
    level = params[:level] || 1 
    @ranking = Ranking.joins(:user, :game).where(level: level).order(created_at: :desc)
  end

  private
    def set_params 
      @ranking = Ranking.find(params[:id])
    end
end
