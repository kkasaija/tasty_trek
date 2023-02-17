require 'rails_helper'

RSpec.describe 'Food', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Jolly', email: 'jolly@gmail.com', password: '123456') }
  let(:food) { user.foods.create(name: 'apple', measurement_unit: 'kg', price: 4) }

  describe 'GET /foods' do
    before do
      sign_in user
      get foods_path
    end

    it 'should return a list of foods' do
      expect(response).to have_http_status(200)
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'responds to html' do
      expect(response.content_type).to include 'text/html'
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET /new' do
    before do
      sign_in user
      get new_food_path
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end

    it 'renders the new template' do
      expect(response).to render_template('new')
    end
  end
end