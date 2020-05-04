class SessionsController < ApplicationController
  include CurrentUserConcern

  def create
    # find user by uniq username
    # try is built in
    # {user: {username, password}}
    user = User
      .find_by(username: params["user"]["username"])
      .try(:authenticate, params["user"]["password"])

    profile = Profile.find_by(user_id: user.id)

    cule = Cule.find_by(id: user.id)

    events = cule.events
    # conditional to render json object of a status notification, a boolean for logged in, and the user model data
    if user
      session[:user_id] = user.id
      # profile = Profile.find_by(id: user.id)

      render json: {
        status: :created,
        logged_in: true,
        user: user,
        profile: profile,
        cule: cule,
        events: events,
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
        profile: @current_profile,
        cule: @current_user_cule,
        events: @current_cule_events,
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
