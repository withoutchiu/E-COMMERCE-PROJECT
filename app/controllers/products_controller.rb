class ProductsController < ApplicationController
  ITEM_PER_PAGE = 9
  def index
    @page = params.fetch(:page, 0).to_i
    if(params[:catid].present?)
      @products = Product.where("category_id = ?", params[:catid]).offset(@page * ITEM_PER_PAGE).limit(ITEM_PER_PAGE)
      @count = @products.count
    else
      @products = Product.offset(@page * ITEM_PER_PAGE).limit(ITEM_PER_PAGE)
      @count = @products.count
    end
      @total_page = (@count / ITEM_PER_PAGE)

  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @product_searhced = Product.where("name LIKE ?", wildcard_search)
    @count = @product_searhced.count
  end
end
