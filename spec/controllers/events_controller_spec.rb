require 'rails_helper'

RSpec.describe EventsController, type: :controller do

	it "gets index" do
		get 'index'
		expect(response).to be_success
	end

	it "gets show" do
		a = Event.create!(name: "test", starts_at: 2.days.ago, ends_at: 1.day.from_now, extended_html_description: "a past event",
		                venue: Venue.new, category: Category.new)

		get :show, id: a.id
		expect(response).to render_template(:show)
	end

end
