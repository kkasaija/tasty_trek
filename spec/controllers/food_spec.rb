require 'rails_helper'

RSpec.describe FoodController, type: :controller do
  let(:user) { User.create(name: 'Kasaija Kenneth') }
  let(:food) do
    Food.create(name: 'Rolex',
                measurement_unit: 'kilograms',
                price: 45,
                quantity: 4,
                user:)
  end

  describe '#index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe '#new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe '#create' do
    it 'creates a new food' do
      expect do
        post :create, params: { food: { name: 'Rolex',
                                        measurement_unit: 'kilograms',
                                        price: 45,
                                        quantity: 4,
                                        user: } }
      end.to change(Food, :count).by(1)
    end
  end
end
