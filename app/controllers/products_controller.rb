class ProductsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @products = Product.filter_category(params[:category_id]).order_date_desc
      .paginate page: params[:page], per_page: Settings.product.per_page
  end

  def show
  end
end
