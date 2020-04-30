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

      # create default profile here
      # User.user_id.create_profile
      profile = Profile.create!(
        firstname: "first name",
        lastname: "last name",
        bio: "Interesting life stuff here.",
        birthday: "YYYY-MM-DD",
        user_id: user.id,
      )

      # create default self-cule
      # User.user_id.cules.create
      # cules names are unique, so
      # default genereated cule will take
      # User.username as it's name

      cule = Cule.create!(
        name: user.username,
      )

      c_name = Cule.find_by(name: user.username)
      user_cule = UserCule.create!(
        user_id: user.id,
        cule_id: c_name.id,
      )

      render json: {
        status: :created,
        user: user,
        profile: profile,
        cule: cule,
      }
    else
      render json: { status: 500 }
    end
  end
end
