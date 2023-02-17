require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before :each do
    @user = User.create!(name: 'Kisembo Jack', email: 'kisembo@gmail.com', password: '123456', role: 'admin')
    @food = Food.create!(name: 'Fish', measurement_unit: 'kilograms', price: 45, quantity: 4, user: @user)
    @recipe = Recipe.create!(user: @user, name: 'Oranges', preparation_time: '00:01:45', cooking_time: '00:10:00',
                             description: 'Best served chilled!', public: false)
    @recipe_food = RecipeFood.create!(recipe: @recipe, food: @food, quantity: 2)
  end

  context 'Testing Validations' do
    it 'is valid with valid attributes' do
      expect(@recipe_food).to be_valid
    end

    it 'is not valid without a quantity' do
      @recipe_food.quantity = nil
      expect(@recipe_food).to_not be_valid
    end

    it 'is not valid with a quantity greater than 1000' do
      @recipe_food.quantity = 1001
      expect(@recipe_food).to_not be_valid
    end

    it 'is not valid without a recipe_id' do
      @recipe_food.recipe_id = nil
      expect(@recipe_food).to_not be_valid
    end

    it 'is not valid without a food_id' do
      @recipe_food.food_id = nil
      expect(@recipe_food).to_not be_valid
    end
  end

  context 'Testing Associations' do
    it 'belongs_to recipe' do
      assoc = RecipeFood.reflect_on_association(:recipe)
      expect(assoc.macro).to eq :belongs_to
    end

    it 'belongs_to food' do
      assoc = RecipeFood.reflect_on_association(:food)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end
