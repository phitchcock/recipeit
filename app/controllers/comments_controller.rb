class CommentsController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.create(params.require(:comment).permit!)
    #@comment.user = current_user

    if @comment.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

end