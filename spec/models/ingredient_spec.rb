require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end
  
  describe "model methods" do 
    it "#recipe_count" do 
      italian = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      greek = Recipe.create!(name: "Gyro", complexity: 3, genre: "Greek")
      thai = Recipe.create!(name: "Panang Curry", complexity: 4, genre: "Thai")

      ingredient = Ingredient.create!(name: "Meat", cost: 1)

      recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: greek.id, ingredient_id: ingredient.id)
      recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: italian.id, ingredient_id: ingredient.id)
      
      expect(ingredient.recipe_count).to eq 2
    end 
  end 
end
