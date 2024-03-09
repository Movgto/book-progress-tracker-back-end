class CategoriesController < ApplicationController
  respond_to :json

  def index
    @categories = Category.all

    render json: @categories
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category
    end
  end

  def category_params
    params.require(:category).permit(%i[name])
  end
end
