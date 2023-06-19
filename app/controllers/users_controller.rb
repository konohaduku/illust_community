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
     @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  def destroy
  end
end
