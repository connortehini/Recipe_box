class RankingsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ranking = @recipe.rankings.create(rating_params)
    redirect_to recipe_path(@recipe)
  end 

  def destroy 
    @recipe = Recipe.find(params[:recipe_id])
    @ranking = @recipe.rankings.find(params[:id])
    @ranking.destroy
    redirect_to recipe_path(@recipe)
  end 

  private
  def rating_params
    params.require(:ranking).permit(:rating)
  end 

end
