require 'rails_helper'

RSpec.feature "Search event", type: :feature do
	def hat_links
    page.all(:css, "h4").map(&:text)
  end

  scenario 'user can search event on homepage' do
  	a = Event.create!(name: "test", starts_at: 2.days.ago, ends_at: 1.day.from_now, extended_html_description: "a past event",
		                venue: Venue.new, category: Category.new)
  	visit root_path
  	fill_in 'search', with: 'test\n'
  	expect(hat_links).to include("test")
  end
end
