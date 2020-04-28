class SessionsController < ApplicationController
  include CurrentUserConcern

  def create
    # find user by uniq username
    # try is built in
    # {user: {username, password}}
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

  # this is a GET request
  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user,
      }
    else
      render json: {
        logged_in: false,
      }
    end
  end

  def logout
    reset_session
    render json: { status: 200, logged_out: true }
  end
end
