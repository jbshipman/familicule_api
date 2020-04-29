class ProfilesController < ApplicationController
  include CurrentUserConcern

  def show
    profile = Profile.find_by(id: params[:id])
    render json: profile
  end

  def update
    # grab current_user id to build a profile onto
    # try is built in
    # {profile: {firstname, lastname, ....}}
    profile = Profile.find_by(id: params[:id])
    profile.update(
      firstname: params["profile"]["firstname"],
      lastname: params["profile"]["lastname"],
      bio: params["profile"]["bio"],
      birthday: params["profile"]["birthday"],
      # user_id: @current_user.id,
    )

    # conditional to render json object of a status notification, a boolean for logged in, and the user model data
    if profile
      session[:user_id] = @current_user.id
      render json: {
        status: :updated,
        logged_in: true,
        user: @current_user,
        profile: @current_profile,
      }
    else
      render json: { status: 401 }
    end
  end
end
