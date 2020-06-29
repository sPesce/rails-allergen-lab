# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#ingredient
#allergy
#user
#recipe
#recipeIngredient
models = [RecipeIngredient,Allergy,Recipe,User,Ingredient]

models.each do |m|
  m.destroy_all
end


recipe = Recipe.create(name: "Huevos Rancheros")
egg = Ingredient.create(name: "Egg")
recipe.ingredients << egg

user = User.create(name: "Chef Bob")
user.recipes << recipe
carrots = Ingredient.create(name: "Carrots")
user.allergic_to << carrots

15.times do
  Ingredient.create(name: Faker::Food.ingredient)
end


