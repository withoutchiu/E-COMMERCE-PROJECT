class WelcomeController < ApplicationController
  def new
    @search = Search.new
    @categories = Category.pluck(:name, :id)
    @brands = Brand.all.pluck(:name, :id)
    @colors = Color.all.pluck(:name, :id)
  end
end
