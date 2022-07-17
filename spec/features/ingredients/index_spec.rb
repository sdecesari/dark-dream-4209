require 'rails_helper'

RSpec.describe "ingredient index page" do 
   it "shows the names of all the recipes and the number of ingredients" do 
      italian = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      greek = Recipe.create!(name: "Gyro", complexity: 3, genre: "Greek")

      pasta = Ingredient.create!(name: "Pasta", cost: 1)
      meat = Ingredient.create!(name: "Meat", cost: 2)
      cheese = Ingredient.create!(name: "Cheese", cost: 3)

      recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: italian.id, ingredient_id: pasta.id)
      recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: greek.id, ingredient_id: meat.id)
      recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: italian.id, ingredient_id: meat.id)
      recipe_ingredient_4 = RecipeIngredient.create!(recipe_id: greek.id, ingredient_id: cheese.id)

      visit "/ingredients"

      within "#ingredients-#{pasta.id}" do 
         expect(page).to have_content("Pasta: 1")
      end 

      within "#ingredients-#{meat.id}" do 
         expect(page).to have_content("Meat: 2")
      end 

      within "#ingredients-#{cheese.id}" do 
         expect(page).to have_content("Cheese: 1")
      end 
   end 
end 