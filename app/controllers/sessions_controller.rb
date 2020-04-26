class SessionsController < ApplicationController
  def create
    # find user by uniq username
    # try is built in
    user = User
      .find_by(username: params["user"]["username"])
      .try(:authenticate, params["user"]["password"])

    # conditional to render json object of a status notification, a boolean for logged in, and the user model data
    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user,
      }
    else
      render json: { status: 401 }
    end
  end
end
