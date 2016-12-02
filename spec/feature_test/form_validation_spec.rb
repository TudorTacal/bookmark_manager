require 'spec_helper'

feature 'Form validation', type: :feature do
  scenario "I do not want to be able to sign up without an email " do
    def failed_sign_up
      visit '/users/new'
      expect(page.status_code).to eq(200)
      fill_in 'email', with: ''
      fill_in 'password',  with: 'password'
      fill_in 'password_confirmation', with: 'password'
      click_button "Sign up"
    end


    expect{ failed_sign_up }.to_not change(User, :count)
    expect(page.current_path).to eq '/users'
  end

  scenario "I want to sign up using the correct email format" do
    def failed_sign_up
      visit '/users/new'
      expect(page.status_code).to eq(200)
      fill_in 'email', with: 'test@test'
      fill_in 'password',  with: 'password'
      fill_in 'password_confirmation', with: 'password'
      click_button "Sign up"
    end

    expect{ failed_sign_up }.to_not change(User, :count)
    expect(page.current_path).to eq '/users'
  end
end
