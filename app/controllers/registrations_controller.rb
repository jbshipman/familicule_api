class RegistrationsController < ApplicationController
  def create
    # create a new user
    # nested object as
    # {user { username, email, password }}
    user = User.create!(
      username: params["user"]["username"],
      email: params["user"]["email"],
      password: params["user"]["password"],
      password_confirmation: params["user"]["password_confirmation"],
    )

    # render status created
    # pass user object
    if user
      session[:user_id] = user.id
      # create profile here
      profile = Profile.create!(
        first_name: "fist name",
        last_name: "last_name",
        bio: "Interesting life stuff here.",
        birthday: "YYYY-MM-DD",
        user_id: user.id,
      )
      render json: {
        status: :created,
        user: user,
        profile: profile,
      }
    else
      render json: { status: 500 }
    end
  end
end
