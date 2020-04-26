class ApplicationController < ActionController::Base
  # check user is auth'd user
  skip_before_action :verify_authenticity_token
end
