class V1::RankingController < V1::BaseController
  def index
    render json: Ranking.all, each_serializer: RankingSerializer
  end

  def create
    if best_ranking_exist?
      if @ranking.score < ranking_params.dig(:score)
        @ranking.update(score: ranking_params.dig(:score))
        render json: @ranking, serializer: RankingSerializer
      end
    else
      @ranking = Ranking.new(ranking_params)
      @ranking.user_id = ranking_params.dig(:user_id) || current_user
      if @ranking.save 
        render json: @ranking, serializer: RankingSerializer
      else 
        render json: @ranking.errors
      end
    end
  end

  private 

    def ranking_params
      params.require(:ranking).permit(:level, :score, :timing, :user_id)
    end

    def best_ranking_exist?
      @ranking = Ranking.find_by(level: ranking_params.dig(:level), user_id: ranking_params.dig(:user_id))
      @ranking
    end
end
