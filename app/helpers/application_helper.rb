module ApplicationHelper
  def format_datetime datetime
    return datetime.strftime("%m-%d-%Y")
  end
end
