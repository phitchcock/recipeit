require 'will_paginate/array' 

class RecipesController < ApplicationController

  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :vote]
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :vote]

  def index
    @recipes = Recipe.paginate(:page => params[:page], :per_page => 30).sort_by{|x| x.total_votes}.reverse
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

  def vote
    @vote = Vote.create(voteable: @recipe, user: current_user, vote: params[:vote])

    if @vote.valid?
      flash[:notice] = "Vote counted"
    else
      flash[:error] = "Vote not counted"
    end

    redirect_to :back
  end

  private

  def recipe_params
    params.require(:recipe).permit!
  end

  def set_recipe
    @recipe = Recipe.friendly.find(params[:id])
  end

end