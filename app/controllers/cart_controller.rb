class CartController < ApplicationController
  #POST /cart
  #Data sent as form data (params)
  def create
    logger.debug("Adding params #{params[:id]} to the car")
    id = params[:id].to_i
    unless session[:shopping_cart].include?(id)
      session[:shopping_cart] << id
      product = Product.find(id)
      flash[:notice] = "#{product.name} added to cart. "
    end
    redirect_to products_path
  end

  #DELETE /cart/:id
  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    product = Product.find(id)
    flash[:notice] = "#{product.name} removed from the cart. "

    redirect_to products_path
  end
end
