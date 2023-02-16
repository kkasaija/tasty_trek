class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  layout 'application'

  # def current_user
  #   if session[:user_id]
  #     Current.user = User.find_by(id: session[:user_id])
  #   end
  # end
end
