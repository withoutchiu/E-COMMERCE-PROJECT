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

      @search = Search.new
      @categories = Category.pluck(:name, :id)
      @brands = Brand.all.pluck(:name, :id)
      @colors = Color.all.pluck(:name, :id)
  end

  def show
    @search = Search.new
    @categories = Category.pluck(:name, :id)
    @brands = Brand.all.pluck(:name, :id)
    @colors = Color.all.pluck(:name, :id)

    @product = Product.find(params[:id])
  end

  def search
    @search = Search.new
    @categories = Category.pluck(:name, :id)
    @brands = Brand.all.pluck(:name, :id)
    @colors = Color.all.pluck(:name, :id)

    @page = params.fetch(:page, 0).to_i
    wildcard_search = "%#{params[:keywords]}%"
    @product_searhced = Product.where("name LIKE ?", wildcard_search).offset(@page * ITEM_PER_PAGE).limit(ITEM_PER_PAGE)
    @count = @product_searhced.count
    @total_page = (@count / ITEM_PER_PAGE)
  end
end
