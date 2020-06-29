class Ingredient < ApplicationRecord
  has_many :allergies
  has_many :recipe_ingredients
  has_many :users, through: :allergies
  has_many :recipes, through: :recipe_ingredients

  def allergic_count
    Allergy.where("ingredient_id = ?",self.id).count
  end

  def self.order_by_allergy_count
    Ingredient.left_outer_joins(:allergies).distinct.select(
      'ingredients.id, ingredients.name, COUNT(allergies.ingredient_id) AS allergies_count').group(
        'ingredients.id').order(allergies_count: :desc)
  end

end
