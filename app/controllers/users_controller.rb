class UsersController < ApplicationController
  def index
  end

  def edit
    @user=User.find(params[:id])
  end

  def show
    @user=User.find(params[:id])
    @illusts = @user.illust
  end

  def create
  end

  def update
  end

  def destroy
  end
end
