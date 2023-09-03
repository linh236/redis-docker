class BaseSerializer < ActiveModel::Serializer
  include ApplicationHelper
  attr_accessor :created_at, :updated_at

  def created_at
    format_datetime(object.created_at)
  end

  def updated_at
    format_datetime(object.updated_at)
  end
end
