class UsersController < ApplicationController
  # include CurrentUserConcern

  def index
    user = User.all
    render json: user
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user
  end

  # def update
  #   user = User.find_by(id: params[:id])
  #   first_name = params[:first_name]
  #   last_name = params[:last_name]
  #   bio = params[:bio]
  #   birthday = params[:birthday]
  #   user.first_name = first_name
  #   user.last_name = last_name
  #   user.bio = bio
  #   user.birthday = birthday
  #   user.save!
  # end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :bio, :birthday, :cule_ids => [])
  end
end
