class Admin::ProductsController < Admin::BaseController
  load_and_authorize_resource
  before_action :load_categories, except: :destroy
  
  def index
    @products = Product.order_date_desc.paginate page: params[:page],
      per_page: Settings.product.per_page
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "admin.products.create.created"
      redirect_to admin_products_path
    else
      flash.now[:danger] = t "admin.products.create.create_error"
      render :new
    end
  end
  
  def edit
  end

  def update
    if @product.update_attributes product_params
      flash[:success] = t "admin.products.update.updated"
      redirect_to admin_products_path
    else
      flash.now[:danger] = t "admin.products.update.update_error"
      render :edit
    end
  end

  def destroy
   if @product.destroy
      flash[:success] = t "admin.products.destroy.deleted"
    else
      flash[:danger] = t "admin.products.destroy.delete_error"
    end
    redirect_to admin_products_path
  end

  private
  def product_params
    params.require(:product).permit :name, :category_id, :description, :price,
      :image
  end
  
  def load_categories
    @categories = Category.all
  end
end
