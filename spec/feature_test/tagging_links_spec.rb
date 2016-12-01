require 'spec_helper'

feature "should see form" do
  before(:each) do
    Link.create(url: "www.yahoo.com", title: 'Yahoo', tags: [Tag.first_or_create(name: 'oldsearch')])
    Link.create(url: 'www.askjeeves.com', title: 'Jeeves', tags: [Tag.first_or_create(name: 'oldsearch')])
    Link.create(url: 'www.meditation.com', title: 'soothing', tags: [Tag.first_or_create(name: 'personal')])
  end


  scenario "When a user visits /links should see" do

      visit '/tags/oldsearch'
      expect(page.status_code).to eq(200)
      within 'ol#links' do
        expect(page).not_to have_content('soothing')
        expect(page).to have_content('Yahoo')
        expect(page).to have_content('Jeeves')
      end


  end

end
