class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :current 


  def current 
    Current.user = current_user if user_signed_in?
  end
end
