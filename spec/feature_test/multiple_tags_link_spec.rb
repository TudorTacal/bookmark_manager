require 'spec_helper'

feature "can input multiple tages" do

  scenario "I should be able to add multiple tags to one link" do
      visit '/links/new'
      fill_in 'title', with: 'This is Bing'
      fill_in 'url', with: 'https://www.bing.com'
      fill_in 'name', with: 'search microsoft'
      click_button 'Create new link'
      link = Link.first
      expect(link.tags.map(&:name)).to include('search', 'microsoft')
      within 'ol#links' do
        expect(page).to have_content("Bing")
      end
  end
end
