class V1::RankingController < V1::BaseController
  def index
    render json: Ranking.all, each_serializer: RankingSerializer
  end

  def create
    if best_ranking_exist?
      if @ranking.score < ranking_params.dig(:score).to_i
        @ranking.update(score: ranking_params.dig(:score).to_i)
        render json: @ranking, serializer: RankingSerializer
      else 
        render json: @ranking, serializer: RankingSerializer
      end
    else
      @ranking = Ranking.new(ranking_params)
      @ranking.user_id = ranking_params.dig(:user_id).to_i || current_user
      if @ranking.save 
        render json: @ranking, serializer: RankingSerializer
      else 
        render json: @ranking.errors
      end
    end
  end

  private 

    def ranking_params
      params.require(:ranking).permit(:level, :score, :timing, :user_id, :game_id)
    end

    def best_ranking_exist?
      @ranking = Ranking.find_by(level: ranking_params.dig(:level).to_i, user_id: ranking_params.dig(:user_id).to_i, game_id: ranking_params.dig(:game_id).to_i)
      @ranking
    end
end
