class ProfilesController < ApplicationController
  # include CurrentUserConcern

  # def create
  #   # grab current_user id to build a profile onto
  #   # try is built in
  #   # {profile: {first_name, last_name, ....}}
  #   profile = Profile.create!(
  #     # first_name: params["profile"]["first_name"],
  #     first_name: "fist name",
  #     last_name: "last_name",
  #     bio: "Interesting life stuff here.",
  #     birthday: "YYYY-MM-DD",
  #     user_id: params["profile"][@current_user],
  #   )

  #   # conditional to render json object of a status notification, a boolean for logged in, and the user model data
  #   if profile
  #     session[:user_id] = user.id
  #     render json: {
  #       status: :created,
  #       logged_in: true,
  #       profile: profile,
  #     }
  #   else
  #     render json: { status: 401 }
  #   end
  # end
end
