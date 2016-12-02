require 'spec_helper'
require 'web-helper'

feature 'Existing emails' do
  scenario "I want not to be able to sign up with an existing email" do
    sign_up
    expect{sign_up}.to_not change(User, :count)
    expect(page).to have_content "Email is already taken"
  end
end
