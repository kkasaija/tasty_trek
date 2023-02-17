require 'rails_helper'

RSpec.describe Food, type: :model do
  before :each do
    @user = User.create!(name: 'Kasaija Kenneth', email: 'kasaijak@gmail.com', password: '123456', role: 'admin')
    @food = Food.new(name: 'Rolex', measurement_unit: 'kilograms', price: 45, quantity: 4, user: @user)
  end

  context 'Test Validations' do
    it 'is valid with valid attributes' do
      expect(@food).to be_valid
    end

    it 'is not valid without a name' do
      @food.name = nil
      expect(@food).to_not be_valid
    end

    it 'is not valid without mesurement_unit' do
      @food.measurement_unit = nil
      expect(@food).to_not be_valid
    end

    it 'is not valid without price' do
      @food.price = nil
      expect(@food).to_not be_valid
    end

    it 'is not valid without quantity' do
      @food.quantity = nil
      expect(@food).to_not be_valid
    end

    it 'is not valid without user' do
      @food.user = nil
      expect(@food).to_not be_valid
    end
  end

  context 'Test Associations' do
    it 'has_many recipes' do
      assoc = Food.reflect_on_association(:recipe_food)
      expect(assoc.macro).to eq :has_many
    end
    it 'belongs_to user' do
      assoc = Food.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end
