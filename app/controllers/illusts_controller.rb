class IllustsController < ApplicationController
  def new
    @illust=Illust.new

  end

  def index
    @illusts=Illust.all
    @illust=current_user.illusts.new
    @tag_list=Tag.all
  end

  def edit
    @illust = Illust.find(params[:id])
    @tag_list=@illust.tags.pluck(:name).join(',')
  end

  def show
    @illust = Illust.find(params[:id])
    @illust_tags = @illust.tags
  end

  def create
     @illust = current_user.illusts.new(illust_params)
    @illust.user_id = current_user.id
    tag_list=params[:illust][:tag_name].split(nil)
    if @illust.save
       @illust.save_tag(tag_list)
      flash[:notice] = "You have created illust successfully."
      redirect_to illust_path(@illust)
    else
      redirect_to illust_path(@illust)
      @illust = Illust.new
      render :new
    end
  end

  def update
     @illust = Illust.find(params[:id])
      tag_list=params[:illust][:tag_name].split(',')
    if @illust.update(illust_params)
      @illust.save_tag(tag_list)
      # このillust_idに紐づいていたタグを@oldに入れる
        @old_relations=IllustTag.where(illust_id: @illust.id)
    # それらを取り出し、消す。消し終わる
        @old_relations.each do |relation|
        relation.delete
        end
         @illust.save_tag(tag_list)
      redirect_to illust_path(@illust), notice: "編集が完了しました"
    else
      render "edit"
    end

    def search
    @tag_list = Tag.all  #こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
    @tag = Tag.find(params[:tag_id])  #クリックしたタグを取得
    @illusts = @tag.illuts.all           #クリックしたタグに紐付けられた投稿を全て表示
    end
  end


  private
  def illust_params
    params.require(:illust).permit(:illust_image, :illust_name, :illust_body, :is_active).merge(user_id: current_user.id)
  end

   def destroy
    @illust = Illust.find(params[:id])
    @illust.destroy
    redirect_to illusts_path
   end


end



