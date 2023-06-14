class IllustsController < ApplicationController
  def new
    @illust=Illust.new
  end

  def index
    @illusts=Illust.all
    @illust=Illust.new
  end

  def edit
    @illust = Illust.find(params[:id])
  end

  def show
    @illust = Illust.find(params[:id])
  end

  def create
     @illust = Illust.new(illust_params)
    @illust.user_id = current_user.id
    if @illust.save
      redirect_to illust_path(@illust), notice: "You have created illust successfully."
    else
      @illusts = Illust.all
      render "index"
    end
    end

  def update
     @illust = Illust.find(params[:id])
    if @illust.update(illust_params)
      redirect_to illust_path(@illust), notice: "編集が完了しました"
    else
      render "edit"
    end
  end

  def destroy
    @illust = Illust.find(params[:id])
    @illust.destroy
    redirect_to illusts_path
  end

  private
  def illust_params
    params.require(:illust).permit(:title, :body)
  end

end
