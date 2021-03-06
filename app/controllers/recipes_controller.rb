class RecipesController < ApplicationController
  before_action :set_recipe, only:[]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
  end
  
  def create
  end

  def edit
  end
  
  def update
  end

  def destroy
  end

  private
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
  def recipe_params
    params.require(:recipe).permit(:name)
  end
end
