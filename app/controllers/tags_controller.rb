class TagsController < ApplicationController
  def index 
    @tags = Tag.all
  end 

  def show 
    @tag = Tag.find(params[:id])
    @recipes = @tag.recipes
  end 

  def new 
    @tag = Tag.new
  end

  def create 
    @tag = Tag.new(tag_params)

    if @tag.save 
      redirect_to tags_path 
    else
      render :new
    end 
  end 

  def edit 
    @tag = Tag.find(params[:id])
  end

  def update 
    @tag = Tag.find(tag_params)

    if @tag.update(tag_params)
      redirect_to @tag
    else 
      render :edit 
    end 
  end 

  def destroy 
    @tag = Tag.find(params[:id])
    @tag.destroy

    redirect_to tags_path
  end 

  private
  def tag_params
    params.require(:tag).permit(:section, :tag_id)
  end
end
