class SearchesController < ApplicationController

  def new
    @search = Search.new
    @categories = Categories.all
    @brands = Brands.all
    @colors = Colors.all
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:keywords, :category_id, :brand_id, :color_id, :min_price, :mmax_price, :rating)
  end
end
