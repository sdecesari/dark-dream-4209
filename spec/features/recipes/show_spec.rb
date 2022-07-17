require 'rails_helper'

RSpec.describe "recipes show page" do 
   it "shows a list of the recipe's ingredients" do 
      italian = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      greek = Recipe.create!(name: "Gyro", complexity: 3, genre: "Greek")

      pasta = Ingredient.create!(name: "Pasta", cost: 1)
      meat = Ingredient.create!(name: "Meat", cost: 2)
      cheese = Ingredient.create!(name: "Cheese", cost: 3)

      recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: italian.id, ingredient_id: pasta.id)
      recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: greek.id, ingredient_id: meat.id)
      recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: italian.id, ingredient_id: meat.id)
      recipe_ingredient_4 = RecipeIngredient.create!(recipe_id: greek.id, ingredient_id: cheese.id)

      visit "/recipes/#{italian.id}"

      expect(page).to have_content("Pasta")
      expect(page).to have_content("Meat")
      expect(page).to_not have_content("Cheese")
   end 

   it "shows the total cost of all ingredients in the recipe" do 
      italian = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      greek = Recipe.create!(name: "Gyro", complexity: 3, genre: "Greek")

      pasta = Ingredient.create!(name: "Pasta", cost: 1)
      meat = Ingredient.create!(name: "Meat", cost: 2)
      cheese = Ingredient.create!(name: "Cheese", cost: 3)

      recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: italian.id, ingredient_id: pasta.id)
      recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: greek.id, ingredient_id: meat.id)
      recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: italian.id, ingredient_id: meat.id)
      recipe_ingredient_4 = RecipeIngredient.create!(recipe_id: greek.id, ingredient_id: cheese.id)

      visit "/recipes/#{italian.id}"

      expect(page).to have_content("Total Cost: 3")
   end 
   
end

