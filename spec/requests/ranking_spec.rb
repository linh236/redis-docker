require 'rails_helper'

RSpec.describe "Rankings", type: :request do
  # describe "GET /index" do
  #   it "renders the index template" do 
  #     get :index
  #   end
  # end

  describe "POST /create" do 
    it "Create a ranking" do
      headers = { "ACCEPT": "application/json" }
      Ranking.create(user_id: 1, level: 1, score: 19, timing: '44')
      post "/v1/ranking", params: { ranking: { level: 1, score: 1, timing: '22', user_id: 1 }, headers: headers }
      expect(response.status).to eq 200
    end
  end
end
