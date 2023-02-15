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

  describe '#has a measurenent unit' do
    it 'returns true' do
      expect(food.measurement_unit).to be valid
    end
  end
end
