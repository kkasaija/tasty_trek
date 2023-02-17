require 'rails_helper'

RSpec.describe 'Food', type: :request do
  include Devise::Test::IntegrationHelpers

  @user = User.create!(name: 'Jolly', email: 'jjolly@gmail.com', password: '123456')
  @food = @user.foods.create!(name: 'apple', measurement_unit: 'kg', price: 4, quantity: 78)

  describe 'GET /index' do
    before do
      get food_index_path
    end

    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
  end

  describe 'GET /new' do
    before do
      get new_food_path
    end

    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end