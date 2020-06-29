class UsersController < ApplicationController
  before_action :set_user, only: [:show,:destroy,:edit,:update]

  def index
    @users = User.all
  end

  def show
  end
  
  def new
    @user = User.new    
  end

  def create
    @user = User.create(user_params)
    redirect_to user_path(@user)
  end

  def edit
  end
  
  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    recipes = @user.recipes
    #destroying all recipe ingredients to each
    #   recipe
    recipes.each do |r|
      r.recipe_ingredients.destroy_all
    end
    #destroy all related recipes
    recipes.destroy_all
    #destroy all related allergies
    @user.allergies.destroy_all
    @user.destroy
    redirect_to users_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name,ingredient_ids: [])
  end
end
