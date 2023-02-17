require 'rails_helper'
RSpec.describe Recipe, type: :model do

  before :all do
    @user = User.create!(name: 'Kisembo John', email: 'johnk@gmail.com', password: '123456', role: 'admin')
    @recipe = Recipe.new(user: @user, name: 'Oranges', preparation_time: 10, cooking_time: 1,
                         description: 'Best served chilled!', public: false)
  end

  context 'Testing Validations' do
    it 'is valid with valid attributes' do
      expect(@user).to be_valid
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

end