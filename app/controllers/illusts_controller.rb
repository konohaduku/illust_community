class IllustsController < ApplicationController
  def new
    @illust=Illust.new
    @tag_list=@illust.tags.pluck(:name).join('、')

  end

  def index
    @illusts=Illust.all
    @illust=Illust.new
    @tag_list=Tag.all
  end

  def edit
    @illust = Illust.find(params[:id])
    @tag_list=@illust.tags.pluck(:name).join(',')
  end

  def show
    @illust = Illust.find(params[:id])
    @post_tags = @illust.tags
  end

  def create
     @illust = Illust.new(illust_params)
    @illust.user_id = current_user.id
    tag_list=params[:illust][:name].split('、')
    if @illust.save
       @illust.save_tag(tag_list)
      flash[:notice] = "You have created illust successfully."
      redirect_to illust_path(@illust)
    else
      @illusts = Illust.all
      render :new
    end
  end

  def update
     @illust = Illust.find(params[:id])
      tag_list=params[:post][:name].split(',')
    if @illust.update(illust_params)
      @illust.save_tag(tag_list)
      # このpost_idに紐づいていたタグを@oldに入れる
        @old_relations=PostTag.where(post_id: @illust.id)
    # それらを取り出し、消す。消し終わる
        @old_relations.each do |relation|
        relation.delete
        end
         @illust.save_tag(tag_list)
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

  def save_tag(sent_tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete　Tag.find_by(name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
   end
  end

  private
  def illust_params
    params.require(:illust).permit(:title, :body)
  end

end
