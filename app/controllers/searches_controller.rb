class SearchesController < ApplicationController
  def new
    search_variables
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    search_variables

    @search = Search.find(params[:id])
  end

  def update
    search_variables

    @search = Search.new
    @search = Search.create(search_params)
    redirect_to @search
  end

  private

  def search_params
    params.require(:search).permit(:keywords, :category_id, :brand_id, :color_id, :min_price, :mmax_price, :rating)
  end

  def search_variables
    @search = Search.new
    @categories = Category.pluck(:name, :id)
    @brands = Brand.all.pluck(:name, :id)
    @colors = Color.all.pluck(:name, :id)
  end
end
