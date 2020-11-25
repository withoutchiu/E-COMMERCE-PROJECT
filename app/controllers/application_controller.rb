class ApplicationController < ActionController::Base
  before_action :initialize_session
  before_action :increment_visit_count
  helper_method :visit_count,:cart, :product_categories


  private

  def product_categories
    Category.all
  end

  def initialize_session
    session[:visit_count] ||= 0
    session[:shopping_cart] ||= []
  end

  def cart
    @product = Product.find(session[:shopping_cart])
  end

  def increment_visit_count
    session[:visit_count] += 1
  end

  def visit_count
    session[:visit_count]
  end

end
