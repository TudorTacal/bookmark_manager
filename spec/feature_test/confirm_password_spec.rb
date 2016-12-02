require 'spec_helper'
require_relative '../web-helper.rb'

def failed_sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in 'email', with: 'user@email.com'
  fill_in 'password',  with: 'password'
  fill_in 'password_confirmation', with: 'passwords'
  click_button "Sign up"
end

feature 'password confirmation' do
  scenario "I want to see a password confirmation that needs to match" do
    failed_sign_up
    expect{ failed_sign_up }.to change(User, :count).by(0)
    expect(page.current_path).to eq('/users')
    expect(page).to have_content "Password does not match the confirmation"
  end
end
