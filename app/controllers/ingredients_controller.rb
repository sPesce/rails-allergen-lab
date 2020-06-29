class IngredientsController < ApplicationController
  before_action :set_ingredient, only:[]

  def index
    @ingredients = Ingredient.all
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
  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
