class ProductsController < ApplicationController

  private
  def product_params
    params.require(:product).permit(:illust_name, :illust_body, :is_active, :tag_list, illust_images_attributes: []).merge(user_id: current_user.id)
  end

  def new
    @product = Product.new
    @product.images.build
  end
end
