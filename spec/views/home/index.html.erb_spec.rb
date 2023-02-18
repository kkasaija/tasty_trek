require 'rails_helper'

RSpec.describe 'home/index.html.erb', type: :view do
  scenario 'User signs in' do
    visit '/'
    expect(page).to have_current_path('/users/sign_in')
    expect(page).to have_content 'Sign in'
  end
end
