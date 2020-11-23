class ProductsController < ApplicationController
  ITEM_PER_PAGE = 10
  def index
    @page = params.fetch(:page, 0).to_i
    @products = Product.offset(@page * ITEM_PER_PAGE).limit(ITEM_PER_PAGE)

  end

  def show
  end
end
