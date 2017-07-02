require 'rails_helper'

RSpec.feature "Search event", type: :feature do
	def hat_links
    page.all(:css, "h4").map(&:text)
  end

  scenario 'user can search event on homepage' do
  	a = FactoryGirl.create :test_event, :publish
  	visit root_path
  	fill_in 'search', with: 'test\n'
  	expect(hat_links).to include("test")
  end
end
