class SessionsController < ApplicationController
  include CurrentUserConcern

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

  def update
    user = User.find_by(username: params["user"]["username"])
    first_name = params[:first_name]
    last_name = params[:last_name]
    bio = params[:bio]
    birthday = params[:birthday]
    user.first_name = first_name
    user.last_name = last_name
    user.bio = bio
    user.birthday = birthday
    user.save!
  end
end
