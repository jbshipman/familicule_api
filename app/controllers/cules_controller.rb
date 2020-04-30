class CulesController < ApplicationController
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
    cule = Cule.create!(cule_params)

    # render status created
    # pass up cule object
    if cule
      render json: {
        status: :created,
        cule: cule,
      }
    else
      render json: { status: 500 }
    end
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
