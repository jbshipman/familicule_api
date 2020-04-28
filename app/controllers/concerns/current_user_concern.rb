module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
  end

  # checks if sessions has a current user
  def set_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @current_profile = Profile.find_by(user_id: session[:user_id])
    end
  end
end
