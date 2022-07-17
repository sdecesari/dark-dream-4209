require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe "model method" do 
    it "has total_cost" do 
      italian = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      greek = Recipe.create!(name: "Gyro", complexity: 3, genre: "Greek")

      pasta = Ingredient.create!(name: "Pasta", cost: 1)
      meat = Ingredient.create!(name: "Meat", cost: 2)
      cheese = Ingredient.create!(name: "Cheese", cost: 3)

      RecipeIngredient.create!(recipe: italian, ingredient: pasta)
      RecipeIngredient.create!(recipe_id: italian.id, ingredient_id: meat.id)
      RecipeIngredient.create!(recipe_id: italian.id, ingredient_id: cheese.id)

      expect(italian.total_cost).to eq(6)
    end 
  end
end

