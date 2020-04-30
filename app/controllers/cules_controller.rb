class CulesController < ApplicationController
  def index
    cule = Cule.all
    render json: {
      cule: cule,
    }
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def cule_params
    params.require(:cule).permit(user_ids: [])
  end
end
