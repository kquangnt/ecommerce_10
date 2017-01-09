class CartsController < ApplicationController
  def index
    @cart = session[:cart] ? session[:cart] : Hash.new
    @products = @cart.map {|id, quantity| [Product.find_by(id: id), quantity]}
  end

  def new
    session[:cart] = nil
    redirect_to carts_path
  end
  
  def create
    id = params[:product_id]
    session[:cart] = session[:cart] ||= Hash.new
    quantity = params[:quantity]
    @cart = session[:cart]
    @cart[id] = @cart[id] ? (@cart[id].to_i + quantity.to_i) : quantity.to_i
    redirect_to carts_path
  end
 
  def destroy
    session[:cart].delete params[:id]
    flash[:success] = t ".delete_successful"
    redirect_to carts_path
  end
end
