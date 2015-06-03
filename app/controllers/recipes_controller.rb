class RecipesController < ApplicationController

  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  def destroy
    if @recipe.destroy
      redirect_to recipes_path
    else
      redirect_to @recipe
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit!
  end

  def set_recipe
    @recipe = Recipe.friendly.find(params[:id])
  end

end