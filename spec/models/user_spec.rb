require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create!(name: 'Kareem Wilson', email: 'wkareem@gmail.com', password: '123456', role: 'admin')
  end

  context 'validation tests' do
    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'is not valid without a name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid with a name longer than 30 characters' do
      @user.name = 'Rawlands Wamani Crane Collins Mark Hector'
      expect(@user).to_not be_valid
    end

    it 'is not valid without email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without password' do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without minimum password length' do
      @user.password = '123'
      expect(@user).to_not be_valid
    end
  end

  context 'Association tests' do
    it 'has_many foods' do
      assoc = User.reflect_on_association(:foods)
      expect(assoc.macro).to eq :has_many
    end

    it 'has_many recipes' do
      assoc = User.reflect_on_association(:recipes)
      expect(assoc.macro).to eq :has_many
    end
  end
end
