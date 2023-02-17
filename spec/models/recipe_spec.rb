require 'rails_helper'
RSpec.describe Recipe, type: :model do

  before :all do
    @user = User.create!(name: 'Kisembo Isingoma', email: 'kjohn@gmail.com', password: '123456', role: 'admin')
    @recipe = Recipe.create!(user: @user, name: 'Oranges', preparation_time: '10:1:23', cooking_time: '10:05:20',
                         description: 'Best served chilled!', public: false)
  end

  context 'Testing Validations' do
    it 'is valid with valid attributes' do
      expect(@recipe).to be_valid
    end

    it 'is not valid without a name' do
      @recipe.name = nil
      expect(@recipe).to_not be_valid
    end

    it 'is not valid without a preparation_time' do
      @recipe.preparation_time = nil
      expect(@recipe).to_not be_valid
    end

    it 'is not valid without a cooking_time' do
      @recipe.cooking_time = nil
      expect(@recipe).to_not be_valid
    end

    it 'is not valid without a description' do
      @recipe.description = nil
      expect(@recipe).to_not be_valid
    end
  end

  context 'Testing Associations' do
    it 'has_many recipes' do
      assoc = Recipe.reflect_on_association(:recipe_food)
      expect(assoc.macro).to eq :has_many
    end

    it 'belongs_to user' do
      assoc = Recipe.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end