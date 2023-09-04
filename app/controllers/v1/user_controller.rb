class V1::UserController < V1::BaseController
  def index
    render json: User.all, each_serializer: UserSerializer
  end

  def create
  end
end
