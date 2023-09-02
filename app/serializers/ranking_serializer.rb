class RankingSerializer < ActiveModel::Serializer
  attributes :id, :level, :score, :timing, :created_at, :updated_at
end
