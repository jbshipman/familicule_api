class CulesController < ApplicationController
  include CurrentUserConcern

  def index
    cule = Cule.all
    render json: {
      cule: cule,
    }
  end

  def show
    cule = Cule.find(params[:id])
    render json: cule
  end

  # def new
  # end

  def create
    # create a new cule
    # nest object as
    # {cule: {name}}
    # cule = Cule.create!(cule_params)
    cule = Cule.create!(name: params["cule"]["name"])

    # render status created
    # pass up cule object
    if cule
      user_cule = UserCule.create!(user_id: @current_user.id, cule_id: cule.id)
      render json: {
        status: :created,
        cule: cule,
        user_cule: user_cule,
      }
    else
      render json: { status: 500 }
    end
  end

  def users_in_cule
    users_in_cule = Cule.find_by(id: params(:id)).users

    render json: {
      users_in_cules: users_in_cules,
    }
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  private

  def cule_params
    params.require(:cule).permit(:name, :user_ids => [])
  end
end
