class CategoriesController < ApplicationController

  before_filter :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @categories.update(category_params)
      redirect_to @category
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      redirect_to categories_path
    else
      redirect_to categories_path
    end
  end

  private

  def category_params
    params.require(:category).permit!
  end

  def set_category
    @category = Category.find(params[:id])
  end

end