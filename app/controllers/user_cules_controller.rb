class UserCulesController < ApplicationController
  def index
    user_cule = UserCule.all
    render json: {
      user_cule: user_cule,
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
end
