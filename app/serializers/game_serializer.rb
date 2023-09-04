class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :is_public, :creator_by

  def creator_by 
    object.user.email
  end
end
