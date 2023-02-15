require 'rails_helper'

RSpec.describe Food, type: :model do
  let!(:user) { User.create(name: 'Kasaija Kenneth') }
  let!(:food) do
    Food.create(name: 'Rolex',
                measurement_unit: 'kilograms',
                price: 45,
                quantity: 4,
                user:)
  end

  describe '#describes food model' do
    it 'returns measurement_unit as kilograms' do
      expect(food.measurement_unit).to eq('kilograms')
    end

    it 'user name field to have a value' do
      food.user = user
      expect(food.user).to eq user
    end

    it 'user name field can not be empty' do
      expect(food.user).to be_valid
    end
  end
end
