class RecipesController < ApplicationController

  def index
    if params[:ingredient].present?
      @recipes = Recipe.joins(:ingredients).where(ingredients: {id: params[:ingredient]}).sort_by{|recipe| RatingCalculatorService.average(recipe) }.reverse
    else  
      @recipes = Recipe.all.sort_by{|recipe| RatingCalculatorService.average(recipe) }.reverse
    end
  end 

  def show 
    @recipe = Recipe.find(params[:id])
    @ranking = @recipe.rankings
    @rating = RatingCalculatorService.average(@recipe)
  end 

  def new
    @recipe = Recipe.new 
    @ingredients = Ingredient.pluck(:name)
    @tags = Tag.pluck(:section)
  end 
  
  def create
    @recipe = Recipe.new(recipe_params)
    params[:recipe][:ingredients].each do |name|
      ingredient = Ingredient.find_by(name: name)
      @recipe.ingredients << ingredient
    end 
    params[:recipe][:tags].each do |section|
      tag = Tag.find_by(section: section)
      @recipe.tags << tag
    end 

    if @recipe.save

      redirect_to @recipe
    else 
      render :new
    end 
  end 

  def edit 
    @recipe = Recipe.find(params[:id])
    @ingredients = Ingredient.pluck(:name)
    @tags = Tag.pluck(:section)
  end 

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.ingredients.destroy_all
    @recipe.tags.destroy_all
    params[:recipe][:ingredients].each do |name|
      ingredient = Ingredient.find_by(name: name)
      @recipe.ingredients << ingredient
    end
    params[:recipe][:tags].each do |section|
      tag = Tag.find_by(section: section)
      @recipe.tags << tag
    end 

    if @recipe.update(recipe_params)
      redirect_to @recipe
    else 
      render :edit 
    end 
  end 

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to root_path 
  end 

  private
    def recipe_params
      params.require(:recipe).permit(:title, :description, :instructions, :ingredient_id, :recipe_id, :ingredients, :tags, :tag_id)
    end 
end
