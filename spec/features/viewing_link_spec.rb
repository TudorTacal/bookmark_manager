require 'spec_helper'
require './models/link.rb'


RSpec.feature "BookmarkManager" do
  scenario "Users see a list of links from database" do
    DatabaseCleaner.strategy = :truncation
    Link.create(url: 'www.makersacademy.com', title: 'Makers')
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('www.makersacademy.com')
    end
    DatabaseCleaner.clean
  end
end
